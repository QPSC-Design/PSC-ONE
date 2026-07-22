// NISHIHARU

import PSC_Types::*;

module PSC_RV32ISP_Execute #(
    parameter logic [31:0] UART_MMIO_ADDR    = 32'hF004_00F0,
    parameter logic [31:0] UART_MMIO_FLAG    = 32'hF004_00F4,
    parameter logic [31:0] COUNTER_MMIO_ADDR = 32'hF004_FFF0
)(
    input  logic        clock,
    input  logic        reset_n,
    input  logic        cpu_stop,
    input  logic [3:0]  cpu_state,
    input  logic        cpu_trap,

    input  logic        execute_valid,
    output logic        execute_task_busy,
    output logic        execute_task_done,

    output logic        fifo_read_state_sig,
    output logic        execute_state_sig,
    input  logic        fifo_read_ready,
    output logic        fifo_flush_sig,

    output logic [31:0] pc,
    output logic [31:0] counter,

    input  logic [31:0] opcode,
    input  logic [31:0] csr_satp,
    input  logic [1:0]  priv_mode,
    output logic [31:0] alu_data,
    output logic        pc_sel2,
    output dec_ctrl_t   decoder_ctrl,
    input  logic        i_pf,
    output logic        d_pf,
    input  logic [4:0]  trap_scause,

    input  csr_state_t  csr_state,
    output logic        csr_enb,
    output logic        csr_valid,
    input  logic [31:0] csr_rdata,
    output logic [31:0] csr_reg_data_1,

    output logic        data_mem_read_valid,
    input  logic        data_mem_read_ready,
    output logic [31:0] data_mem_read_address,
    input  logic [31:0] data_mem_read_data,
    input  logic        data_mem_req_ready,

    output logic        data_mem_write_valid,
    input  logic        data_mem_write_ready,
    output logic [31:0] data_mem_write_address,
    output logic [31:0] data_mem_write_data,
    output logic [2:0]  mem_write_sel,

    output logic [31:0] vaddr,
    output logic [8:0]  uart_out
);

    logic EXECUTE_state, BRANCH_state, BRANCH_W_state;
    logic STORE_state, STORE_W_state;
    logic decode_enb, execute_enb, branch_enb;
    logic memory_store_enb, register_store_enb;
    logic decode_done, alu_done, branch_done, store_done;

    logic [31:0] reg_data_1, reg_data_2;
    logic [31:0] r_data1, r_data2, w_data;
    logic [31:0] execute_pc;
    logic [1:0]  alu_data_low2;
    logic [31:0] branch_mem_read_data;

    logic [31:0] branch_rdata;
    logic [1:0]  ld_low2_q;

    logic branch_data_mem_read_valid, branch_mmu_valid;
    logic [31:0] branch_data_mem_read_address, branch_vaddr;

    logic memory_store_mmu_valid;
    logic [31:0] memory_store_vaddr, store_mem_write_address;

    logic d_mmu_mem_valid, d_mmu_done, d_mode_sv32;
    logic [31:0] d_mmu_mem_addr, d_paddr;
    logic d_MMU_enb, cpu_state_done;

    assign execute_state_sig     = EXECUTE_state;
    assign mem_write_sel         = decoder_ctrl.funct3;

    assign vaddr = BRANCH_W_state ? branch_vaddr :
                   STORE_W_state  ? memory_store_vaddr : 32'd0;

    assign d_MMU_enb = (branch_mmu_valid || memory_store_mmu_valid) &&
                       (decoder_ctrl.is_load || decoder_ctrl.is_store);

    assign cpu_state_done       = store_done;
    assign csr_reg_data_1       = reg_data_1;

    // MMU 
    assign data_mem_read_valid   = d_mmu_mem_valid | branch_data_mem_read_valid;
    assign data_mem_read_address = d_mmu_mem_valid ?   d_mmu_mem_addr :
                                                       branch_data_mem_read_address;
    assign data_mem_write_address = store_mem_write_address;

    PSC_CELL u_PSC_CELL(
        .clock                (clock),
        .reset_n              (reset_n),
        .cpu_stop             (cpu_stop),
        .cpu_state            (cpu_state),
        .priv_mode            (priv_mode),

        .pc                   (pc),
        .counter              (counter),
        .opcode               (opcode),

        .EXECUTE_state        (EXECUTE_state),
        .BRANCH_state         (BRANCH_state),
        .BRANCH_W_state       (BRANCH_W_state),
        .STORE_state          (STORE_state),
        .STORE_W_state        (STORE_W_state),

        .fifo_empty           (!execute_valid),
        .fifo_read_ready      (fifo_read_ready),
        .fifo_read_valid      (fifo_read_state_sig),
        .fifo_flush           (fifo_flush_sig),

        .decoder_ctrl         (decoder_ctrl),
        .alu_data             (alu_data),
        .reg_data_1           (reg_data_1),
        .reg_data_2           (reg_data_2),
        .w_data               (w_data),
        .pc_sel2              (pc_sel2),
        .ld_low2_q            (ld_low2_q),
        .branch_rdata         (branch_rdata),

        .csr_state            (csr_state),
        .csr_enb              (csr_enb),
        .csr_valid            (csr_valid),

        .decode_enb           (decode_enb),
        .execute_enb          (execute_enb),
        .branch_enb           (branch_enb),
        .memory_store_enb     (memory_store_enb),
        .register_store_enb   (register_store_enb),

        .alu_data_low2        (alu_data[1:0]),
        .branch_mem_read_data (data_mem_read_data),
        .decode_done          (decode_done),
        .alu_done             (alu_done),
        .branch_done          (branch_done),
        .store_done           (store_done),

        .d_pf                 (d_pf),
        .i_pf                 (i_pf),
        .trap_scause          (trap_scause),

        .execute_task_busy    (execute_task_busy),
        .execute_task_done    (execute_task_done)
    );

    // =====================================
    // DECODE
    // =====================================
    Decorder u_Decorder(
        .clock               (clock),
        .reset_n             (reset_n),
        .decode_enb          (decode_enb),
        .opcode              (opcode),
        .in_pc               (pc),
        .current_priv        (priv_mode),
        .decode_done         (decode_done),
        .decoder_ctrl        (decoder_ctrl)
    );

    // =====================================
    // EXECUTE
    // =====================================
    Execute u_execute(
        .clock               (clock),
        .reset_n             (reset_n),
        .execute_enb         (execute_enb),
        .decoder_ctrl        (decoder_ctrl),
        .in_pc               (pc),
        .reg_data_addr1      (reg_data_1),
        .reg_data_addr2      (reg_data_2),
        .alu_data            (alu_data),
        .r_data1             (r_data1),
        .r_data2             (r_data2),
        .out_pc              (execute_pc),
        .alu_done            (alu_done)
    );

    // =====================================
    // BRANCH
    // =====================================
    Branch u_branch(
        .clock                 (clock),
        .reset_n               (reset_n),
        .branch_enb            (branch_enb),
        .decoder_ctrl          (decoder_ctrl),
        .in_vaddr              (alu_data),
        .r_data1               (r_data1),
        .r_data2               (r_data2),
        .mmu_valid             (branch_mmu_valid),
        .vaddr                 (branch_vaddr),
        .mmu_ready             (d_mmu_done),
        .d_paddr               (d_paddr),
        .data_mem_read_address (branch_data_mem_read_address),
        .data_mem_read_valid   (branch_data_mem_read_valid),
        .data_mem_req_ready    (data_mem_req_ready),
        .data_mem_read_ready   (data_mem_read_ready),
        .pc_sel2               (pc_sel2),
        .branch_done           (branch_done)
    );

    // =====================================
    // LOAD/STORE
    // =====================================
    MemoryStore #(
        .UART_MMIO_ADDR         (UART_MMIO_ADDR),
        .UART_MMIO_FLAG         (UART_MMIO_FLAG),
        .COUNTER_MMIO_ADDR      (COUNTER_MMIO_ADDR)
    ) u_memory_store(
        .clock                  (clock),
        .reset_n                (reset_n),
        .store_enb              (memory_store_enb),
        .mode_sv32              (d_mode_sv32),
        .decoder_ctrl           (decoder_ctrl),
        .alu_data               (alu_data),
        .mem_val                (decoder_ctrl.funct3),
        .mem_read_data          (branch_rdata),
        .r_data2                (r_data2),
        .in_pc                  (execute_pc),
        .counter                (32'd0),
        .ld_low2                (ld_low2_q),
        .csr_rdata              (csr_rdata),
        .mmu_valid              (memory_store_mmu_valid),
        .vaddr                  (memory_store_vaddr),
        .mmu_ready              (d_mmu_done),
        .d_paddr                (d_paddr),
        .data_mem_write_address (store_mem_write_address),
        .data_mem_write_valid   (data_mem_write_valid),
        .data_mem_write_data    (data_mem_write_data),
        .data_mem_write_ready   (data_mem_write_ready),
        .data_mem_req_ready     (data_mem_req_ready),
        .uart                   (uart_out),
        .w_data                 (w_data),
        .store_done             (store_done)
    );

    // =====================================
    // D-MMU
    // =====================================
    MMU u_mmu_d(
        .clk                    (clock),
        .reset_n                (reset_n),
        .MMU_enb                (d_MMU_enb),
        .vaddr                  (vaddr),
        .satp                   (csr_satp),
        .priv_mode              (priv_mode),
        .access_r               (decoder_ctrl.is_load),
        .access_w               (decoder_ctrl.is_store),
        .access_x               (1'b0),
        .mem_req_ready          (data_mem_req_ready),
        .mem_rdata              (data_mem_read_data),
        .mem_addr               (d_mmu_mem_addr),
        .mem_valid              (d_mmu_mem_valid),
        .mem_ready              (data_mem_read_ready),
        .cpu_state_done         (cpu_state_done),
        .sfence_vma             (fifo_flush_sig && decoder_ctrl.is_sfence_vma),
        .paddr                  (d_paddr),
        .page_fault             (d_pf),
        .mode_sv32              (d_mode_sv32),
        .mmu_done               (d_mmu_done)
    );

endmodule