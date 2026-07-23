// NISHIHARU

import PSC_Types::*;

module PSC_CELL (
    input  logic        clock,
    input  logic        reset_n,
    input  logic        cpu_stop,
    input  logic [3:0]  cpu_state,
    input  logic [1:0]  priv_mode,

    // PC, OPCODE
    output logic [31:0] pc,
    output logic [31:0] counter,
    input logic [31:0]  opcode,

    // Cell state
    output logic        EXECUTE_state,
    output logic        BRANCH_state,
    output logic        BRANCH_W_state,
    output logic        STORE_state,
    output logic        STORE_W_state,

    // FIFO
    input  logic        fifo_empty,
    input  logic        fifo_read_ready,
    output logic        fifo_read_valid,
    output logic        fifo_flush,

    // Decoder struct
    input  dec_ctrl_t   decoder_ctrl,

    // Excute
    input  logic [31:0] alu_data,

    // Branch
    input  logic        pc_sel2,
    output logic [1:0]  ld_low2_q,
    output logic [31:0] branch_rdata,

    // Register
    output logic [31:0] reg_data_1,
    output logic [31:0] reg_data_2,
    input  logic [31:0] w_data,

    // CSR
    input csr_state_t   csr_state,
    output logic        csr_enb,
    output logic        csr_valid,

    // Module enable
    output logic        decode_enb,
    output logic        execute_enb,
    output logic        branch_enb,
    output logic        memory_store_enb,
    output logic        register_store_enb,

    // Datapath
    input  logic [1:0]  alu_data_low2,
    input  logic [31:0] branch_mem_read_data,

    // Completion
    input  logic        decode_done,
    input  logic        alu_done,
    input  logic        branch_done,
    input  logic        store_done,

    // Page Fault
    input  logic        d_pf,
    input  logic        i_pf,
    input  logic [4:0]  trap_scause,

    output logic        execute_task_busy,
    output logic        execute_task_done
);

    // Icarus Verilog does not support member assignment through an
    // unpacked array of structures.  Keep the two cells as independent
    // structure variables instead.
    instruction_state_t inst_state_0;
    instruction_state_t inst_state_1;

    localparam int CELL_NUM = 2;    //state数:2固定（TBD）

    // ============================================================
    // Register file signals
    // ============================================================
    PSC_Register u_regfile (
        .clock                  (clock),
        .reset_n                (reset_n),
        .store_enb              (register_store_enb),
        .rf_wen                 (decoder_ctrl.rf_wen),
        .w_addr                 (decoder_ctrl.w_addr),
        .w_data                 (w_data),
        .r_addr1                (decoder_ctrl.r_addr1),
        .r_addr2                (decoder_ctrl.r_addr2),
        .reg_data_1             (reg_data_1),
        .reg_data_2             (reg_data_2)
    );

    // ============================================================
    // PROGRAM COUNTER
    // ============================================================
    PSC_PC u_PSC_PC (
        .clock             (clock),
        .reset_n           (reset_n),
        .cpu_stop          (cpu_stop),

        .execute_task_done (execute_task_done),
        .alu_data          (alu_data),
        .pc_sel2           (pc_sel2),
        .decoder_ctrl      (decoder_ctrl),

        .cpu_state         (cpu_state),
        .priv_mode         (priv_mode),

        .d_pf              (d_pf),
        .i_pf              (i_pf),

        .trap_scause       (trap_scause[4:0]),
        .csr_state         (csr_state),

        .pc                (pc),
        .counter           (counter)
    );

    // ============================================================
    // Saved datapath values
    // ============================================================
    always_ff @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            branch_rdata    <= 32'b0;
            ld_low2_q       <= 2'b0;
        end else begin
            if (alu_done && decoder_ctrl.is_load)
                ld_low2_q <= alu_data_low2;
            if (branch_done)
                branch_rdata <= branch_mem_read_data;
        end
    end

    // ============================================================
    // Cell state machines
    // ============================================================
    logic [CELL_NUM-1:0] IDLE_state;
    logic [CELL_NUM-1:0] FIFO_READ_state;
    logic [CELL_NUM-1:0] DECODE_state;

    logic [CELL_NUM-1:0] EXECUTE_state_array;
    logic [CELL_NUM-1:0] BRANCH_state_array;
    logic [CELL_NUM-1:0] BRANCH_W_state_array;
    logic [CELL_NUM-1:0] STORE_state_array;
    logic [CELL_NUM-1:0] STORE_W_state_array;

    logic [CELL_NUM-1:0] execute_task_busy_array;
    logic [CELL_NUM-1:0] execute_task_done_array;

    // ============================================================
    // Cell 0
    // ============================================================
    PSC_CELL_STATE u_PSC_CELL_STATE_0 (
        .clock              (clock),
        .reset_n            (reset_n),
        .cpu_stop           (cpu_stop),

        .decoder_ctrl       (decoder_ctrl),
        .inst_state         (inst_state_0),

        .fifo_empty         (fifo_empty),
        .decode_done        (decode_done),
        .alu_done           (alu_done),
        .branch_done        (branch_done),
        .store_done         (store_done),

        .IDLE_state         (IDLE_state[0]),
        .FIFO_READ_state    (FIFO_READ_state[0]),
        .DECODE_state       (DECODE_state[0]),
        .EXECUTE_state      (EXECUTE_state_array[0]),
        .BRANCH_state       (BRANCH_state_array[0]),
        .BRANCH_W_state     (BRANCH_W_state_array[0]),
        .STORE_state        (STORE_state_array[0]),
        .STORE_W_state      (STORE_W_state_array[0]),

        .execute_task_busy  (execute_task_busy_array[0]),
        .execute_task_done  (execute_task_done_array[0])
    );


    // ============================================================
    // Cell 1
    // ============================================================
    PSC_CELL_STATE u_PSC_CELL_STATE_1 (
        .clock              (clock),
        .reset_n            (1'b0),     // stop module
        .cpu_stop           (cpu_stop),

        .decoder_ctrl       (decoder_ctrl),
        .inst_state         (inst_state_1),

        .fifo_empty         (fifo_empty),
        .decode_done        (decode_done),
        .alu_done           (alu_done),
        .branch_done        (branch_done),
        .store_done         (store_done),

        .IDLE_state         (IDLE_state[1]),
        .FIFO_READ_state    (FIFO_READ_state[1]),
        .DECODE_state       (DECODE_state[1]),
        .EXECUTE_state      (EXECUTE_state_array[1]),
        .BRANCH_state       (BRANCH_state_array[1]),
        .BRANCH_W_state     (BRANCH_W_state_array[1]),
        .STORE_state        (STORE_state_array[1]),
        .STORE_W_state      (STORE_W_state_array[1]),

        .execute_task_busy  (execute_task_busy_array[1]),
        .execute_task_done  (execute_task_done_array[1])
    );

    // ============================================================
    // Instruction state registers
    // ============================================================
    logic cell_select;

    always_ff @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            cell_select  <= 1'b0;
            inst_state_0 <= '0;
            inst_state_1 <= '0;
        end else begin
            case (cell_select)
                1'b0: begin
                    if (FIFO_READ_state[0] && fifo_read_ready) begin
                        inst_state_0.valid  <= 1'b1;
                        inst_state_0.pc     <= pc;
                        inst_state_0.opcode <= opcode;
                    end

                    if (DECODE_state[0] && decode_done) begin
                        inst_state_0.decoder_ctrl <= decoder_ctrl;
                        inst_state_0.reg_data_1   <= reg_data_1;
                        inst_state_0.reg_data_2   <= reg_data_2;
                    end

                    if (EXECUTE_state_array[0] && alu_done) begin
                        inst_state_0.alu_data      <= alu_data;
                        inst_state_0.alu_data_low2 <= alu_data_low2;
                    end

                    if (BRANCH_W_state_array[0] && branch_done) begin
                        inst_state_0.pc_sel2      <= pc_sel2;
                        inst_state_0.branch_rdata <= branch_mem_read_data;
                    end

                    if (STORE_W_state_array[0] && store_done) begin
                        inst_state_0.w_data <= w_data;
                        inst_state_0.valid  <= 1'b0;
                    end
                end

                1'b1: begin
                    if (FIFO_READ_state[1] && fifo_read_ready) begin
                        inst_state_1.valid  <= 1'b1;
                        inst_state_1.pc     <= pc;
                        inst_state_1.opcode <= opcode;
                    end

                    if (DECODE_state[1] && decode_done) begin
                        inst_state_1.decoder_ctrl <= decoder_ctrl;
                        inst_state_1.reg_data_1   <= reg_data_1;
                        inst_state_1.reg_data_2   <= reg_data_2;
                    end

                    if (EXECUTE_state_array[1] && alu_done) begin
                        inst_state_1.alu_data      <= alu_data;
                        inst_state_1.alu_data_low2 <= alu_data_low2;
                    end

                    if (BRANCH_W_state_array[1] && branch_done) begin
                        inst_state_1.pc_sel2      <= pc_sel2;
                        inst_state_1.branch_rdata <= branch_mem_read_data;
                    end

                    if (STORE_W_state_array[1] && store_done) begin
                        inst_state_1.w_data <= w_data;
                        inst_state_1.valid  <= 1'b0;
                    end
                end
            endcase
        end
    end

    // ============================================================
    // Selected cell
    // ============================================================

    // Cell state
    assign EXECUTE_state  = EXECUTE_state_array[cell_select];
    assign BRANCH_state   = BRANCH_state_array[cell_select];
    assign BRANCH_W_state = BRANCH_W_state_array[cell_select];
    assign STORE_state    = STORE_state_array[cell_select];
    assign STORE_W_state  = STORE_W_state_array[cell_select];

    // FIFO
    assign fifo_read_valid =
        FIFO_READ_state[cell_select];

    assign fifo_flush =
        STORE_state_array[cell_select] &&
        (
            pc_sel2                    ||
            decoder_ctrl.is_sfence_vma ||
            decoder_ctrl.is_fence_i    ||
            decoder_ctrl.is_ecall      ||
            decoder_ctrl.is_mret       ||
            decoder_ctrl.is_sret
            // decoder_ctrl.cpu_trap
        );

    // Module enable
    assign decode_enb =
        DECODE_state[cell_select] &&
        fifo_read_ready;

    assign execute_enb =
        EXECUTE_state_array[cell_select];

    assign branch_enb =
        BRANCH_state_array[cell_select];

    assign memory_store_enb =
        STORE_state_array[cell_select];

    assign register_store_enb =
        STORE_W_state_array[cell_select] &&
        store_done                       &&
        decoder_ctrl.rf_wen              &&
        (decoder_ctrl.w_addr != 5'd0);

    // CSR
    assign csr_enb =
        BRANCH_W_state_array[cell_select] &&
        branch_done;
    
    // busy
    assign execute_task_busy =
        execute_task_busy_array[cell_select];

    // Completion
    assign execute_task_done =
        execute_task_done_array[cell_select];

    assign csr_valid =
        execute_task_done_array[cell_select];

endmodule
