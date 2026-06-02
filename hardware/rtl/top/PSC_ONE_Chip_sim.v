// NISHIHARU
`timescale 1ns / 1ps

// cocotb
`define COCOTB_SIM

// icarusの場合はdefine OS_SIM
//`define OS_SIM

`define USE_LED_PIN
`define USE_SD_CARD
`define USE_MIC_MODEL

// SDRAM_Model Debug log=ON
//`define SDRAM_Debug_log

module PSC_ONE_Chip_sim #(
    parameter integer ADDR_WIDTH   = 32,
    parameter integer ID_WIDTH     = 1,
    parameter integer DATA_WIDTH   = 16    // fixed 16
)(
    input  wire         clock,
    input  wire         rst,

    // ---- UART ----
    input  wire         uart_rx,
    output wire         uart_tx,

    // ---- 外部 IO ----
    input  wire  [3:0]  PIO_external_in,     
    output wire  [3:0]  PIO_external_out,

    // ==== cocotb IF ====
    output wire         sdram_init_fin,  
    output wire         Boot_rom_done,

    // ==== LED ====
    output wire [7:0]   led_out
);

    // internal pull-up(down)
    //pullup(SDI_MISO);

`ifdef COCOTB_SIM
    // VCD, FST setting.
    `include "../rtl/top/cocotb_sim_chip_top.v"
`endif

    // ------------------------------
    // DUT 本体
    // ------------------------------
    PSC_ONE_Chip u_chip (
        .clock               (clock),
        .rst                 (rst),

        // ---- UART ----
        .uart_rx             (uart_rx),
        .uart_tx             (uart_tx),

        // ------------------ I2S ------------------
        .I2S_SCK             (I2S_SCK),
        .I2S_WS              (I2S_WS),
        .I2S_LR              (I2S_LR),
        .I2S_SD              (I2S_SD),

        // ---- 外部 IO ----
        .PIO_FPGA_external_in   (PIO_external_in),     
        .PIO_FPGA_external_out  (PIO_external_out),

        // ---- SD-CARD I/F ----
`ifdef USE_SD_CARD
        .SD_D3               (SDI_CS),
        .SD_CLK              (SDI_SCK),
        .SD_CMD              (SDI_MOSI),
        .SD_D0               (SDI_MISO),

        .SD_CD               (),
        .SD_WP               (),
        .SD_D1               (),
        .SD_D2               (),
`endif

        // ---- SDRAM pins ----
        .O_sdram_clk         (sdram_clk),
        .O_sdram_cs_n        (sdram_cs),
        .O_sdram_ras_n       (sdram_ras),
        .O_sdram_cas_n       (sdram_cas),
        .O_sdram_wen_n       (sdram_we),
        .O_sdram_addr        (sdram_adr),
        .O_sdram_ba          (sdram_ba),
        .O_sdram_dqm         (sdram_dqm),
        .IO_sdram_dq         (sdram_dq),

        // ---- LCD IF ----
        .tft_sck             (tft_sck), 
        .tft_sdi             (tft_sdi), 
        .tft_dc              (tft_dc), 
        .tft_cs              (tft_cs),

        // ---- LED ----
`ifdef USE_LED_PIN
        .led                 (led_out),
`endif

        // ---- cocotb IF ----
        .sdram_init_fin      (sdram_init_fin),
        .Boot_rom_done       (Boot_rom_done)
    );

    // LCD信号
    wire            tft_sck;
    wire            tft_sdi;
    wire            tft_dc;
    wire            tft_cs;

    // SDRAM信号
    wire            sdram_clk;
    wire            sdram_cs;
    wire            sdram_ras;
    wire            sdram_cas;
    wire            sdram_we;
    wire [10:0]     sdram_adr;
    wire [1:0]      sdram_ba;
    wire [3:0]      sdram_dqm;  
    wire [31:0]     sdram_dq;       // 32bit bus

    // SDカード信号
    wire            SDI_CS;
    wire            SDI_SCK;
    wire            SDI_MOSI;  
    wire            SDI_MISO;

    // I2S信号
    wire            I2S_SCK;
    wire            I2S_WS;
    wire            I2S_LR;
    wire            I2S_SD;

    // ------------------------------
    // SDRAM モデル（GW2AR SDRAM）
    //   - CKEは常時High
    // ------------------------------
    // SDRAMモデル（GW2AR SDRAM）
    GW2AR_sdram u_sdram_model (
        .Dq         (sdram_dq),
        .Addr       (sdram_adr),
        .Ba         (sdram_ba),
        .Clk        (sdram_clk),
        .Cke        (1'b1),
        .Cs_n       (sdram_cs),
        .Ras_n      (sdram_ras),
        .Cas_n      (sdram_cas),
        .We_n       (sdram_we),
        .Dqm        (sdram_dqm)
    );

    // ------------------------------
    // SDカード モデル
    // ------------------------------
`ifdef USE_SD_CARD
    sdcard_spi_model #(
        .INIT_R1_IDLE (8'h01),          // CMD0/CMD8応答(Idle)
        .R1_READY     (8'h00),          // ready時
        .DATA_HEX     ("")              // ""なら固定パターン
    ) u_sd_model (
        .clock      (clock),
        .cs         (SDI_CS),
        .sck        (SDI_SCK),
        .mosi       (SDI_MOSI),
        .miso       (SDI_MISO)
    );
`endif

    // ------------------------------
    // I2S MEMSマイクモデル
    // ------------------------------
`ifdef USE_MIC_MODEL
    PSC_I2S_MIC_MODEL #(
        .DATA_WIDTH     (32)
    ) u_mic_model (
        .clock      (clock),
        .SCK_i      (I2S_SCK),
        .WS_i       (I2S_WS),
        .LR_i       (I2S_LR),
        .SD_o       (I2S_SD)
    );
`endif

endmodule