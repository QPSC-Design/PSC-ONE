module sim_PE_topx2 #(
    parameter integer DW       = 8,
    parameter integer PW       = 32,
    parameter integer SW       = PW,
    parameter integer PE_CYCLE = 1
)(
    input  wire             clock,
    input  wire             reset_n,

    input  wire             data_clear,
    input  wire             start,
    input  wire             en_b_shift_bottom,
    input  wire             en_shift_right,
    input  wire             en_shift_bottom,

    input  wire [DW-1:0]   b_in,
    input  wire [DW-1:0]   a_in,
    input  wire [SW-1:0]   ps_in,

    output wire            busy,
    output wire            done,

    output wire [DW-1:0]   a_shift_to_right,
    output wire [DW-1:0]   b_shift_to_bottom,
    output wire [SW-1:0]   sum_to_bottom,
    output wire [SW-1:0]   ps_acc
);

    `ifdef COCOTB_SIM
    `include "./src/include_vcd_output.v"
    `endif

    // ============================================================
    // PE0
    // ============================================================

    wire          pe0_valid;
    wire          pe0_ready;

    wire [DW-1:0] pe0_A;
    wire [DW-1:0] pe0_B;
    wire [PW-1:0] pe0_C;

    wire          pe0_busy;
    wire          pe0_done;

    wire [DW-1:0] pe0_a_shift;
    wire [DW-1:0] pe0_b_shift;
    wire [SW-1:0] pe0_sum;
    wire [SW-1:0] pe0_acc;

    // ============================================================
    // PE1
    // ============================================================

    wire          pe1_valid;
    wire          pe1_ready;

    wire [DW-1:0] pe1_A;
    wire [DW-1:0] pe1_B;
    wire [PW-1:0] pe1_C;

    wire          pe1_busy;
    wire          pe1_done;

    wire [DW-1:0] pe1_a_shift;
    wire [DW-1:0] pe1_b_shift;
    wire [SW-1:0] pe1_sum;
    wire [SW-1:0] pe1_acc;

    // ============================================================
    // shared multiplier wires
    // ============================================================

    wire [3:0] mult_valid;
    wire [3:0] mult_ready;

    wire [31:0] mult_A;
    wire [31:0] mult_B;

    wire [63:0] mult_C;

    // ============================================================
    // pack
    // ============================================================

    assign mult_valid[0] = pe0_valid;
    assign mult_valid[1] = pe1_valid;
    assign mult_valid[2] = 1'b0;
    assign mult_valid[3] = 1'b0;

    assign mult_A[7:0]   = pe0_A;
    assign mult_A[15:8]  = pe1_A;
    assign mult_A[31:16] = 16'd0;

    assign mult_B[7:0]   = pe0_B;
    assign mult_B[15:8]  = pe1_B;
    assign mult_B[31:16] = 16'd0;

    // ============================================================
    // ready return
    // ============================================================

    assign pe0_ready = mult_ready[0];
    assign pe1_ready = mult_ready[1];

    // ============================================================
    // result return
    // ============================================================

    assign pe0_C = mult_C[31:0];
    assign pe1_C = mult_C[63:32];

    // ============================================================
    // PE0
    // ============================================================

    PE_INT #(
        .DW         (DW),
        .PW         (PW),
        .SW         (SW),
        .PE_CYCLE   (PE_CYCLE)
    ) u_pe_0 (
        .clock              (clock),
        .reset_n            (reset_n),

        .data_clear         (data_clear),
        .start              (start),

        .en_b_shift_bottom  (en_b_shift_bottom),
        .en_shift_right     (en_shift_right),
        .en_shift_bottom    (en_shift_bottom),

        .b_in               (b_in),
        .a_in               (a_in),
        .ps_in              (ps_in),

        .data_out_valid     (pe0_valid),
        .data_in_ready      (pe0_ready),

        .data_A             (pe0_A),
        .data_B             (pe0_B),
        .result_C           (pe0_C),

        .busy               (pe0_busy),
        .done               (pe0_done),

        .a_shift_to_right   (pe0_a_shift),
        .b_shift_to_bottom  (pe0_b_shift),
        .sum_to_bottom      (pe0_sum),
        .ps_acc             (pe0_acc)
    );

    // ============================================================
    // PE1
    // ============================================================

    PE_INT #(
        .DW         (DW),
        .PW         (PW),
        .SW         (SW),
        .PE_CYCLE   (PE_CYCLE)
    ) u_pe_1 (
        .clock              (clock),
        .reset_n            (reset_n),

        .data_clear         (data_clear),
        .start              (start),

        .en_b_shift_bottom  (en_b_shift_bottom),
        .en_shift_right     (en_shift_right),
        .en_shift_bottom    (en_shift_bottom),

        .b_in               (b_in),
        .a_in               (a_in),
        .ps_in              (ps_in),

        .data_out_valid     (pe1_valid),
        .data_in_ready      (pe1_ready),

        .data_A             (pe1_A),
        .data_B             (pe1_B),
        .result_C           (pe1_C),

        .busy               (pe1_busy),
        .done               (pe1_done),

        .a_shift_to_right   (pe1_a_shift),
        .b_shift_to_bottom  (pe1_b_shift),
        .sum_to_bottom      (pe1_sum),
        .ps_acc             (pe1_acc)
    );

    // ============================================================
    // shared multiplier
    // ============================================================

    PE_mult #(
        .DW (DW),
        .PW (PW),
        .SW (SW),
        .N  (4)
    ) u_mult (
        .clock              (clock),
        .reset_n            (reset_n),

        .data_in_valid      (mult_valid),
        .data_out_ready     (mult_ready),

        .data_A             (mult_A),
        .data_B             (mult_B),

        .result_C           (mult_C)
    );

    // ============================================================
    // output
    // ============================================================

    assign busy = pe0_busy | pe1_busy;
    assign done = pe0_done & pe1_done;

    assign a_shift_to_right = pe0_a_shift;
    assign b_shift_to_bottom = pe0_b_shift;

    assign sum_to_bottom = pe0_sum;
    assign ps_acc = pe0_acc;

endmodule