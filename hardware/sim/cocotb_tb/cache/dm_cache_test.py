import cocotb
from cocotb.triggers import Timer, RisingEdge, ReadOnly

CLK_NS = 10

# ------------------------------------------------
# clock
# ------------------------------------------------
async def gen_clock(dut):
    while True:
        dut.clock.value = 0
        await Timer(CLK_NS // 2, unit="ns")
        dut.clock.value = 1
        await Timer(CLK_NS // 2, unit="ns")

# ------------------------------------------------
# TEST
# ------------------------------------------------
@cocotb.test()
async def axi_test1(dut):

    dut._log.info("==== cache_dma_controller test start ====")

    dut.program_mem_read_valid.value    = 0
    dut.cpu_program_addr.value          = 0

    cocotb.start_soon(gen_clock(dut))

    # reset
    dut.reset_n.value = 0
    for _ in range(5):
        await RisingEdge(dut.clock)
    dut.reset_n.value = 1

    for _ in range(5000):
        await RisingEdge(dut.clock)
