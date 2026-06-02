import os
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

from cocotb_tb.rv32_axi_write_mem_data import push_words_to_axi16_from_file
from cocotb_tb.rv32_axi_read_mem_data import read_words_from_axi16_addrs

N = 2


async def ncycles(clock, n):
    for _ in range(n):
        await RisingEdge(clock)


def section(title):
    bar = "═" * len(title)
    return f"\n╔{bar}╗\n║{title}║\n╚{bar}╝"


def python_model(A, B):
    A = np.array(A)
    B = np.array(B)

    C = np.zeros((N, N), dtype=int)

    for i in range(N):
        for j in range(N):
            for k in range(N):
                C[i, j] += A[i, k] * B[k, j]

    return C

@cocotb.test()
async def test_systolic_array_driver_1read_2x2(dut):

    # ------------------------------------------------------------
    # test vectors
    # ------------------------------------------------------------

    A = np.random.randint(1, 38, (N, N))
    B = np.random.randint(1, 61, (N, N))

    C_expected = python_model(A, B)

    dut._log.info(section("Test Vectors"))
    dut._log.info(f"A=\n{A}")
    dut._log.info(f"B=\n{B}")
    dut._log.info(f"Expected=\n{C_expected}")

    # ------------------------------------------------------------
    # create mem files (32bit / row)
    # ------------------------------------------------------------

    mem_dir = os.path.join(os.path.dirname(__file__), "..", "mem_32bit")
    os.makedirs(mem_dir, exist_ok=True)

    a_path = os.path.join(mem_dir, "A_Data.mem")
    b_path = os.path.join(mem_dir, "B_Data.mem")

    # A rows
    a_words = []
    for r in range(N):
        a0 = int(A[r,0]) & 0xFF
        a1 = int(A[r,1]) & 0xFF
        word = (a1 << 8) | a0
        a_words.append(word)

    with open(a_path, "w") as f:
        for w in a_words:
            f.write(f"{w:08X}\n")

    # B rows
    b_words = []
    for r in range(N):
        b0 = int(B[r,0]) & 0xFF
        b1 = int(B[r,1]) & 0xFF
        word = (b1 << 8) | b0
        b_words.append(word)

    with open(b_path, "w") as f:
        for w in b_words:
            f.write(f"{w:08X}\n")

    # ------------------------------------------------------------
    # clock
    # ------------------------------------------------------------

    cocotb.start_soon(Clock(dut.clock, 10, unit="ns").start())

    # ------------------------------------------------------------
    # reset
    # ------------------------------------------------------------

    dut.reset_n.value = 0
    dut.sa_start.value = 0

    dut.BASE_ADDR_A.value = 0x0000
    dut.BASE_ADDR_B.value = 0x0010
    dut.BASE_ADDR_C.value = 0x0020

    await ncycles(dut.clock, 10)

    dut.reset_n.value = 1

    await ncycles(dut.clock, 20)

    # ------------------------------------------------------------
    # write A
    # ------------------------------------------------------------

    await push_words_to_axi16_from_file(
        dut,
        filename=a_path,
        base_addr=0x0000,
        max_words=len(a_words),
        addr_stride=4,   # ←重要
        node=dut,
        prefix="tb_axi",
        clk_name="clock",
    )

    # ------------------------------------------------------------
    # write B
    # ------------------------------------------------------------

    await push_words_to_axi16_from_file(
        dut,
        filename=b_path,
        base_addr=0x0010,
        max_words=len(b_words),
        addr_stride=4,   # ←重要
        node=dut,
        prefix="tb_axi",
        clk_name="clock",
    )

    await ncycles(dut.clock, 200)

    # ------------------------------------------------------------
    # start SA
    # ------------------------------------------------------------

    dut.sa_start.value = 1
    await RisingEdge(dut.clock)
    dut.sa_start.value = 0

    # ------------------------------------------------------------
    # wait done
    # ------------------------------------------------------------

    while int(dut.sa_done.value) == 0:
        await RisingEdge(dut.clock)

    await ncycles(dut.clock, 500)

    # ------------------------------------------------------------
    # debug read
    # ------------------------------------------------------------

    dut._log.info(section("Memory Dump"))

    addrs = [
        0x0000,
        0x0004,
        0x0010,
        0x0014,
        0x0020,
        0x0022,
        0x0024,
        0x0026,
        0x0028,
        0x002a,
    ]

    pairs = await read_words_from_axi16_addrs(dut, addrs, prefix="tb_axi")

    for addr, data in pairs:
        dut._log.info(f"READ addr=0x{addr:04X} data=0x{data:04X}")

    # ------------------------------------------------------------
    # read C
    # ------------------------------------------------------------

    pairs = await read_words_from_axi16_addrs(
        dut,
        [0x0020,0x0022,0x0024,0x0026],
        prefix="tb_axi"
    )

    mem = {a:d for a,d in pairs}

    C = np.zeros((2,2),dtype=int)

    C[0,1] = mem[0x0020]
    C[0,0] = mem[0x0022]
    C[1,1] = mem[0x0024]
    C[1,0] = mem[0x0026]

    dut._log.info(section("Result"))
    dut._log.info(f"Expected=\n{C_expected}")
    dut._log.info(f"C_got=\n{C}")

    assert np.array_equal(C, C_expected), "C mismatch"

    dut._log.info(section("TEST PASSED !!!"))

    await ncycles(dut.clock, 100)