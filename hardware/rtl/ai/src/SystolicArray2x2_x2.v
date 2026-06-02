// ./src/SystolicArray2x2_x2.v
`timescale 1ns/1ps

module SystolicArray2x2_x2 #(
    parameter integer PE_CYCLE = 1
)(
    input  wire         clock,
    input  wire         reset_n,

    // Shared controls
    input  wire         data_clear,
    input  wire         en_b_shift_bottom,
    input  wire         en_shift_right,
    input  wire         en_shift_bottom,
    input  wire         start_pulse,

    // external input bus
    input  wire [15:0]  a_left_in_bus,
    input  wire [15:0]  b_top_in_bus,

    input  wire [31:0]  ps_top_in_bus_0,
    input  wire [31:0]  ps_top_in_bus_1,

    // bottom output bus
    output wire [31:0]  ps_bottom_out_bus_0,
    output wire [31:0]  ps_bottom_out_bus_1,

    // PE accumulators
    output wire [31:0]  ps_acc_0,
    output wire [31:0]  ps_acc_1,
    output wire [31:0]  ps_acc_2,
    output wire [31:0]  ps_acc_3,

    // status
    output wire         busy_out,
    output wire         done_out
);

    // vcd output
    //`include "./src/include_vcd_output.v"

    // ============================================================
    // parameters
    // ============================================================

    localparam integer N_PE = 2;
    localparam integer DW   = 8;
    localparam integer PW   = 32;
    localparam integer SW   = 32;

    // ============================================================
    // input flatten
    // ============================================================

    wire [7:0] a_left_in_flat [0:1];
    wire [7:0] b_top_in_flat  [0:1];

    wire [31:0] ps_top_in_flat [0:1];

    assign a_left_in_flat[0] = a_left_in_bus[7:0];
    assign a_left_in_flat[1] = a_left_in_bus[15:8];

    assign b_top_in_flat[0] = b_top_in_bus[7:0];
    assign b_top_in_flat[1] = b_top_in_bus[15:8];

    assign ps_top_in_flat[0] = ps_top_in_bus_0;
    assign ps_top_in_flat[1] = ps_top_in_bus_1;

    // ============================================================
    // mesh wires
    // ============================================================

    wire [DW-1:0] a_wire [0:N_PE-1][0:N_PE];
    wire [DW-1:0] b_wire [0:N_PE][0:N_PE-1];

    wire [SW-1:0] ps_wire [0:N_PE][0:N_PE-1];

    wire busy_wire [0:N_PE-1][0:N_PE-1];
    wire done_wire [0:N_PE-1][0:N_PE-1];

    // ============================================================
    // PE <-> multiplier wires
    // ============================================================

    wire data_out_valid [0:N_PE-1][0:N_PE-1];
    wire data_in_ready  [0:N_PE-1][0:N_PE-1];

    wire [DW-1:0] data_A_in [0:N_PE-1][0:N_PE-1];
    wire [DW-1:0] data_B_in [0:N_PE-1][0:N_PE-1];

    wire [PW-1:0] data_C_out [0:N_PE-1][0:N_PE-1];

    // ============================================================
    // accumulator outputs
    // ============================================================

    wire [SW-1:0] ps_acc [0:N_PE-1][0:N_PE-1];

    assign ps_acc_0 = ps_acc[0][0];
    assign ps_acc_1 = ps_acc[0][1];
    assign ps_acc_2 = ps_acc[1][0];
    assign ps_acc_3 = ps_acc[1][1];

    // ============================================================
    // left boundary
    // ============================================================

    assign a_wire[0][0] = a_left_in_flat[0];
    assign a_wire[1][0] = a_left_in_flat[1];

    // ============================================================
    // top boundary
    // ============================================================

    assign b_wire[0][0] = b_top_in_flat[0];
    assign b_wire[0][1] = b_top_in_flat[1];

    assign ps_wire[0][0] = ps_top_in_flat[0];
    assign ps_wire[0][1] = ps_top_in_flat[1];

    // ============================================================
    // PE array
    // ============================================================

    genvar r, c;

    generate
        for (r = 0; r < N_PE; r = r + 1) begin : ROW_BLOCK
            for (c = 0; c < N_PE; c = c + 1) begin : COL_BLOCK

                PE_Int8_Single #(
                    .DW         (DW),
                    .PW         (PW),
                    .SW         (SW),
                    .PE_CYCLE   (PE_CYCLE)
                ) u_pe (
                    .clock              (clock),
                    .reset_n            (reset_n),

                    .data_clear         (data_clear),
                    .start              (start_pulse),

                    .en_b_shift_bottom  (en_b_shift_bottom),
                    .en_shift_right     (en_shift_right),
                    .en_shift_bottom    (en_shift_bottom),

                    .b_in               (b_wire[r][c]),
                    .a_in               (a_wire[r][c]),
                    .ps_in              (ps_wire[r][c]),

                    .data_out_valid     (data_out_valid[r][c]),
                    .data_in_ready      (data_in_ready[r][c]),

                    .data_A             (data_A_in[r][c]),
                    .data_B             (data_B_in[r][c]),
                    .result_C           (data_C_out[r][c]),

                    .busy               (busy_wire[r][c]),
                    .done               (done_wire[r][c]),

                    .a_shift_to_right   (a_wire[r][c+1]),
                    .b_shift_to_bottom  (b_wire[r+1][c]),
                    .sum_to_bottom      (ps_wire[r+1][c]),
                    .ps_acc             (ps_acc[r][c])
                );

            end
        end
    endgenerate

    // ============================================================
    // shared multiplier wires
    // ============================================================

    // ------------------------------------------------------------
    // column0
    // ------------------------------------------------------------

    wire [1:0]  mult_valid_0;
    wire [1:0]  mult_ready_0;

    wire [15:0] mult_A_0;
    wire [15:0] mult_B_0;

    wire [31:0] mult_C_0;

    // ------------------------------------------------------------
    // column1
    // ------------------------------------------------------------

    wire [1:0]  mult_valid_1;
    wire [1:0]  mult_ready_1;

    wire [15:0] mult_A_1;
    wire [15:0] mult_B_1;

    wire [31:0] mult_C_1;

    // ============================================================
    // column0 pack
    // ============================================================

    assign mult_valid_0[0] = data_out_valid[0][0];
    assign mult_valid_0[1] = data_out_valid[1][0];

    assign mult_A_0[7:0]   = data_A_in[0][0];
    assign mult_A_0[15:8]  = data_A_in[1][0];

    assign mult_B_0[7:0]   = data_B_in[0][0];
    assign mult_B_0[15:8]  = data_B_in[1][0];

    // ============================================================
    // column1 pack
    // ============================================================

    assign mult_valid_1[0] = data_out_valid[0][1];
    assign mult_valid_1[1] = data_out_valid[1][1];

    assign mult_A_1[7:0]   = data_A_in[0][1];
    assign mult_A_1[15:8]  = data_A_in[1][1];

    assign mult_B_1[7:0]   = data_B_in[0][1];
    assign mult_B_1[15:8]  = data_B_in[1][1];

    // ============================================================
    // ready return
    // ============================================================

    assign data_in_ready[0][0] = mult_ready_0[0];
    assign data_in_ready[1][0] = mult_ready_0[1];

    assign data_in_ready[0][1] = mult_ready_1[0];
    assign data_in_ready[1][1] = mult_ready_1[1];

    // ============================================================
    // result return
    // ============================================================

    assign data_C_out[0][0] = mult_C_0;
    assign data_C_out[1][0] = mult_C_0;

    assign data_C_out[0][1] = mult_C_1;
    assign data_C_out[1][1] = mult_C_1;

    // ============================================================
    // shared multiplier column0
    // ============================================================

    PE_mult #(
        .DW (DW),
        .PW (PW),
        .SW (SW),
        .N  (2)
    ) u_mult_col0 (
        .clock              (clock),
        .reset_n            (reset_n),

        .data_in_valid      (mult_valid_0),
        .data_out_ready     (mult_ready_0),

        .data_A             (mult_A_0),
        .data_B             (mult_B_0),

        .result_C           (mult_C_0)
    );

    // ============================================================
    // shared multiplier column1
    // ============================================================

    PE_mult #(
        .DW (DW),
        .PW (PW),
        .SW (SW),
        .N  (2)
    ) u_mult_col1 (
        .clock              (clock),
        .reset_n            (reset_n),

        .data_in_valid      (mult_valid_1),
        .data_out_ready     (mult_ready_1),

        .data_A             (mult_A_1),
        .data_B             (mult_B_1),

        .result_C           (mult_C_1)
    );

    // ============================================================
    // bottom outputs
    // ============================================================

    assign ps_bottom_out_bus_0 = ps_wire[N_PE][0];
    assign ps_bottom_out_bus_1 = ps_wire[N_PE][1];

    // ============================================================
    // done_out, busy_out
    // ============================================================

    wire [N_PE-1:0] done_last_row;

    generate
        for (c = 0; c < N_PE; c = c + 1) begin : GEN_DONE_LAST_ROW
            assign done_last_row[c] = done_wire[N_PE-1][c];
        end
    endgenerate

    wire [N_PE*N_PE-1:0] busy_all_wire;

    generate
        for (r = 0; r < N_PE; r = r + 1) begin : ROW_BLOCK_DONE
            for (c = 0; c < N_PE; c = c + 1) begin : COL_BLOCK_DONE
                assign busy_all_wire[r*N_PE + c] = busy_wire[r][c];
            end
        end
    endgenerate

    assign busy_out = &busy_all_wire;
    assign done_out = &done_last_row;

endmodule