# =========================================================
# cocotb: AXI4(16-bit) から任意アドレスを READ
#   - AR を単発発行 → ARREADY で握手
#   - R は RVALID を待ち、RREADY で受理（RLAST=1 を確認）
#   - 取得 (addr, data16) の配列を返す
# =========================================================
import cocotb
from cocotb.triggers import RisingEdge, Timer

def int_resolved(sig_or_val, xfill="0") -> int:
    """X/Z を xfill('0' or '1') で埋めてから int 化"""
    bv = sig_or_val.value if hasattr(sig_or_val, "value") else sig_or_val
    try:
        return int(bv)
    except ValueError:
        s = bv.binstr.replace("x", xfill).replace("z", xfill)
        return int(s, 2)

def _h(node, name: str):
    try:
        return getattr(node, name)
    except AttributeError:
        raise AttributeError(f"[axi16_read] 信号 '{name}' が見つかりません（探索ルート={node._name}）")

def _axi(node, prefix: str, suffix: str):
    return _h(node, f"{prefix}_{suffix}")

async def _axi_read16_single(
    dut, node, clk, prefix: str,
    addr: int, *, arid: int = 0,
    timeout_cycles: int = 200
) -> int:
    """AXI16 単発(1beat)リード: addr(バイトアドレス) → 16bit データを返す"""
    # ---- 取得（AR/R）----
    arid_s    = _axi(node, prefix, "arid")
    araddr_s  = _axi(node, prefix, "araddr")
    arlen_s   = _axi(node, prefix, "arlen")
    arsize_s  = _axi(node, prefix, "arsize")
    arburst_s = _axi(node, prefix, "arburst")
    arvalid_s = _axi(node, prefix, "arvalid")
    arready_s = _axi(node, prefix, "arready")

    rid_s     = _axi(node, prefix, "rid")
    rdata_s   = _axi(node, prefix, "rdata")
    rresp_s   = _axi(node, prefix, "rresp")
    rlast_s   = _axi(node, prefix, "rlast")
    rvalid_s  = _axi(node, prefix, "rvalid")
    rready_s  = _axi(node, prefix, "rready")

    # 既定値
    arvalid_s.value = 0
    rready_s.value  = 0
    await RisingEdge(clk)

    # ---- AR: 単発（LEN=0, SIZE=1(2B), BURST=INCR=01）----
    # ID 幅にマスク（幅0の可能性は低いがガード）
    try:
        idw = len(arid_s)
    except Exception:
        idw = 0
    arid_s.value    = (arid & ((1 << idw) - 1)) if idw > 0 else 0
    araddr_s.value  = addr & ((1 << len(araddr_s)) - 1)
    arlen_s.value   = 0
    arsize_s.value  = 1
    arburst_s.value = 1
    arvalid_s.value = 1

    # ARREADY ハンドシェイク
    waited = 0
    while int(arready_s.value) == 0:
        await RisingEdge(clk)
        waited += 1
        if waited >= timeout_cycles:
            arvalid_s.value = 0
            raise TestFailure(f"[axi16_read] timeout: ARREADY=0 addr=0x{addr:08X}")
    await RisingEdge(clk)  # 1拍後に落とす
    arvalid_s.value = 0

    # ---- R: 受理 ----
    rready_s.value = 1
    waited = 0
    while int(rvalid_s.value) == 0:
        await RisingEdge(clk)
        waited += 1
        if waited >= timeout_cycles:
            rready_s.value = 0
            raise TestFailure(f"[axi16_read] timeout: RVALID=0 addr=0x{addr:08X}")

    # データ取得
    data16 = int_resolved(rdata_s) & 0xFFFF
    resp   = int(rresp_s.value)
    last   = int(rlast_s.value)
    if resp != 0:
        dut._log.warning(f"[axi16_read] RRESP={resp} @0x{addr:08X}")
    if last != 1:
        dut._log.warning(f"[axi16_read] RLAST!=1 @0x{addr:08X}")

    await RisingEdge(clk)
    rready_s.value = 0
    return data16

async def read_words_from_axi16_addrs(
    dut,
    addrs: list[int],
    *,
    node=None,                 # 信号探索ルート（例: dut.u_core）未指定なら dut
    prefix: str = "p_axi",     # "p_axi" / "d_axi"
    clk_name: str = "clock",
    arid: int = 0,
    per_read_delay_ns: int = 0,
    timeout_cycles: int = 200
) -> list[tuple[int, int]]:
    """
    指定アドレス列を AXI16 単発 READ。[(addr, data16), ...] を返す。
    addr は **バイトアドレス**（16bit 幅なので偶数推奨）。
    """
    if node is None:
        node = dut
    clk = _h(node, clk_name)

    results: list[tuple[int, int]] = []
    for a in addrs:
        #if (a & 0x1) != 0:
        #    dut._log.warning(f"[axi16_read] addr not halfword-aligned: 0x{a:X}")
        d16 = await _axi_read16_single(dut, node, clk, prefix, a, arid=arid, timeout_cycles=timeout_cycles)
        results.append((int(a), d16))
        if per_read_delay_ns > 0:
            await Timer(per_read_delay_ns, units="ns")
    return results
