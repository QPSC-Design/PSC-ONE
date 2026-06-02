# test_pe_seri_nbit.py
import os
import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer
from cocotb.handle import SimHandleBase
from cocotb.types import LogicArray

# ---------- Utils ----------
def int_resolved(sig):
    try:
        return int(sig.value)
    except:
        return 0

def get_sig(dut, *names):
    """dut から最初に見つかったシグナルを返す。"""
    for n in names:
        if hasattr(dut, n):
            return getattr(dut, n)
    raise AttributeError(f"Signal not found among: {names}")

async def wait_level(sig, level: int, clock, timeout_cycles: int | None = None) -> bool:
    """
    sig の値が level(0/1) になるまで待つ。timeout_cycles が None でない場合、超えたら False を返す。
    """
    waited = 0
    while int_resolved(sig) != (1 if level else 0):
        await RisingEdge(clock)
        waited += 1
        if timeout_cycles is not None and waited >= timeout_cycles:
            return False
    return True

@cocotb.test()
async def test_pe_seri_nbit_multiple(dut):
    """
    PE_Seri_Nbit を 20 ケースで検証（unsigned）。
      * A/B の取り込み（RIGHT/B_SHIFT）と start を同じサイクルで打たない
        -> 取り込み1clk の「次のクロック」で start を 1clk パルス
    """

    # ---- Clock ----
    clk_sig = get_sig(dut, "clock", "Clock")
    clock = Clock(clk_sig, 10, unit="ns")  # 100 MHz
    cocotb.start_soon(clock.start())

    # ---- Reset & init ----
    reset_n = get_sig(dut, "reset_n", "reset_n")
    data_clear        = get_sig(dut, "data_clear")
    en_b_shift_bottom = get_sig(dut, "en_b_shift_bottom")
    en_shift_right    = get_sig(dut, "en_shift_right")
    en_shift_bottom   = get_sig(dut, "en_shift_bottom")
    start             = get_sig(dut, "start")

    a_in  = get_sig(dut, "a_in")
    b_in  = get_sig(dut, "b_in")
    ps_in = get_sig(dut, "ps_in")

    ps_out = get_sig(dut, "sum_to_bottom")
    ps_acc = get_sig(dut, "ps_acc")

    # Zero all controls/inputs
    reset_n.value = 0
    data_clear.value = 0
    en_b_shift_bottom.value = 0
    en_shift_right.value = 0
    en_shift_bottom.value = 0
    start.value = 0
    a_in.value = 0
    b_in.value = 0
    ps_in.value = 0
    await Timer(50, unit="ns")

    reset_n.value = 1
    await RisingEdge(clk_sig)

    # ---- Bit widths from DUT ----
    DW = len(a_in)                 # A/B width
    SW = len(ps_out)               # partial sum width
    PW = 2 * DW                    # expected product width（DUTも同等想定）
    maskSW = (1 << SW) - 1

    dut._log.info(f"Detected widths: DW={DW}, PW={PW}, SW={SW}")

    # ---- Test patterns ----
    random.seed(int(os.getenv("PE_SEED", "1234")))
    tests = []

    # 固定パターン
    tests += [
        (0, 0, 0),
        (1, 1, 0),
        (1, 1, 0),
        (1, 1, 0),
        (3, 3, 0),
        (13, 22, 0),
        (13, 22, 0),
        (255, 1, 0),
        (1, 1, 0),
        (1, 255, 0),
        (1, 1, 2),
        (3, 3, 13),
        ((1 << (DW-1)) - 1, 2, 0),          # max/2
        ((1 << DW) - 1, (1 << DW) - 1, 0),  # full max
        (5, 7, 3),
    ]

    # ランダム（unsigned）
    max_val = (1 << DW) - 1
    max_ps  = min(maskSW, 1023)  # ps は控えめに
    for _ in range(4):
        a = random.randint(0, max_val)
        b = random.randint(0, max_val)
        p = random.randint(0, max_ps)
        tests.append((a, b, p))

    # -------------------
    # 単体演算テスト
    # ---- Run cases ----
    for idx, (aval, bval, psval) in enumerate(tests):

        # (optional) 内部演算系をクリアしてから開始したい場合はコメント解除
        data_clear.value = 1
        await RisingEdge(clk_sig)
        data_clear.value = 0

        # 1) A/B を取り込み（RIGHT/B_SHIFT を1clk）※startはまだ打たない
        a_in.value = aval
        b_in.value = bval
        ps_in.value = psval
        en_shift_right.value = 1       # A 左境界 -> a_reg
        en_b_shift_bottom.value = 1    # B 上境界 -> b_reg
        start.value = 0
        await RisingEdge(clk_sig)

        en_shift_right.value = 0
        en_b_shift_bottom.value = 0

        # 2) 次のクロックで start を 1clk パルス（a_reg/b_reg を確実に取り込んだ後に開始）
        start.value = 1
        await RisingEdge(clk_sig)
        start.value = 0

        # 3) 逐次乗算が完了するまで待つ（DW + α）
        ok_init = await wait_level(dut.done, 1, dut.clock, timeout_cycles=20)

        # 4) 部分和を下へ流す（この1回だけ product を注入）
        en_shift_bottom.value = 1
        await RisingEdge(clk_sig)
        en_shift_bottom.value = 0
        await RisingEdge(clk_sig)

        # 5) 期待値（wrap）
        expected = ((aval * bval) + psval) & maskSW
        got = int(ps_out.value)

        assert got == expected, \
            f"[{idx}] a={aval} b={bval} ps={psval} -> got {got} != exp {expected}"

        dut._log.info(f"✅ Pattern {idx} passed: {aval} * {bval} + {psval} = {got}")

    # -------------------
    # 累積テスト
    # ---- Run cases ----
    dut._log.info(f"============================================================")

    # (optional) 内部演算系をクリアしてから開始したい場合はコメント解除
    data_clear.value = 1
    await RisingEdge(clk_sig)
    data_clear.value = 0
    # 初期化
    got = 0

    for idx, (aval, bval, psval) in enumerate(tests):

        # (optional) 内部演算系をクリアしてから開始したい場合はコメント解除
        #data_clear.value = 1
        #await RisingEdge(clk_sig)
        #data_clear.value = 0

        # 1) A/B を取り込み（RIGHT/B_SHIFT を1clk）※startはまだ打たない
        a_in.value = aval
        b_in.value = bval
        ps_in.value = psval
        en_shift_right.value = 1       # A 左境界 -> a_reg
        en_b_shift_bottom.value = 1    # B 上境界 -> b_reg
        start.value = 0
        await RisingEdge(clk_sig)

        en_shift_right.value = 0
        en_b_shift_bottom.value = 0

        # 2) 次のクロックで start を 1clk パルス（a_reg/b_reg を確実に取り込んだ後に開始）
        start.value = 1
        await RisingEdge(clk_sig)
        start.value = 0

        # 3) 逐次乗算が完了するまで待つ（DW + α）
        ok_init = await wait_level(dut.done, 1, dut.clock, timeout_cycles=20)

        # 4) 部分和を下へ流す（この1回だけ product を注入）
        en_shift_bottom.value = 1
        await RisingEdge(clk_sig)
        en_shift_bottom.value = 0
        await RisingEdge(clk_sig)

        # 5) 期待値（wrap）
        expected = got + (aval * bval) & maskSW     # ps_inは加算しない
        got = int(ps_acc.value)

        assert got == expected, \
            f"[{idx}] a={aval} b={bval} ps={psval} -> got {got} != exp {expected}"

        dut._log.info(f"✅ Pattern {idx} passed: {aval} * {bval} + {psval} = {got}")

    dut._log.info("All patterns passed for PE_Seri_Nbit (unsigned).")
