# ===============================================================
#  NISHIHARU PSC_ONE_LCD cocotb TEST
# ===============================================================
import cocotb
from cocotb.triggers import Timer, RisingEdge, ReadOnly

CLK_NS = 10

SD_IF_DATA      = 0x1000_6000
SD_IF_SECTOR    = 0x1000_6004
SD_IF_CTRL      = 0x1000_6008


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
# reset
# ------------------------------------------------
async def reset_dut(dut):
    dut.reset_n.value = 0
    dut.cpu_rvalid.value = 0
    dut.cpu_raddr.value = 0
    dut.cpu_rdata.value = 0

    for _ in range(10):
        await RisingEdge(dut.clock)

    dut.reset_n.value = 1

    for _ in range(10):
        await RisingEdge(dut.clock)

# ------------------------------------------------
# monitor: state != ST_ERR
# ------------------------------------------------
async def monitor_no_sd_error(dut):
    while True:
        await RisingEdge(dut.clock)
        await ReadOnly()

        state = int(dut.u_sd.state.value)   # パスはRTL階層に合わせて修正

        if state == int(dut.u_sd.ST_ERROR.value):  # localparamが見えない場合は数値で
            raise AssertionError(f"SD controller entered ST_ERROR at time {cocotb.utils.get_sim_time('ns')} ns")

# ------------------------------------------------
# CPU MMIO read
# ------------------------------------------------
async def cpu_read(dut, addr, timeout=100):
    dut.cpu_raddr.value = addr

    dut.cpu_rvalid.value = 1
    await RisingEdge(dut.clock)
    dut.cpu_rvalid.value = 0

    for _ in range(timeout):
        await RisingEdge(dut.clock)
        await ReadOnly()

        if int(dut.cpu_rready.value) == 1:
            data = int(dut.cpu_rdata.value)
            break
    else:
        raise AssertionError(f"cpu_rready timeout addr=0x{addr:08x}")

    await RisingEdge(dut.clock)

    return data

# ------------------------------------------------
# CPU MMIO write
# ------------------------------------------------
async def cpu_write(dut, addr, data, timeout=100):
    dut.cpu_waddr.value = addr

    dut.cpu_wvalid.value = 1
    dut.cpu_wdata.value  = data
    await RisingEdge(dut.clock)
    dut.cpu_wvalid.value = 0

    for _ in range(timeout):
        await RisingEdge(dut.clock)
        await ReadOnly()

        if int(dut.cpu_wready.value) == 1:
            break
    else:
        raise AssertionError(f"cpu_wready timeout addr=0x{addr:08x}")

    await RisingEdge(dut.clock)

    return data

# ------------------------------------------------
# TEST 1: reset / basic pins
# ------------------------------------------------
@cocotb.test()
async def sd_reset_test(dut):
    dut._log.info("==== PSC_ONE SD reset test start ====")

    cocotb.start_soon(gen_clock(dut))
    cocotb.start_soon(monitor_no_sd_error(dut))
    await reset_dut(dut)

    for _ in range(10000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS reset test ====")

# ------------------------------------------------
# TEST 2: SD read
# ------------------------------------------------
@cocotb.test()
async def sd_read_test(dut):
    dut._log.info("==== PSC_ONE SD read test start ====")

    cocotb.start_soon(gen_clock(dut))
    cocotb.start_soon(monitor_no_sd_error(dut))
    await reset_dut(dut)

    for _ in range(100):
        await RisingEdge(dut.clock)

    # fifo flush
    await cpu_write(dut, SD_IF_CTRL, 0x04)

    value = await cpu_read(dut, SD_IF_CTRL)
    value = await cpu_read(dut, SD_IF_CTRL)

    # read_start
    await cpu_write(dut, SD_IF_CTRL, 0x01)

    #dut._log.info(f"Read = 0x{value:08X}")

    #assert value == model_value, \
    #    f"pix_waddr mismatch: got=0x{value:08X}, exp=0x{model_value:08X}"

    # read_ready wait
    while True:
        value = await cpu_read(dut, SD_IF_CTRL)

        for _ in range(1000):
            await RisingEdge(dut.clock)

        if (value & 0x04) == 0x04:
            break

    # sector 指定
    await cpu_write(dut, SD_IF_SECTOR, 0x002000)
    await cpu_write(dut, SD_IF_CTRL, 0x02)

    for _ in range(1000):
        await RisingEdge(dut.clock)

    # read_ready wait
    while True:
        value = await cpu_read(dut, SD_IF_CTRL)

        for _ in range(1000):
            await RisingEdge(dut.clock)

        if (value & 0x04) == 0x04:
            break

    # fifo read data
    for i in range(512):
        value = await cpu_read(dut, SD_IF_DATA)
        print(f"[{i:02d}] DATA = 0x{value:08X}")

    for _ in range(10000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS SD read test ====")

# ------------------------------------------------
# TEST 3: SD write
# ------------------------------------------------
@cocotb.test()
async def sd_write_test(dut):
    dut._log.info("==== PSC_ONE SD write test start ====")

    cocotb.start_soon(gen_clock(dut))
    cocotb.start_soon(monitor_no_sd_error(dut))
    await reset_dut(dut)

    for _ in range(100):
        await RisingEdge(dut.clock)

    # fifo flush
    await cpu_write(dut, SD_IF_CTRL, 0x04)

    # sector 指定
    await cpu_write(dut, SD_IF_SECTOR, 30000)

    # read_start
    await cpu_write(dut, SD_IF_CTRL, 0x01)

    # read_ready wait
    while True:
        value = await cpu_read(dut, SD_IF_CTRL)

        for _ in range(1000):
            await RisingEdge(dut.clock)

        if (value & 0x04) == 0x04:
            break

    # write start
    await cpu_write(dut, SD_IF_CTRL, 0x10)

    for _ in range(1000):
        await RisingEdge(dut.clock)

    # busy wait
    while True:
        value = await cpu_read(dut, SD_IF_CTRL)

        for _ in range(1000):
            await RisingEdge(dut.clock)

        if (value & 0x02) != 0x02:
            break

    for _ in range(5000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS SD write test ====")