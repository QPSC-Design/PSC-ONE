// NISHIHARU

import PSC_Types::*;

module PSC_CELL #(
    parameter int CELL_NUM = 1
)(
    input  logic        clock,
    input  logic        reset_n,
    input  logic        cpu_stop,

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

    // Decoder
    input  dec_ctrl_t   decoder_ctrl,

    // Branch
    input  logic        pc_sel2,
    output logic [1:0]  ld_low2_q,
    output logic [31:0] branch_rdata,

    // Register
    output logic [31:0] reg_data_1,
    output logic [31:0] reg_data_2,
    input  logic [31:0] w_data,

    // CSR
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

    output logic        execute_ready
);

    // ============================================================
    // State definition
    // ============================================================
    typedef enum logic [3:0] {
        ST_IDLE,
        ST_FIFO_READ,
        ST_DECODE,
        ST_EXECUTE,
        ST_BRANCH,
        ST_BRANCH_W,
        ST_STORE,
        ST_STORE_W
    } execute_state_t;

    execute_state_t execute_state;
    execute_state_t next_state;
    execute_state_t execute_state_d;

    // ============================================================
    // Register file signals
    // ============================================================
    Register u_regfile (
        .clock          (clock),
        .reset_n        (reset_n),
        .store_enb      (register_store_enb),
        .rf_wen         (decoder_ctrl.rf_wen),
        .w_addr         (decoder_ctrl.w_addr),
        .w_data         (w_data),
        .r_addr1        (decoder_ctrl.r_addr1),
        .r_addr2        (decoder_ctrl.r_addr2),
        .reg_data_1     (reg_data_1),
        .reg_data_2     (reg_data_2)
    );

    // ============================================================
    // Pipeline configuration
    // ============================================================
    logic pipeline_type;

    assign pipeline_type = 1'b0;
    // 将来パイプラインを有効化する場合
    // assign pipeline_type = decoder_ctrl.is_R_type | decoder_ctrl.is_op_imm;

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
    // State register
    // ============================================================
    always_ff @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            execute_state   <= ST_IDLE;
            execute_state_d <= ST_IDLE;
        end else if (cpu_stop) begin
            execute_state   <= ST_IDLE;
            execute_state_d <= ST_IDLE;
        end else begin
            execute_state   <= next_state;
            execute_state_d <= execute_state;
        end
    end

    // ============================================================
    // Next-state logic
    // ============================================================
    always_comb begin
        next_state = execute_state;

        unique case (execute_state)

            ST_IDLE: begin
                if (!fifo_empty)
                    next_state = ST_FIFO_READ;
            end

            ST_FIFO_READ: begin
                next_state = ST_DECODE;
            end

            ST_DECODE: begin
                if (decode_done)
                    next_state = ST_EXECUTE;
            end

            ST_EXECUTE: begin
                if (alu_done)
                    next_state = ST_BRANCH;
            end

            ST_BRANCH: begin
                next_state = ST_BRANCH_W;
            end

            ST_BRANCH_W: begin
                if (branch_done)
                    next_state = ST_STORE;
            end

            ST_STORE: begin
                next_state = ST_STORE_W;
            end

            ST_STORE_W: begin
                if (store_done)
                    next_state = ST_IDLE;
            end

            default: begin
                next_state = ST_IDLE;
            end

        endcase
    end

    // ============================================================
    // State decode
    // ============================================================

    // Cell state
    assign EXECUTE_state  = (execute_state == ST_EXECUTE);
    assign BRANCH_state   = (execute_state == ST_BRANCH);
    assign BRANCH_W_state = (execute_state == ST_BRANCH_W);
    assign STORE_state    = (execute_state == ST_STORE);
    assign STORE_W_state  = (execute_state == ST_STORE_W);

    // FIFO
    assign fifo_read_valid = (execute_state == ST_FIFO_READ);

    assign fifo_flush =
        (execute_state == ST_STORE) &&
        (
            pc_sel2       ||
            decoder_ctrl.is_sfence_vma ||
            decoder_ctrl.is_fence_i    ||
            decoder_ctrl.is_ecall      ||
            decoder_ctrl.is_mret       ||
            decoder_ctrl.is_sret
            //decoder_ctrl.cpu_trap
        );

    // Module enable
    assign decode_enb =
        (execute_state == ST_DECODE) &&
        fifo_read_ready;

    assign execute_enb =
        (execute_state == ST_EXECUTE);

    assign branch_enb =
        (execute_state == ST_BRANCH);

    assign memory_store_enb =
        (execute_state == ST_STORE);

    assign register_store_enb = 
        (execute_state == ST_STORE_W) &&
        store_done;

    // CSR
    assign csr_enb =
        (execute_state == ST_BRANCH_W) &&
        branch_done;

    // Completion pulse
    assign execute_ready =
        (execute_state == ST_IDLE) &&
        (execute_state_d != ST_IDLE);

    assign csr_valid = execute_ready;

endmodule