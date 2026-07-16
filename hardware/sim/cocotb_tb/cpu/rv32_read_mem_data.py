# =========================================================
# cocotb: SDRAM から任意アドレスをREADするヘルパ
#   - _valid は 1clk パルス
#   - パルス後は _ready が来るまで clk で while 待機
#   - 取得した (addr, data) を配列で返す
# =========================================================
import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.types import LogicArray

def int_resolved(sig_or_val, xfill="0") -> int:
    """
    cocotb BinaryValue を安全に int 化。
    X/Z は xfill('0' or '1') で解決してから読む。
    sig_or_val は signal でも .value でもOK。
    """
    bv = sig_or_val.value if hasattr(sig_or_val, "value") else sig_or_val
    try:
        return int(bv)
    except ValueError:
        s = bv.binstr.replace("x", xfill).replace("z", xfill)
        return int(s, 2)

# ==== 信号名マッピング（環境に合わせて変更OK）====
SIG_R_VALID = "cocotb_read_valid"
SIG_R_READY = "cocotb_read_ready"
SIG_R_ADDR  = "cocotb_read_addr"
SIG_R_DATA  = "cocotb_read_data"
SIG_CLK     = "clock"
# （WRITE側の req_ready が READ 完了通知も兼ねるなら下も使う）
SIG_REQ_READY = "cocotb_req_ready"
# =========================================================

def _get_sig(dut, name: str):
    if not name:
        return None
    try:
        return getattr(dut, name)
    except AttributeError:
        raise AttributeError(f"[read_words_from_addrs] DUT に信号 '{name}' が見つかりません。")

async def read_words_from_addrs(
    dut,
    addrs: list[int],
    per_read_delay_ns: int = 0,
    ready_timeout_cycles: int = 200,  # ★ 最大待ちクロック（既定 200）
) -> list[tuple[int, int]]:
    """
    指定アドレス列 addrs を順に READ し、(addr, data16) のリストで返す。
    - read_valid を 1clk パルス
    - その後 read_ready を待機（level wait, 最大 ready_timeout_cycles）
    """
    sig_r_valid = _get_sig(dut, SIG_R_VALID)
    sig_r_ready = _get_sig(dut, SIG_R_READY)
    sig_r_addr  = _get_sig(dut, SIG_R_ADDR)
    sig_r_data  = _get_sig(dut, SIG_R_DATA)
    clk         = _get_sig(dut, SIG_CLK)
    sig_req_rdy = _get_sig(dut, SIG_REQ_READY)

    # 初期化＆境界合わせ
    sig_r_valid.value = 0
    await RisingEdge(clk)

    results: list[tuple[int, int]] = []

    for a in addrs:
        # アドレス提示
        sig_r_addr.value = int(a)

        # （IFによっては req_ready 低→高 も待つ）
        while int(sig_req_rdy.value) == 0:
            await RisingEdge(clk)

        # ---- valid を 1clk パルス ----
        sig_r_valid.value = 1
        await RisingEdge(clk)     # ← ちょうど1周期だけ High
        sig_r_valid.value = 0

        # ---- _ready が来るまで待つ（最大 ready_timeout_cycles）----
        waited = 0
        while int(sig_r_ready.value) == 0:
            await RisingEdge(clk)
            waited += 1
            if waited >= ready_timeout_cycles:
                assert False, (
                    f"[read_words_from_addrs] timeout: read_ready stayed 0 for "
                    f"{ready_timeout_cycles} cycles (addr=0x{int(a):X})"
                )

        # （IFによっては req_ready 低→高 も待つ）
        while int(sig_req_rdy.value) == 0:
            await RisingEdge(clk)

        # データ取得（16bit想定）
        data16 = int_resolved(sig_r_data) & 0xFFFF
        results.append((int(a), data16))

        # インターバル（任意）
        if per_read_delay_ns > 0:
            await Timer(per_read_delay_ns, unit="ns")

    return results
