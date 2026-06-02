module sim_PE_top #(
    parameter integer DW            = 8,          // A/B のビット幅
    parameter integer PW            = 32,         // 積のビット幅. 32bit固定
    parameter integer SW            = PW,         // 部分和のビット幅
    parameter integer PE_CYCLE      = 0
)(
    // Clock & Reset
    input  wire             clock,
    input  wire             reset_n,

    // Control signals
    input  wire             data_clear,         // レジスタクリア
    input  wire             start,              // 乗算開始（busy=0 の時のみ受付）
    input  wire             en_b_shift_bottom,  // 上からの B を取り込み/下へ配る
    input  wire             en_shift_right,     // 左からの A を取り込み/右へ配る
    input  wire             en_shift_bottom,    // 上からの ps を取り込み/下へ送る
    
    // Inputs
    input  wire [DW-1:0]    b_in,               // B from top
    input  wire [DW-1:0]    a_in,               // A from left
    input  wire [SW-1:0]    ps_in,              // partial sum from top

    // Outputs (to neighbors)
    output reg              busy, 
    output reg              done, 
    output wire [DW-1:0]    a_shift_to_right,   // to right PE
    output wire [DW-1:0]    b_shift_to_bottom,  // to bottom PE
    output reg  [SW-1:0]    sum_to_bottom,      // to bottom PE
    output reg  [SW-1:0]    ps_acc              // PE ACC: 32bit
);
    // vcd output
    `ifdef COCOTB_SIM
    `include "./src/include_vcd_output.v"
    `endif
    
    // wire
    wire          busy_wire;
    wire          done_wire;

    wire [DW-1:0] data_A_in;
    wire [DW-1:0] data_B_in;
    wire [PW-1:0] data_C_out;

    // test output
    assign busy = busy_wire;
    assign done = done_wire;

    // with PE_mult
    wire          data_out_valid;
    wire          data_in_ready;

    PE_INT #(
        .DW                 (DW),
        .PW                 (PW),
        .SW                 (SW),
        .PE_CYCLE           (PE_CYCLE)
    ) u_pe (
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

        .data_out_valid     (data_out_valid),
        .data_in_ready      (data_in_ready),

        .data_A             (data_A_in),
        .data_B             (data_B_in),
        .result_C           (data_C_out),

        .busy               (busy_wire),
        .done               (done_wire),

        .a_shift_to_right   (a_shift_to_right),
        .b_shift_to_bottom  (b_shift_to_bottom),
        .sum_to_bottom      (sum_to_bottom),
        .ps_acc             (ps_acc)
    );

    // ------------------------------------------------
    // parameters
    // ------------------------------------------------
    localparam integer N_Mult  = 1;

    // 乗算器を外部に置く
    PE_mult #(
        .DW                 (DW),
        .PW                 (PW),
        .SW                 (SW),
        .N                  (N_Mult)
    ) u_mult (
        .clock              (clock),
        .reset_n            (reset_n),

        .data_in_valid      (data_out_valid),
        .data_out_ready     (data_in_ready),
        
        .data_A             (data_A_in),
        .data_B             (data_B_in),
        .result_C           (data_C_out)
    );


endmodule