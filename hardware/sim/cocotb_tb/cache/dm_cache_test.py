import cocotb
import random
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
# sdram init fin wait
# ------------------------------------------------
async def sdram_init_fin_wait(dut, timeout=10000):

    for _ in range(timeout):
        await RisingEdge(dut.clock)
        await ReadOnly()

        if int(dut.sdram_init_fin.value) == 1:
            break
    else:
        raise AssertionError(f"sdram_init_fin timeout")

# ------------------------------------------------
# data cache wb start
# ------------------------------------------------
async def data_cache_wb_start(dut, time=10000):

    dut.data_cache_wb.value    = 1
    for _ in range(time):
        await RisingEdge(dut.clock)

    dut.data_cache_wb.value    = 0

# ------------------------------------------------
# data cache clear start
# ------------------------------------------------
async def data_cache_clear_start(dut, time=10000):

    # ReadOnlyフェーズを抜ける
    await RisingEdge(dut.clock)

    dut.data_cache_clear.value    = 1
    for _ in range(time):
        await RisingEdge(dut.clock)

    dut.data_cache_clear.value    = 0

# ------------------------------------------------
# reset
# ------------------------------------------------
async def reset_dut(dut):
    dut.reset_n.value                   = 0
    dut.program_mem_read_valid.value    = 0
    dut.program_mem_read_address.value  = 0
    dut.cpu_cache_clear.value           = 0
    
    dut.data_mem_read_valid.value       = 0
    dut.data_mem_read_address.value     = 0
    dut.data_mem_write_valid.value      = 0
    dut.mem_write_sel.value             = 0
    dut.data_mem_write_address.value    = 0
    dut.mem_write_data.value            = 0
    dut.data_cache_clear.value          = 0
    dut.data_cache_wb.value             = 0
    
    dut.mmu_data_mem_read_valid.value   = 0
    dut.mmu_data_mem_read_address.value = 0

    for _ in range(10):
        await RisingEdge(dut.clock)

    dut.reset_n.value = 1

    for _ in range(10):
        await RisingEdge(dut.clock)

# ------------------------------------------------
# CPU data write
# ------------------------------------------------
async def cpu_data_write(dut, addr, data, timeout=1000):

    # cpu_req_ready wait
    for _ in range(timeout):
        await RisingEdge(dut.clock)
        if int(dut.cpu_req_ready.value) == 1:
            break
    else:
        raise AssertionError(f"cpu_req_ready timeout")

    dut.data_mem_write_address.value  = addr
    await RisingEdge(dut.clock)

    dut.data_mem_write_valid.value    = 1
    dut.mem_write_sel.value           = 0b010
    dut.mem_write_data.value          = data
    await RisingEdge(dut.clock)
    dut.data_mem_write_valid.value    = 0

    for _ in range(timeout):
        await RisingEdge(dut.clock)
        await ReadOnly()

        if int(dut.data_mem_write_ready.value) == 1:
            break
    else:
        raise AssertionError(f"data_mem_write_ready timeout addr=0x{addr:08x}")

    await RisingEdge(dut.clock)

    return data

# ------------------------------------------------
# CPU data read
# ------------------------------------------------
async def cpu_data_read(dut, addr, timeout=1000):

    # cpu_req_ready wait
    for _ in range(timeout):
        await RisingEdge(dut.clock)
        if int(dut.cpu_req_ready.value) == 1:
            break
    else:
        raise AssertionError(f"cpu_req_ready timeout")

    dut.data_mem_read_address.value = addr
    await RisingEdge(dut.clock)

    dut.data_mem_read_valid.value   = 1
    await RisingEdge(dut.clock)
    dut.data_mem_read_valid.value   = 0

    for _ in range(timeout):
        await RisingEdge(dut.clock)
        await ReadOnly()

        if int(dut.data_mem_read_ready.value) == 1:
            data = int(dut.data_mem_read_data.value)
            break
    else:
        raise AssertionError(f"data_mem_read_ready timeout addr=0x{addr:08x}")

    await RisingEdge(dut.clock)

    return data

# ------------------------------------------------
# CPU program read
# ------------------------------------------------
async def cpu_program_read(dut, addr, timeout=1000):

    # cpu_req_ready wait
    for _ in range(timeout):
        await RisingEdge(dut.clock)
        if int(dut.cpu_req_ready.value) == 1:
            break
    else:
        raise AssertionError(f"cpu_req_ready timeout")

    dut.program_mem_read_address.value = addr

    dut.program_mem_read_valid.value = 1
    await RisingEdge(dut.clock)
    dut.program_mem_read_valid.value = 0

    for _ in range(timeout):
        await RisingEdge(dut.clock)
        await ReadOnly()

        if int(dut.program_mem_read_ready.value) == 1:
            data = dut.program_mem_read_data.value
            break
    else:
        raise AssertionError(f"program_mem_read_ready timeout addr=0x{addr:08x}")

    await RisingEdge(dut.clock)

    return data

# ------------------------------------------------
# TEST 1: data dm cache test.
# ------------------------------------------------
@cocotb.test()
async def cache_data_test(dut):
    dut._log.info("==== PSC_ONE data cache test start ====")

    cocotb.start_soon(gen_clock(dut))
    await reset_dut(dut)
    await sdram_init_fin_wait(dut)

    # data dm Cache random test.
    random.seed(1234)

    for _ in range(1000):

        # 0x0000_0040 ～ 0x0040_0000 の範囲（4byteアライン）
        address = random.randrange(0x00000040, 0x00400000, 4)

        data = random.getrandbits(32)

        await cpu_data_write(dut, address, data)
        value = await cpu_data_read(dut, address)

        print(
            f"addr=0x{address:08X} "
            f"write=0x{data:08X} "
            f"read=0x{value:08X}"
        )

        assert value == data, (
            f"Data mismatch: "
            f"addr=0x{address:08X}, "
            f"expected=0x{data:08X}, "
            f"got=0x{value:08X}"
        )

    for _ in range(1000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS test ====")

# ------------------------------------------------
# TEST 2: program dm cache test.
# ------------------------------------------------
@cocotb.test()
async def cache_program_test(dut):
    dut._log.info("==== PSC_ONE program cache test start ====")

    cocotb.start_soon(gen_clock(dut))
    await reset_dut(dut)
    await sdram_init_fin_wait(dut)

    # data dm Cache random test.
    random.seed(1324)

    for _ in range(500):

        # 0x0000_0040 ～ 0x0040_0000 の範囲（4byteアライン）
        address = random.randrange(0x00000040, 0x00400000, 4)

        v = await cpu_program_read(dut, address)

        if v.is_resolvable:
            value = int(v)
            print(f"addr=0x{address:08X} value=0x{value:08X}")
        else:
            print(f"addr=0x{address:08X} value={v}")

    for _ in range(1000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS test ====")

# ------------------------------------------------
# TEST 3: data cache write back test.
# ------------------------------------------------
@cocotb.test()
async def cache_data_wb_test(dut):
    dut._log.info("==== PSC_ONE data cache write back test start ====")

    cocotb.start_soon(gen_clock(dut))
    await reset_dut(dut)
    await sdram_init_fin_wait(dut)

    # data dm Cache random test.
    random.seed(1464)

    test_times = 5000

    for i in range(test_times):

        # 0x0000_0040 ～ 0x0010_0000 の範囲（4byteアライン）
        address = 4 * i
        #address = random.randrange(0x00000040, 0x00100000, 4)

        data    = random.getrandbits(32)
        await cpu_data_write(dut, address, data)

    await data_cache_wb_start(dut)

    # verify
    random.seed(1464)
    for i in range(test_times):

        # 0x0000_0040 ～ 0x0010_0000 の範囲（4byteアライン）
        address = 4 * i
        #address = random.randrange(0x00000040, 0x00100000, 4)

        data    = random.getrandbits(32)

        v = await cpu_program_read(dut, address)

        if v.is_resolvable:
            value = int(v)
            print(
                f"addr=0x{address:08X} "
                f"write=0x{data:08X} "
                f"read=0x{value:08X}"
            )

            assert value == data, (
                f"Data mismatch: "
                f"addr=0x{address:08X}, "
                f"expected=0x{data:08X}, "
                f"got=0x{value:08X}"
            )
        else:
            print(f"addr=0x{address:08X} value={v}")

    for _ in range(1000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS test ====")

# ------------------------------------------------
# TEST 4: data cache clear back test.
# ------------------------------------------------
@cocotb.test()
async def cache_data_clear_test(dut):
    dut._log.info("==== PSC_ONE data cache clear test start ====")

    cocotb.start_soon(gen_clock(dut))
    await reset_dut(dut)
    await sdram_init_fin_wait(dut)

    # data dm Cache random test.
    random.seed(1234)

    expected = {}

    for _ in range(1000):
        address = random.randrange(0x40, 0x00400000, 4)
        data = random.getrandbits(32)

        expected[address] = data
        await cpu_data_write(dut, address, data)

    # wb
    await data_cache_wb_start(dut)
    
    # cache clear
    await data_cache_clear_start(dut)

    # verify
    random.seed(1234)

    for address, data in expected.items():
        value = await cpu_data_read(dut, address)

        print(
            f"addr=0x{address:08X} "
            f"write=0x{data:08X} "
            f"read=0x{value:08X}"
        )

        if value != data:
            print(
                f"ERROR addr=0x{address:08X} "
                f"expected=0x{data:08X} "
                f"actual=0x{value:08X}"
            )

        assert value == data

    for _ in range(1000):
        await RisingEdge(dut.clock)

    dut._log.info("==== PASS test ====")
