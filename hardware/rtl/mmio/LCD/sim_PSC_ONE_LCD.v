// NISHIHARU
`timescale 1ns / 1ps
`define BSRAM_REDUCE

module sim_PSC_ONE_LCD #(
    // MMIO base (word addressed)
    parameter integer CLK_FREQ               = 80,
    parameter integer DIV_CLK                = 8,
    parameter integer ADDR_WIDTH             = 32,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_ADDR = 32'h1000_3000,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_DATA = 32'h1000_3004
)(
    input  wire                     clock,
    input  wire                     reset_n,

    // ---------------- PSC-ONE LCD ----------------
    output wire                     PSCONE_LCD_CS,
    output wire                     PSCONE_LCD_RST,
    output wire                     PSCONE_LCD_BL,
    output wire                     PSCONE_LCD_DC,
    output wire                     PSCONE_LCD_SCK,
    output wire                     PSCONE_LCD_SDI,
    input  wire                     PSCONE_LCD_SDO,

    // ---------------- CPU I/F ----------------
    input  wire                     cpu_wvalid,
    input  wire [ADDR_WIDTH-1:0]    cpu_waddr,
    input  wire [31:0]              cpu_wdata,
    output reg                      cpu_wready   // 1clk パルス
);

    `ifdef COCOTB_SIM
    initial begin
        $dumpfile("./wave/PSC_LCD_test.vcd");  // 出力するVCDファイル名
        $dumpvars(0);     // 第1引数: 階層 (0 はこのモジュールを最上位として)
    end
    `else
    initial begin
        $display("COCOTB_SIM DISABLE");
    end
    `endif

    PSC_ONE_LCD #(
        .CLK_FREQ       (80),
        .DIV_CLK        (8),
        .ADDR_WIDTH     (32),
        .LCD_PIXS_ADDR  (32'h1000_3000),
        .LCD_PIXS_DATA  (32'h1000_3004)
    ) u_lcd (
        .clock          (clock),
        .reset_n        (reset_n),

        .tft_sdo        (PSCONE_LCD_SDO),
        .tft_sck        (PSCONE_LCD_SCK),
        .tft_sdi        (PSCONE_LCD_SDI),
        .tft_dc         (PSCONE_LCD_DC),
        .tft_reset      (PSCONE_LCD_RST),
        .tft_cs         (PSCONE_LCD_CS),

        .cpu_wvalid     (cpu_wvalid),
        .cpu_waddr      (cpu_waddr),
        .cpu_wdata      (cpu_wdata),
        .cpu_wready     (cpu_wready)
    );

endmodule