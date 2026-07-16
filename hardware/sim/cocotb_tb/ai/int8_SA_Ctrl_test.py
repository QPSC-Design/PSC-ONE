# test_systolic_driver_2x2.py

import os
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

BASE_ADDR_A = 0x02000
BASE_ADDR_B = 0x04000
BASE_ADDR_C = 0x08000

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
# memory_driver
# ------------------------------

async def memory_driver(dut, mem):
    pending = False
    pending_addr = 0

    while True:
        await RisingEdge(dut.clock)

        # デフォルトは応答なし
        dut.rd_read_ready.value = 0
        dut.c_write_ready.value = 0

        # --------------------------------
        # READ response
        # 1クロック遅延で応答
        # --------------------------------
        if pending:
            dut.rd_read_data.value = mem.get(pending_addr, 0)
            dut.rd_read_ready.value = 1
            pending = False

        # 新しいREAD要求を受け付ける
        if int(dut.rd_read_valid.value):
            pending_addr = int(dut.rd_read_addr.value)
            pending = True

        # --------------------------------
        # WRITE
        # --------------------------------
        if int(dut.c_write_valid.value):
            addr = int(dut.c_write_addr.value)
            data = int(dut.c_write_wdata.value)

            mem[addr] = data
            dut.c_write_ready.value = 1

            dut._log.info(
                f"MEM WRITE addr=0x{addr:08X} "
                f"data=0x{data:08X}"
            )

# ------------------------------
# packing helpers
# ------------------------------

def pack_u8x4(values):
    assert len(values) == 4

    return sum(
        (int(value) & 0xFF) << (8 * index)
        for index, value in enumerate(values)
    )

def unpack_frame_to_list(frame):
    c0 = (frame >> 0) & 0xFFFF
    c1 = (frame >> 16) & 0xFFFF
    return [c0,c1]

async def dump_mem(dut, mem, MATRIX_N):
    dut._log.info(section("Memory A"))

    for i in range(MATRIX_N):
        addr = BASE_ADDR_A + 4 * i

        if addr in mem:
            dut._log.info(
                f"A[{i}]  addr=0x{addr:08X}  data=0x{mem[addr]:08X}"
            )

    dut._log.info(section("Memory B"))

    for i in range(MATRIX_N):
        addr = BASE_ADDR_B + 4 * i

        if addr in mem:
            dut._log.info(
                f"B[{i}]  addr=0x{addr:08X}  data=0x{mem[addr]:08X}"
            )

    dut._log.info(section("Memory C"))

    for i in range(MATRIX_N * MATRIX_N):
        addr = BASE_ADDR_C + 4 * i

        if addr in mem:
            dut._log.info(
                f"C[{i}]  addr=0x{addr:08X}  data=0x{mem[addr]:08X}"
            )

# ------------------------------
# main test
# ------------------------------


# =============================================
# 1st test
# =============================================
@cocotb.test()
async def test_systolic_array_driver_4x4(dut):

    dut._log.info("=============================================")

    # ==================
    MATRIX_N = 4
    CYCLE_N  = 2
    dut.matrix_size.value  = 4
    # ==================

    clock = Clock(dut.clock,10,unit="ns")
    cocotb.start_soon(clock.start())

    # reset
    dut.reset_n.value       = 0
    dut.sa_clear.value      = 0
    dut.rd_read_ready.value = 0
    dut.sa_state_reset.value = 0
    dut.sa_req_ready.value  = 1

    # mode
    dut.sa_os_instruction.value = 0b0000

    dut.BASE_ADDR_A.value = BASE_ADDR_A
    dut.BASE_ADDR_B.value = BASE_ADDR_B
    dut.BASE_ADDR_C.value = BASE_ADDR_C

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

    A_np = np.random.randint(1,10,(MATRIX_N,MATRIX_N))
    B_np = np.random.randint(1,10,(MATRIX_N,MATRIX_N))
    
    dut._log.info(section("Memory A"))
    dut._log.info(fmt_mat("A_np",A_np))
    
    dut._log.info(section("Memory B"))
    dut._log.info(fmt_mat("B_np",B_np))

    C_expected_blocks = np.zeros((MATRIX_N, MATRIX_N), dtype=int)
    dut._log.info(section("Memory C"))
    dut._log.info(fmt_mat("Memory C",C_expected_blocks))

    # ------------------------------
    # memory model
    # ------------------------------

    mem = {}

    # A: 4×4、1行 = 32bit
    for row in range(4):
        mem[BASE_ADDR_A + row * 4] = pack_u8x4([
            A_np[row][0],
            A_np[row][1],
            A_np[row][2],
            A_np[row][3],
        ])

    # B: 4×4、1行 = 32bit
    for row in range(4):
        mem[BASE_ADDR_B + row * 4] = pack_u8x4([
            B_np[row][0],
            B_np[row][1],
            B_np[row][2],
            B_np[row][3],
        ])

    # C
    for i in range(MATRIX_N*MATRIX_N):
        mem[BASE_ADDR_C + 4*i] = 0

    cocotb.start_soon(memory_driver(dut, mem))

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

    # dump
    await dump_mem(dut, mem, MATRIX_N)

    # Assert
    C_dut = np.zeros((MATRIX_N,MATRIX_N), dtype=int)

    for row in range(MATRIX_N):
        for col in range(MATRIX_N):
            addr = BASE_ADDR_C + (row * MATRIX_N + col) * 4
            word = mem[addr]

            # 演算結果が16bitの場合
            C_dut[row, col] = word & 0xFFFF

    # ------------------------------
    # result
    # ------------------------------

    for _ in range(10):
        await RisingEdge(dut.clock)

    C_exp = (
        A_np
        @ B_np
    )

    C_hw = C_dut

    dut._log.info(section("assert"))

    dut._log.info(fmt_mat("Expected",C_exp))
    dut._log.info(fmt_mat("HW",C_hw))

    assert np.array_equal(C_hw, C_exp)

    dut._log.info("✅ PASS")

    for _ in range(100):
        await RisingEdge(dut.clock)

# =============================================
# 2nd test
# =============================================
@cocotb.test()
async def test_systolic_array_driver_8x8(dut):

    dut._log.info("\n")
    dut._log.info("=============================================")

    # ==================
    MATRIX_N = 8
    CYCLE_N  = 2
    dut.matrix_size.value  = 8
    # ==================

    clock = Clock(dut.clock,10,unit="ns")
    cocotb.start_soon(clock.start())

    # reset
    dut.reset_n.value       = 0
    dut.sa_clear.value      = 0
    dut.rd_read_ready.value = 0
    dut.sa_state_reset.value = 0
    dut.sa_req_ready.value  = 1

    # mode
    dut.sa_os_instruction.value = 0b0000

    dut.BASE_ADDR_A.value = BASE_ADDR_A
    dut.BASE_ADDR_B.value = BASE_ADDR_B
    dut.BASE_ADDR_C.value = BASE_ADDR_C

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

    A_np = np.random.randint(1,10,(MATRIX_N,MATRIX_N))
    B_np = np.random.randint(1,10,(MATRIX_N,MATRIX_N))
    
    dut._log.info(section("Memory A"))
    dut._log.info(fmt_mat("A_np",A_np))
    
    dut._log.info(section("Memory B"))
    dut._log.info(fmt_mat("B_np",B_np))

    C_expected_blocks = np.zeros((MATRIX_N, MATRIX_N), dtype=int)
    dut._log.info(section("Memory C"))
    dut._log.info(fmt_mat("Memory C",C_expected_blocks))

    # ------------------------------
    # memory model
    # ------------------------------

    mem = {}

    # A: 8×8、1行 = 2×32bit
    for row in range(8):
        # A[row][0:4]
        mem[BASE_ADDR_A + row * 8 + 0x00] = pack_u8x4([
            A_np[row][0],
            A_np[row][1],
            A_np[row][2],
            A_np[row][3],
        ])

        # A[row][4:8]
        mem[BASE_ADDR_A + row * 8 + 0x04] = pack_u8x4([
            A_np[row][4],
            A_np[row][5],
            A_np[row][6],
            A_np[row][7],
        ])

    # B: 8×8、1行 = 2×32bit
    for row in range(8):
        # A[row][0:4]
        mem[BASE_ADDR_B + row * 8 + 0x00] = pack_u8x4([
            B_np[row][0],
            B_np[row][1],
            B_np[row][2],
            B_np[row][3],
        ])

        # A[row][4:8]
        mem[BASE_ADDR_B + row * 8 + 0x04] = pack_u8x4([
            B_np[row][4],
            B_np[row][5],
            B_np[row][6],
            B_np[row][7],
        ])


    # C
    for i in range(MATRIX_N*MATRIX_N):
        mem[BASE_ADDR_C + 4*i] = 0

    cocotb.start_soon(memory_driver(dut, mem))

    # ------------------------------
    # start DUT
    # ------------------------------

    dut.start.value = 1
    await RisingEdge(dut.clock)
    dut.start.value = 0

    outputs = []
    prev_valid = 0

    timeout = 5000

    for _ in range(timeout):
        if dut.done.value == 1:
            break
        await RisingEdge(dut.clock)

    # ------------------------------
    # assemble matrix
    # ------------------------------

    # dump
    await dump_mem(dut, mem, MATRIX_N*2)

    # Assert
    C_dut = np.zeros((MATRIX_N,MATRIX_N), dtype=int)

    # C_dut
    for r in range(MATRIX_N):
        for c in range(MATRIX_N):
            offset = (r * MATRIX_N + c) * 4
            word = mem[BASE_ADDR_C + offset]
            C_dut[r, c] = word & 0xFFFF

    dut._log.info(section("assert"))

    C_exp = (
        A_np[0:MATRIX_N, 0:MATRIX_N]
        @ B_np[0:MATRIX_N, 0:MATRIX_N]
    )

    C_hw = C_dut[0:MATRIX_N, 0:MATRIX_N]

    for _ in range(100):
        await RisingEdge(dut.clock)

    dut._log.info(fmt_mat("Expected",C_exp))
    dut._log.info(fmt_mat("HW",C_hw))

    assert np.array_equal(C_hw, C_exp)

    dut._log.info("✅ PASS")