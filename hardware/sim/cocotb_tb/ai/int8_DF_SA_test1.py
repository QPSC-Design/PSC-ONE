# test_systolic_array_2x2.py
import os
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

# ==============================
# Config via environment vars
# ==============================
VERBOSE = int(os.getenv("SA_VERBOSE", "0"))
DUMP_PE = int(os.getenv("SA_DUMP_PE", "0"))
SEED    = os.getenv("SA_SEED", None)

PIPELINE_WAIT  = int(os.getenv("SA_PIPE_WAIT", "5"))
SHIFT_DOWN_REP = int(os.getenv("SA_SHIFT_DOWN", "2"))

N = 2
DW = 8
SW = 16

np.set_printoptions(linewidth=120)

# ==============================
# Pretty log helpers
# ==============================
def section(title: str) -> str:
    bar = "═" * len(title)
    return f"\n╔{bar}╗\n║{title}║\n╚{bar}╝"

def fmt_mat(name: str, mat) -> str:
    return f"{name} =\n{np.array(mat, dtype=int)}"

def fmt_list(lst):
    return "[" + " ".join(f"{int(v):>5d}" for v in lst) + "]"

# ==============================
# Math model (2x2 matmul)
# ==============================
def python_systolic_model(A, B):
    A = np.array(A, dtype=int)
    B = np.array(B, dtype=int)
    C = np.zeros((N, N), dtype=int)
    for i in range(N):
        for j in range(N):
            C[i, j] = int(sum(A[i, k] * B[k, j] for k in range(N)))
    return C

# ==============================
# DUT helpers
# ==============================
def resolve_x(signal_handle):
    """Read int from cocotb signal; treat x/z as 0."""
    try:
        return int(signal_handle.value)
    except Exception:
        s = str(signal_handle.value).lower().replace("x", "0").replace("z", "0")
        try:
            return int(s, 2)
        except Exception:
            return 0

def get_bus_value(signal_handle):
    """Return bus value as int, replacing x/z with 0."""
    try:
        return int(signal_handle.value)
    except Exception:
        s = str(signal_handle.value).lower().replace("x", "0").replace("z", "0")
        try:
            return int(s, 2)
        except Exception:
            return 0

def pack_bus(values, width):
    """
    values[0] -> [width-1:0]
    values[1] -> [2*width-1:width]
    """
    bus = 0
    mask = (1 << width) - 1
    for i, v in enumerate(values):
        bus |= (int(v) & mask) << (i * width)
    return bus

def get_bus_slice(signal_handle, idx: int, width: int):
    val = get_bus_value(signal_handle)
    return (val >> (idx * width)) & ((1 << width) - 1)

def pe_dump(dut):
    """Dump internal PE a_reg / b_reg for 2x2 DUT."""
    a_matrix = []
    b_matrix = []

    for r in range(N):
        a_row = []
        b_row = []
        row_block = getattr(dut, f"ROW_BLOCK[{r}]")
        for c in range(N):
            col_block = getattr(row_block, f"COL_BLOCK[{c}]")
            pe = col_block.u_pe
            a_row.append(resolve_x(pe.a_reg))
            b_row.append(resolve_x(pe.b_reg))
        a_matrix.append(a_row)
        b_matrix.append(b_row)

    print(section("Current PE State"))
    print(">>> a_reg:")
    for r in range(N):
        print(" ", a_matrix[r])
    print("\n>>> b_reg:")
    for r in range(N):
        print(" ", b_matrix[r])
    print("")

# ==============================
# The cocotb test
# ==============================
@cocotb.test()
async def test_systolic_array_2x2(dut):
    """
    Shift-based testbench for 2x2 int8 systolic array.

    Flow:
    1) preload B from top
    2) stream A from left
    3) shift partial sums downward
    4) compare bottom outputs with Python model
    """

    # Seed
    if SEED is not None:
        try:
            np.random.seed(int(SEED))
            dut._log.info(f"Using fixed numpy seed: {SEED}")
        except Exception:
            dut._log.warning(f"Invalid SA_SEED={SEED}, ignoring.")

    # 1) Clock
    clock = Clock(dut.clock, 10, unit="ns")
    cocotb.start_soon(clock.start())

    # 2) Reset & init
    dut.reset_n.value = 0
    dut.data_clear.value = 1
    dut.en_b_shift_bottom.value = 0
    dut.en_shift_right.value = 0
    dut.en_shift_bottom.value = 0
    dut.start_pulse.value = 0

    dut.a_left_in_bus.value = 0
    dut.b_top_in_bus.value = 0
    dut.ps_top_in_bus_0.value = 0
    dut.ps_top_in_bus_1.value = 0

    for _ in range(5):
        await RisingEdge(dut.clock)

    dut.reset_n.value = 1
    dut.data_clear.value = 0

    for _ in range(3):
        await RisingEdge(dut.clock)

    # 3) Generate vectors
    A_np = np.random.randint(0, 64, (N, N))
    B_np = np.random.randint(0, 32, (N, N))
    C_expected = python_systolic_model(A_np, B_np)
    C_dut = np.zeros((N, N), dtype=int)

    dut._log.info(section("Test Vectors"))
    dut._log.info(fmt_mat("A", A_np))
    dut._log.info(fmt_mat("B", B_np))
    dut._log.info(fmt_mat("Expected = A×B", C_expected))

    # 4) Preload B from the top
    dut._log.info(section("Preload B (top-in, shift bottom)"))
    for row_i in range(N):
        # 上から流し込む順序は逆順
        b_vals = [int(B_np[N - 1 - row_i][c]) for c in range(N)]
        dut.b_top_in_bus.value = pack_bus(b_vals, 8)

        if VERBOSE:
            dut._log.info(f"[B load {row_i}/{N-1}] feed top ← B[{N-1-row_i}, :]")
            dut._log.info(f"  b_top_in = {fmt_list(b_vals)}")

        await RisingEdge(dut.clock)
        dut.en_b_shift_bottom.value = 1
        await RisingEdge(dut.clock)
        dut.en_b_shift_bottom.value = 0

    # B入力を消しておく
    dut.b_top_in_bus.value = 0

    if DUMP_PE:
        try:
            pe_dump(dut)
        except Exception as e:
            dut._log.warning(f"PE dump failed: {e}")

    # 5) Stream A and capture
    dut._log.info(section("Stream A & Capture"))

    steps_needed = N + (N - 1)   # 3 frames for 2x2
    outputs = []

    for row_i in range(steps_needed):
        # drive A from left
        a_vals = [int(A_np[row_i][r]) if row_i < N else 0 for r in range(N)]
        dut.a_left_in_bus.value = pack_bus(a_vals, 8)

        if VERBOSE:
            dut._log.info(
                f"[A step {row_i}/{steps_needed-1}] "
                f"a_left_in = {fmt_list(a_vals)}"
            )

        # A取り込み
        await RisingEdge(dut.clock)
        dut.en_shift_right.value = 1
        await RisingEdge(dut.clock)
        dut.en_shift_right.value = 0

        # 乗算開始パルス
        dut.start_pulse.value = 1
        await RisingEdge(dut.clock)
        dut.start_pulse.value = 0

        # 内部演算待ち
        for _ in range(PIPELINE_WAIT):
            await RisingEdge(dut.clock)

        # ps を下へ流す
        for _ in range(SHIFT_DOWN_REP):
            dut.en_shift_bottom.value = 1
            await RisingEdge(dut.clock)
            dut.en_shift_bottom.value = 0
            await RisingEdge(dut.clock)

        # settle
        #await RisingEdge(dut.clock)

        # bottom read
        C_tmp = [get_bus_slice(dut.ps_bottom_out_bus_0, idx=0, width=32),
                 get_bus_slice(dut.ps_bottom_out_bus_1, idx=0, width=32)]
        outputs.append(C_tmp)
        dut._log.info(f"bottom_out[{row_i}] = {fmt_list(C_tmp)}")

        # 2x2組み立て
        for col in range(N):
            row = row_i - col
            if 0 <= row < N:
                C_dut[row, col] = int(C_tmp[col])

        if VERBOSE:
            dut._log.info(fmt_mat(f"HW (so far @ step {row_i})", C_dut))

        if DUMP_PE:
            try:
                pe_dump(dut)
            except Exception:
                pass

    # A入力を消しておく
    dut.a_left_in_bus.value = 0

    # 6) Compare
    dut._log.info(section("Results"))
    dut._log.info(fmt_mat("HW (assembled)", C_dut))

    ok = np.array_equal(C_dut, C_expected)
    if not ok:
        diff = (C_dut - C_expected).astype(int)
        mism = [
            (i, j, int(C_dut[i, j]), int(C_expected[i, j]))
            for i in range(N) for j in range(N)
            if C_dut[i, j] != C_expected[i, j]
        ]
        dut._log.error(fmt_mat("DIFF (HW-Expected)", diff))
        dut._log.error(
            "MISMATCH @ " +
            ", ".join([f"({i},{j}): {got} != {exp}" for i, j, got, exp in mism])
        )

    assert ok, "Matrix mismatch"
    dut._log.info("✅ Test Passed! HW result matches Python model.")

    for _ in range(5):
        await RisingEdge(dut.clock)