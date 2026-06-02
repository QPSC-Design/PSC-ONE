# test_systolic_driver_2x2.py

import os
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

N = 2

# ------------------------------
# formatting
# ------------------------------

def section(title):
    bar = "═" * len(title)
    return f"\n╔{bar}╗\n║{title}║\n╚{bar}╝"

def fmt_mat(name, mat):
    return f"{name} =\n{np.array(mat, dtype=int)}"

def fmt_list(lst):
    return "[" + " ".join(f"{v:>5d}" for v in lst) + "]"

# ------------------------------
# python model (2x2)
# ------------------------------

def python_systolic_model(A,B):
    A = np.array(A,dtype=int)
    B = np.array(B,dtype=int)

    C = np.zeros((N,N),dtype=int)

    for i in range(N):
        for j in range(N):
            C[i,j] = int(sum(A[i,k]*B[k,j] for k in range(N)))

    return C

# ------------------------------
# packing helpers
# ------------------------------

def pack_row_8x2_to_u32(row):
    r0 = int(row[0]) & 0xFF
    r1 = int(row[1]) & 0xFF
    return (r1 << 8) | r0

def unpack_frame_to_list(frame):
    c0 = (frame >> 0) & 0xFFFF
    c1 = (frame >> 16) & 0xFFFF
    return [c0,c1]

# ------------------------------
# main test
# ------------------------------

@cocotb.test()
async def test_systolic_array_driver_2x2(dut):

    clock = Clock(dut.clock,10,unit="ns")
    cocotb.start_soon(clock.start())

    # reset
    dut.reset_n.value = 0

    # mode
    dut.sa_os_mode.value = 0    # 1: Output Stationary mode.

    dut.sa_req_ready.value      = 1
    dut.sa_state_reset.value    = 0

    dut.BASE_ADDR_A.value = 0x0000
    dut.BASE_ADDR_B.value = 0x0010
    dut.BASE_ADDR_C.value = 0x0020

    # start
    dut.start.value = 0

    for _ in range(5):
        await RisingEdge(dut.clock)

    dut.reset_n.value = 1

    for _ in range(5):
        await RisingEdge(dut.clock)

    # ------------------------------
    # generate matrices
    # ------------------------------

    A_np = np.random.randint(0,10,(N,N))
    B_np = np.random.randint(0,10,(N,N))

    C_expected = python_systolic_model(A_np,B_np)

    dut._log.info(section("Test Vectors"))
    dut._log.info(fmt_mat("A",A_np))
    dut._log.info(fmt_mat("B",B_np))
    dut._log.info(fmt_mat("Expected",C_expected))

    # ------------------------------
    # memory model
    # ------------------------------

    mem = {}

    base = 0

    # A
    for i in range(N):
        mem[0x0000 + 4*i] = pack_row_8x2_to_u32(A_np[i])

    # B
    for i in range(N):
        mem[0x0010 + 4*i] = pack_row_8x2_to_u32(B_np[i])

    # C
    for i in range(2*N):
        mem[0x0020 + 4*i] = 0

    # ------------------------------
    # memory driver
    # ------------------------------

    pending = False
    pending_addr = 0

    async def mem_driver():

        nonlocal pending,pending_addr

        while True:

            await RisingEdge(dut.clock)

            dut.rd_read_ready.value = 0
            dut.c_write_ready.value = 0

            # ----------------------------
            # READ response
            # ----------------------------
            if pending:
                data = mem.get(pending_addr,0)
                dut.rd_read_data.value = data
                dut.rd_read_ready.value = 1
                pending = False

            if int(dut.rd_read_valid.value) == 1:
                pending_addr = int(dut.rd_read_addr.value)
                pending = True

            # ----------------------------
            # WRITE model
            # ----------------------------
            if int(dut.c_write_valid.value) :
                
                dut.c_write_ready.value = 1

                addr = int(dut.c_write_addr.value)
                data = int(dut.c_write_wdata.value)

                mem[addr] = data

                dut._log.info(
                    f"MEM WRITE addr=0x{addr:08X} data=0x{data:08X}"
                )

    cocotb.start_soon(mem_driver())

    # ------------------------------
    # start DUT
    # ------------------------------

    dut.start.value = 1
    await RisingEdge(dut.clock)
    dut.start.value = 0

    outputs = []
    prev_valid = 0

    timeout = 2000

    for _ in range(timeout):
        if dut.done.value == 1:
            break
        await RisingEdge(dut.clock)

    # ------------------------------
    # assemble matrix
    # ------------------------------

    # mem dump
    dut._log.info(section("Memory A"))

    for i in range(N):
        addr = 0x0000 + 4*i
        dut._log.info(f"A[{i}]  addr=0x{addr:08X}  data=0x{mem[addr]:08X}")

    dut._log.info(section("Memory B"))

    for i in range(N):
        addr = 0x0010 + 4*i
        dut._log.info(f"B[{i}]  addr=0x{addr:08X}  data=0x{mem[addr]:08X}")

    dut._log.info(section("Memory C"))

    for i in range(2*N):
        addr = 0x0020 + 4*i
        dut._log.info(f"C[{i}]  addr=0x{addr:08X}  data=0x{mem[addr]:08X}")

    # Assert
    C_dut = np.zeros((N,N), dtype=int)

    # C[0,0]
    word = mem[0x0020]
    C_dut[0,0] =  word        & 0xFFFF
    # C[0,1]
    word = mem[0x0024]
    C_dut[0,1] =  word        & 0xFFFF
    # C[1,0]
    word = mem[0x0028]
    C_dut[1,0] =  word        & 0xFFFF
    # C[1,1]
    word = mem[0x002C]
    C_dut[1,1] =  word        & 0xFFFF

    dut._log.info(section("Results"))
    dut._log.info(fmt_mat("Expected",C_expected))
    dut._log.info(fmt_mat("HW",C_dut))

    assert np.array_equal(C_dut,C_expected)

    dut._log.info("✅ PASS")

    for _ in range(10):
        await RisingEdge(dut.clock)