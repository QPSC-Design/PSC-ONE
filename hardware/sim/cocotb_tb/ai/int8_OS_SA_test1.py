import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

N = 2

ASSER_MODE = 1

# ==============================
# ログ整形
# ==============================
def log_section(dut, title):
    dut._log.info("")
    dut._log.info(f"=== {title} ===")

def log_matrix(dut, name, mat):
    dut._log.info(f"{name}:")
    for row in mat:
        dut._log.info("  " + " ".join(f"{int(v):4d}" for v in row))

def log_pe(dut):
    dut._log.info("PE:")
    for r in range(N):
        row = []
        for c in range(N):
            pe = dut.ROW_BLOCK[r].COL_BLOCK[c].u_pe
            row.append(int(pe.ps_acc.value))
        dut._log.info("  " + " ".join(f"{v:4d}" for v in row))

# ==============================
# ユーティリティ
# ==============================
def pack_bus(values, width):
    bus = 0
    mask = (1 << width) - 1
    for i, v in enumerate(values):
        bus |= (int(v) & mask) << (i * width)
    return bus

def python_model(A, B):
    C = np.zeros((N, N), dtype=int)
    for i in range(N):
        for j in range(N):
            C[i, j] = int(A[i, 0]*B[0, j] + A[i, 1]*B[1, j])
    return C

# ==============================
# テスト本体
# ==============================
@cocotb.test()
async def test_systolic_array_2x2(dut):

    # PE_CYCLE
    PE_CYCLE = int(dut.ROW_BLOCK[0].COL_BLOCK[0].u_pe.PE_CYCLE.value)

    # Clock
    clock = Clock(dut.clock, 10, unit="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut.reset_n.value           = 0
    dut.data_clear.value        = 1
    dut.en_b_shift_bottom.value = 0
    dut.en_shift_bottom.value   = 0
    dut.en_shift_right.value    = 0
    dut.start_pulse.value       = 0

    dut.a_left_in_bus.value     = 0
    dut.b_top_in_bus.value      = 0
    dut.ps_top_in_bus_0.value   = 0
    dut.ps_top_in_bus_1.value   = 0

    for _ in range(5):
        await RisingEdge(dut.clock)

    dut.reset_n.value           = 1
    dut.data_clear.value        = 0

    for _ in range(3):
        await RisingEdge(dut.clock)

    # ==============================
    # データ生成
    # ==============================
    A = np.random.randint(0, 64, (N, N))
    B = np.random.randint(0, 32, (N, N))
    C_expected = python_model(A, B)

    log_section(dut, "Test Vectors")
    log_matrix(dut, "A", A)
    log_matrix(dut, "B", B)
    log_matrix(dut, "Expected", C_expected)

    # ==============================
    # A/B 同時ストリーム（OS）
    # ==============================
    log_section(dut, "Stream")

    total_steps = 2 * N - 1

    for t in range(total_steps):

        # A
        a_vals = []
        for i in range(N):
            k = t - i
            a_vals.append(int(A[i][k]) if 0 <= k < N else 0)

        dut.a_left_in_bus.value = pack_bus(a_vals, 8)

        # B
        b_vals = []
        for j in range(N):
            k = t - j
            b_vals.append(int(B[k][j]) if 0 <= k < N else 0)

        dut.b_top_in_bus.value = pack_bus(b_vals, 8)

        # shift
        await RisingEdge(dut.clock)
        dut.en_shift_right.value        = 1
        dut.en_b_shift_bottom.value     = 1

        await RisingEdge(dut.clock)
        dut.en_shift_right.value        = 0
        dut.en_b_shift_bottom.value     = 0

        # MAC
        dut.start_pulse.value           = 1
        await RisingEdge(dut.clock)
        dut.start_pulse.value           = 0

        for _ in range(PE_CYCLE+3):    # tmp
            await RisingEdge(dut.clock)

        log_pe(dut)

    for _ in range(10):
        await RisingEdge(dut.clock)

    # ==============================
    # Flush（重要）
    # ==============================
    log_section(dut, "Flush")

    for _ in range(N):

        dut.a_left_in_bus.value = 0
        dut.b_top_in_bus.value = 0

        await RisingEdge(dut.clock)
        dut.en_shift_right.value = 1
        dut.en_b_shift_bottom.value = 1

        await RisingEdge(dut.clock)
        dut.en_shift_right.value = 0
        dut.en_b_shift_bottom.value = 0

        dut.start_pulse.value = 1
        await RisingEdge(dut.clock)
        dut.start_pulse.value = 0

        for _ in range(PE_CYCLE+5): # tmp
            await RisingEdge(dut.clock)

        log_pe(dut)

    # ==============================
    # 結果取得
    # ==============================
    log_section(dut, "Result")

    C_hw = np.zeros((N, N), dtype=int)

    for r in range(N):
        for c in range(N):
            pe = dut.ROW_BLOCK[r].COL_BLOCK[c].u_pe
            C_hw[r, c] = int(pe.ps_acc.value)

    log_matrix(dut, "HW", C_hw)

    ok = np.array_equal(C_hw, C_expected)

    if not ok:
        log_matrix(dut, "DIFF", C_hw - C_expected)

    if ASSER_MODE == 1:
        assert ok, "Matrix mismatch"

    dut._log.info("PASS")

    for _ in range(5):
        await RisingEdge(dut.clock)