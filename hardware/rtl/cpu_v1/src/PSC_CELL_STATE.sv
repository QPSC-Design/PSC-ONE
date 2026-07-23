// NISHIHARU

import PSC_Types::*;

module PSC_CELL_STATE (
    input  logic        clock,
    input  logic        reset_n,
    input  logic        cpu_stop,

    // Decoder struct
    input  dec_ctrl_t   decoder_ctrl,

    input  instruction_state_t inst_state,

    // FIFO / completion
    input  logic        fifo_empty,
    input  logic        decode_done,
    input  logic        alu_done,
    input  logic        branch_done,
    input  logic        store_done,

    // State decode
    output logic        IDLE_state,
    output logic        FIFO_READ_state,
    output logic        DECODE_state,
    output logic        EXECUTE_state,
    output logic        BRANCH_state,
    output logic        BRANCH_W_state,
    output logic        STORE_state,
    output logic        STORE_W_state,

    // Completion pulse
    output logic        execute_task_busy,
    output logic        execute_task_done
);

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
                    if (decoder_ctrl.pipeline_type)
                        next_state = ST_STORE;
                    else
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
    assign IDLE_state       = (execute_state == ST_IDLE);
    assign FIFO_READ_state  = (execute_state == ST_FIFO_READ);
    assign DECODE_state     = (execute_state == ST_DECODE);
    assign EXECUTE_state    = (execute_state == ST_EXECUTE);
    assign BRANCH_state     = (execute_state == ST_BRANCH) || ((execute_state == ST_EXECUTE) && 
                                decoder_ctrl.pipeline_type);
    assign BRANCH_W_state   = (execute_state == ST_BRANCH_W);
    assign STORE_state      = (execute_state == ST_STORE);
    assign STORE_W_state    = (execute_state == ST_STORE_W);

    assign execute_task_busy = (execute_state != ST_IDLE);

    assign execute_task_done =
        IDLE_state && (execute_state_d != ST_IDLE);

endmodule
