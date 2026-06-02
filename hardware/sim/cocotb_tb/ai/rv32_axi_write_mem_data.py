# =========================================================
# cocotb: AXI4 (16-bit) に 16-bit ワード列を書き込み
#   - AW:  addr+len/size/burst を提示 → AWREADY でハンドシェイク
#   - W :  data/wstrb/wlast 提示 → WREADY でハンドシェイク
#   - B :  BVALID 待ち → BREADY で応答
#   - end_at_line: 入力ファイルの行番号で停止（1始まり）
#   - max_words  : 書き込みワード数で停止
# =========================================================
import cocotb
from cocotb.triggers import RisingEdge, Timer


def _h(node, name: str):
    try:
        return getattr(node, name)
    except AttributeError:
        raise AttributeError(f"[push_words_to_axi16] 信号 '{name}' が見つかりません。探索ルート={node._name}")


def _axi(node, prefix: str, suffix: str):
    return _h(node, f"{prefix}_{suffix}")


def _parse_hex_file(path: str) -> list[int]:
    """HEXファイルを読み込んで16-bitワード配列に変換。"""
    words = []
    with open(path, "r") as f:
        for line in f:
            h = line.strip().replace("_", "")
            if not h:
                continue
            words.append(int(h, 16) & 0xFFFF)  # 16-bit 切り詰め
    return words


async def _axi_write16_single(dut, node, clk, prefix: str, addr: int, data16: int, awid: int = 0):
    """AXI16 単発(1beat)ライト: addr(バイトアドレス), data16(16-bit)"""
    # ---- 取得（AW/W/B）----
    awid_s   = _axi(node, prefix, "awid")
    awaddr_s = _axi(node, prefix, "awaddr")
    awlen_s  = _axi(node, prefix, "awlen")
    awsize_s = _axi(node, prefix, "awsize")
    awburst_s= _axi(node, prefix, "awburst")
    awvalid_s= _axi(node, prefix, "awvalid")
    awready_s= _axi(node, prefix, "awready")

    wdata_s  = _axi(node, prefix, "wdata")
    wstrb_s  = _axi(node, prefix, "wstrb")
    wlast_s  = _axi(node, prefix, "wlast")
    wvalid_s = _axi(node, prefix, "wvalid")
    wready_s = _axi(node, prefix, "wready")

    bresp_s  = _axi(node, prefix, "bresp")
    bvalid_s = _axi(node, prefix, "bvalid")
    bready_s = _axi(node, prefix, "bready")

    # ---- 既定値を落としておく ----
    awvalid_s.value = 0
    wvalid_s.value  = 0
    wlast_s.value   = 0
    bready_s.value  = 0
    await RisingEdge(clk)

    # ---- AW: アドレス発行 ----
    awid_s.value    = awid & ((1 << len(awid_s)) - 1) if len(awid_s) > 0 else 0
    awaddr_s.value  = addr & ((1 << len(awaddr_s)) - 1)
    awlen_s.value   = 0       # 1beat → len=0
    awsize_s.value  = 1       # 2バイト/beat
    awburst_s.value = 1       # INCR
    awvalid_s.value = 1

    while int(awready_s.value) == 0:
        await RisingEdge(clk)
    await RisingEdge(clk)
    awvalid_s.value = 0

    # ---- W: データ発行 ----
    wdata_s.value  = data16 & 0xFFFF
    wstrb_s.value  = 0b11
    wlast_s.value  = 1
    wvalid_s.value = 1
    while int(wready_s.value) == 0:
        await RisingEdge(clk)
    await RisingEdge(clk)
    wvalid_s.value = 0
    wlast_s.value  = 0

    # ---- B: 応答 ----
    bready_s.value = 1
    while int(bvalid_s.value) == 0:
        await RisingEdge(clk)
    resp = int(bresp_s.value)
    if resp != 0:
        dut._log.warning(f"[push_words_to_axi16] BRESP={resp} @0x{addr:08X}")
    await RisingEdge(clk)
    bready_s.value = 0


async def push_words_to_axi16_from_file(
    dut,
    filename: str,
    base_addr: int = 0x0000,
    addr_stride: int = 1,            # 16bit幅なので2バイトずつ
    per_word_delay_ns: int = 0,
    end_at_line: int | None = None,  # ファイルの行番号で停止
    max_words: int | None = None,    # 実際の書き込みワード数で停止
    *,
    node=None,                       # 信号探索ルート（例: dut.u_core）
    prefix: str = "p_axi",           # "p_axi" / "d_axi"
    clk_name: str = "clock",
    awid: int = 0
):
    if node is None:
        node = dut
    clk = _h(node, clk_name)

    words = _parse_hex_file(filename)
    addr  = base_addr

    # 制御パラメータの正規化
    limit_line  = end_at_line if (isinstance(end_at_line, int) and end_at_line > 0) else None
    limit_words = max_words   if (isinstance(max_words, int)   and max_words > 0)   else None

    # ---- 書き込みループ ----
    for idx, w in enumerate(words, start=1):
        if limit_line is not None and idx > limit_line:
            dut._log.info(f"[push_words_to_axi16] reached end_at_line={limit_line}; stop writing.")
            break
        if limit_words is not None and idx > limit_words:
            dut._log.info(f"[push_words_to_axi16] reached max_words={limit_words}; stop writing.")
            break

        await _axi_write16_single(dut, node, clk, prefix, addr, w, awid=awid)

        addr += addr_stride
        if per_word_delay_ns > 0:
            await Timer(per_word_delay_ns, units="ns")

    dut._log.info("[push_words_to_axi16] write sequence completed.")
