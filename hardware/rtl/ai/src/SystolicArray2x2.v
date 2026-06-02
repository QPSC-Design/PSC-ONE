// ./src/SystolicArray2x2.v
`timescale 1ns/1ps

module SystolicArray2x2 #(
    parameter integer   PE_CYCLE  = 1
)(
    input  wire         clock,
    input  wire         reset_n,

    // Shared controls to all PEs
    input  wire         data_clear,
    input  wire         en_b_shift_bottom,
    input  wire         en_shift_right,
    input  wire         en_shift_bottom,
    input  wire         start_pulse,

    // External boundaries (2 lanes)  ---- BUS化 ----
    input  wire [15:0]  a_left_in_bus,      // 8bit x 2
    input  wire [15:0]  b_top_in_bus,       // 8bit x 2
    input  wire [31:0]  ps_top_in_bus_0,    // 32bit
    input  wire [31:0]  ps_top_in_bus_1,    // 32bit

    // Bottom outputs (2 lanes)
    output wire [31:0]  ps_bottom_out_bus_0,
    output wire [31:0]  ps_bottom_out_bus_1,

    // Output Stationary out (4 PE)
    //output wire [31:0]  ps_acc [0:1][0:1],
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

    // ------------------------------------------------
    // parameters
    // ------------------------------------------------
    localparam integer N_PE  = 2;
    localparam integer DW    = 8;
    localparam integer PW    = 32;
    localparam integer SW    = 32;

    // ------------------------------------------------
    // BUS → 内部配列
    // ------------------------------------------------
    wire [7:0]  a_left_in_flat [0:1];
    wire [7:0]  b_top_in_flat  [0:1];
    wire [31:0] ps_top_in_flat [0:1];

    assign a_left_in_flat[0] = a_left_in_bus[7:0];
    assign a_left_in_flat[1] = a_left_in_bus[15:8];

    assign b_top_in_flat[0]  = b_top_in_bus[7:0];
    assign b_top_in_flat[1]  = b_top_in_bus[15:8];

    assign ps_top_in_flat[0] = ps_top_in_bus_0;
    assign ps_top_in_flat[1] = ps_top_in_bus_1;

    // ------------------------------------------------
    // Internal mesh wiring
    // a_wire : 左→右
    // b_wire : 上→下
    // ps_wire: 上→下
    // ------------------------------------------------
    wire [DW-1:0] a_wire  [0:N_PE-1][0:N_PE];
    wire [DW-1:0] b_wire  [0:N_PE][0:N_PE-1];
    wire [SW-1:0] ps_wire [0:N_PE][0:N_PE-1];
    wire          busy_wire [0:N_PE-1][0:N_PE-1];
    wire          done_wire [0:N_PE-1][0:N_PE-1];

    genvar r, c;

    // ------------------------------------------------
    // Boundary assignment
    // ------------------------------------------------
    generate
        for (r = 0; r < N_PE; r = r + 1) begin : GEN_LEFT_A
            assign a_wire[r][0] = a_left_in_flat[r];
        end

        for (c = 0; c < N_PE; c = c + 1) begin : GEN_TOP_B_PS
            assign b_wire[0][c]  = b_top_in_flat[c];
            assign ps_wire[0][c] = ps_top_in_flat[c];
        end
    endgenerate

    // ------------------------------------------------
    // ps_acc wire
    // ------------------------------------------------
    wire [SW-1:0] ps_acc [0:N_PE-1][0:N_PE-1];

    assign ps_acc_0 = ps_acc[0][0];
    assign ps_acc_1 = ps_acc[0][1];
    assign ps_acc_2 = ps_acc[1][0];
    assign ps_acc_3 = ps_acc[1][1];

    // ------------------------------------------------
    // PE_mult wire
    // ------------------------------------------------
    // with PE_mult
    wire        data_out_valid  [0:N_PE-1][0:N_PE-1];
    wire        data_in_ready   [0:N_PE-1][0:N_PE-1];

    wire [DW-1:0] data_A_in  [0:N_PE-1][0:N_PE-1];
    wire [DW-1:0] data_B_in  [0:N_PE-1][0:N_PE-1];
    wire [PW-1:0] data_C_out [0:N_PE-1][0:N_PE-1];

    // ------------------------------------------------
    // PE array
    // ------------------------------------------------
    generate
        for (r = 0; r < N_PE; r = r + 1) begin : ROW_BLOCK
            for (c = 0; c < N_PE; c = c + 1) begin : COL_BLOCK

                PE_INT #(
                    .DW                 (8),
                    .PW                 (32),
                    .SW                 (32),
                    .PE_CYCLE           (PE_CYCLE)
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

    // ------------------------------------------------
    // parameters
    // ------------------------------------------------
    localparam integer N_PE_MUL  = 2;

    // with PE_mult
    localparam    N_Mult = 1;   // N>2の場合は複数のPEで乗算器を共有する
    wire [N_Mult-1:0]  data_in_valid    [0:N_PE-1][0:N_PE-1];
    wire [N_Mult-1:0]  data_out_ready   [0:N_PE_MUL-1][0:N_PE_MUL-1];

    assign  data_in_valid = data_out_valid;
    assign  data_in_ready = data_out_ready;

    generate
        for (r = 0; r < N_PE_MUL; r = r + 1) begin : MUL_ROW_BLOCK
            for (c = 0; c < N_PE_MUL; c = c + 1) begin : MUL_COL_BLOCK

                // 乗算器を外部に置く
                PE_mult #(
                    .DW                 (8),
                    .PW                 (32),
                    .SW                 (32),
                    .N                  (N_Mult)
                ) u_mult (
                    .clock              (clock),
                    .reset_n            (reset_n),

                    .data_in_valid      (data_out_valid[r][c]),
                    .data_out_ready     (data_in_ready[r][c]),
                    
                    .data_A             (data_A_in[r][c]),
                    .data_B             (data_B_in[r][c]),
                    .result_C           (data_C_out[r][c])
                );

            end
        end
    endgenerate

    // ------------------------------------------------
    // Bottom outputs
    // ------------------------------------------------
    wire [31:0] ps_bottom_out_flat [0:1];

    generate
        for (c = 0; c < N_PE; c = c + 1) begin : GEN_BOTTOM_OUT
            assign ps_bottom_out_flat[c] = ps_wire[N_PE][c];
        end
    endgenerate

    assign ps_bottom_out_bus_0  = ps_bottom_out_flat[0];
    assign ps_bottom_out_bus_1  = ps_bottom_out_flat[1];

    // ------------------------------------------------
    // done_out, busy_out
    // ------------------------------------------------
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