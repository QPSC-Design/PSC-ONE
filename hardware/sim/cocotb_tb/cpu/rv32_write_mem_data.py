# =========================================================
# cocotb: SDRAM へ 16-bit ワード列を書き込み
#   - _valid は 1clk パルス
#   - パルス後は _ready が来るまで clk で while で待機
#   - end_at_line: 1始まりの行番号まで書き込む（含む）。None/<=0 なら全行。
# =========================================================
import cocotb
from cocotb.triggers import RisingEdge, Timer

# ==== 信号名マッピング（あなたのDUT名に合わせ済み）====
SIG_REQ_READY = "cocotb_req_ready"
SIG_VALID     = "cocotb_write_valid"
SIG_READY     = "cocotb_write_ready"
SIG_ADDR      = "cocotb_write_addr"
SIG_DATA      = "cocotb_write_data"
SIG_CLK       = "clock"
# =========================================================

def _get_sig(dut, name: str):
    try:
        return getattr(dut, name)
    except AttributeError:
        raise AttributeError(f"[push_words_to_sdram] DUT に信号 '{name}' が見つかりません。")

def _parse_hex_file(path: str) -> list[int]:
    words = []
    with open(path, "r") as f:
        for line in f:
            h = line.strip().replace("_", "")
            if not h:
                continue
            words.append(int(h, 16) & 0xFFFF)
    return words

async def push_words_to_sdram_from_file(
    dut,
    filename: str,
    base_addr: int = 0x0000,
    addr_stride: int = 2,          # バイトアドレスなら 2
    per_word_delay_ns: int = 0,
    end_at_line: int | None = None # ★ 1始まり。None/<=0 なら全行
):
    sig_req_ready = _get_sig(dut, SIG_REQ_READY)
    sig_valid = _get_sig(dut, SIG_VALID)
    sig_ready = _get_sig(dut, SIG_READY)
    sig_addr  = _get_sig(dut, SIG_ADDR)
    sig_data  = _get_sig(dut, SIG_DATA)
    clk       = _get_sig(dut, SIG_CLK)

    # 初期化＆境界合わせ
    sig_valid.value = 0
    await RisingEdge(clk)

    words = _parse_hex_file(filename)
    addr  = base_addr

    # end_at_line の正規化
    limit = None
    if isinstance(end_at_line, int) and end_at_line > 0:
        limit = end_at_line

    for idx, w in enumerate(words, start=1):
        # ---- 指定行まで（含む）書いたら停止 ----
        if limit is not None and idx > limit:
            dut._log.info(f"[push_words_to_sdram] reached end_at_line={limit}; stop writing.")
            break

        # アドレス/データを提示
        sig_addr.value = addr
        sig_data.value = w & 0xFFFF

        # 必要なら req_ready も待つ
        while int(sig_req_ready.value) == 0:
            await RisingEdge(clk)

        # ---- valid を 1clk パルス ----
        sig_valid.value = 1
        await RisingEdge(clk)      # ← 1周期だけ High
        sig_valid.value = 0

        # ---- _ready が来るまで待つ（レベル待ち）----
        while int(sig_ready.value) == 0:
            await RisingEdge(clk)

        # 必要なら req_ready も待つ
        while int(sig_req_ready.value) == 0:
            await RisingEdge(clk)

        # 次ワードへ
        addr += addr_stride
        if per_word_delay_ns > 0:
            await Timer(per_word_delay_ns, unit="ns")

    sig_valid.value = 0