// NISHIHARU
// Verilog-2001版 ST7796 SPI ドライバ + framebuffer read request + reset_n対応
`timescale 1ns / 1ps
module tft_ili9488 #(
    parameter integer INPUT_CLK_MHZ = 100
)(
    input  wire        clk,
    input  wire        reset_n,     // ★ 新規追加（Lowで全レジスタ初期化）

    input  wire        tft_sdo,     // 現状未使用 (MISO)
    output wire        tft_sck,
    output wire        tft_sdi,
    output wire        tft_dc,
    output reg         tft_reset,
    output wire        tft_cs,

    input  wire [23:0] framebufferData,
    output reg         framebuffer_pulth
);

    // ------------------------------------------------------------
    // SPIインターフェース制御側レジスタ
    // ------------------------------------------------------------
    reg [8:0] spiData;
    reg       spiDataSet;
    reg       pix_data_mode;
    wire      spiIdle;

    // フレームバッファ読み取りのバイトカウンタ
    reg [1:0] frameBufferPixCounter;

    // SPIサブモジュール
    tft_ili9488_spi u_ili_tft_spi (
        .spiClk             (clk),
        .reset_n            (reset_n),
        .data               (spiData),
        .dataAvailable      (spiDataSet),
        .pix_data_mode      (pix_data_mode),
        .tft_sck            (tft_sck),
        .tft_sdi            (tft_sdi),
        .tft_dc             (tft_dc),
        .tft_cs             (tft_cs),
        .idle               (spiIdle)
    );

    // ------------------------------------------------------------
    // 初期化シーケンス
    // ------------------------------------------------------------
    //localparam integer INIT_SEQ_LEN = 52;
    localparam integer INIT_SEQ_LEN = 19;
    reg [8:0] INIT_SEQ [0:INIT_SEQ_LEN-1];

    reg [7:0] initSeqCounter;

    localparam [3:0] ST_START            = 3'd0;
    localparam [3:0] ST_HOLD_RESET       = 3'd1;
    localparam [3:0] ST_READ_CHIP_NUM    = 3'd2;
    localparam [3:0] ST_WAIT_FOR_POWERUP = 3'd3;
    localparam [3:0] ST_SEND_INIT_SEQ    = 3'd4;
    localparam [3:0] ST_WAIT_120MSEC     = 3'd5;
    localparam [3:0] ST_LOOP             = 3'd6;

    reg [3:0]  state;
    reg [23:0] remainingDelayTicks;

    // ------------------------------------------------------------
    // INIT_SEQ の内容を初期設定（これはFPGA合成可）
    // ------------------------------------------------------------

    initial begin

        // Software Reset
        INIT_SEQ[0] = {1'b0,8'h01};

        // NOP
        INIT_SEQ[1] = {1'b0,8'h00};

        // Pixel Format = RGB666
        INIT_SEQ[2] = {1'b0,8'h3A};
        INIT_SEQ[3] = {1'b1,8'h66};

        // Memory Access Control
        INIT_SEQ[4] = {1'b0,8'h36};
        INIT_SEQ[5] = {1'b1,8'h48};

        // Column Address Set
        INIT_SEQ[6]  = {1'b0,8'h2A};
        INIT_SEQ[7]  = {1'b1,8'h00};
        INIT_SEQ[8]  = {1'b1,8'h00};
        INIT_SEQ[9]  = {1'b1,8'h01};
        INIT_SEQ[10] = {1'b1,8'hDF};

        // Row Address Set
        INIT_SEQ[11] = {1'b0,8'h2B};
        INIT_SEQ[12] = {1'b1,8'h00};
        INIT_SEQ[13] = {1'b1,8'h00};
        INIT_SEQ[14] = {1'b1,8'h01};
        INIT_SEQ[15] = {1'b1,8'h3F};

        // Sleep Out
        INIT_SEQ[16] = {1'b0,8'h11};

        // Display ON
        INIT_SEQ[17] = {1'b0,8'h29};

        // Memory Write
        INIT_SEQ[18] = {1'b0,8'h2C};

    end

    // ------------------------------------------------------------
    // ステートマシン
    // ------------------------------------------------------------
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // ★ リセット時の同期初期化
            tft_reset               <= 1'b1;
            spiData                 <= 9'd0;
            spiDataSet              <= 1'b0;
            pix_data_mode           <= 1'b0;
            frameBufferPixCounter   <= 2'd0;
            initSeqCounter          <= 8'd0;
            state                   <= ST_START;
            remainingDelayTicks     <= 24'd0;
            framebuffer_pulth       <= 1'b0;
        end else begin
            // 通常動作
            spiDataSet <= 1'b0;
            framebuffer_pulth   <= 1'b0;

            if (remainingDelayTicks > 3000) begin
                `ifdef COCOTB_SIM
                remainingDelayTicks <= remainingDelayTicks - 24'd3000;
                `else
                remainingDelayTicks <= remainingDelayTicks - 24'd1;
                `endif
            end else if (spiIdle && (spiDataSet == 1'b0)) begin
                case (state)
                    // state = 0
                    ST_START: begin
                        tft_reset               <= 1'b0;
                        remainingDelayTicks     <= INPUT_CLK_MHZ * 5000;
                        state                   <= ST_HOLD_RESET;
                        frameBufferPixCounter   <= 2'd0;
                    end

                    // state = 1
                    ST_HOLD_RESET: begin
                        tft_reset               <= 1'b1;
                        remainingDelayTicks     <= INPUT_CLK_MHZ * 120000;
                        state                   <= ST_READ_CHIP_NUM;
                        frameBufferPixCounter   <= 2'd0;
                    end

                    // state = 2
                    ST_READ_CHIP_NUM: begin
                        spiData                 <= {1'b0, 8'hD3};
                        spiDataSet              <= 1'b1;
                        remainingDelayTicks     <= INPUT_CLK_MHZ * 5000;
                        state                   <= ST_WAIT_FOR_POWERUP;
                        frameBufferPixCounter   <= 2'd0;
                    end

                    // state = 3
                    ST_WAIT_FOR_POWERUP: begin
                        spiData                 <= {1'b0, 8'h11};
                        spiDataSet              <= 1'b1;
                        remainingDelayTicks     <= INPUT_CLK_MHZ * 5000;
                        state                   <= ST_SEND_INIT_SEQ;
                        frameBufferPixCounter   <= 2'd0;
                    end

                    // state = 4
                    ST_SEND_INIT_SEQ: begin
                        if (initSeqCounter < INIT_SEQ_LEN) begin
                            spiData             <= INIT_SEQ[initSeqCounter];
                            spiDataSet          <= 1'b1;
                            initSeqCounter      <= initSeqCounter + 8'd1;
                        end else begin
                            state               <= ST_LOOP;
                            remainingDelayTicks <= INPUT_CLK_MHZ * 10000;
                        end
                    end

                    // state = 6
                    ST_LOOP: begin
                        pix_data_mode       <= 1'b1;
                        // pix data set.
                        spiDataSet          <= 1'b1;
                        framebuffer_pulth   <= 1'b0;
                        case (frameBufferPixCounter)
                            2'd0: begin
                                    spiData <= {1'b1, framebufferData[23:16]};
                                    framebuffer_pulth   <= 1'b0;
                                    frameBufferPixCounter <= frameBufferPixCounter + 2'd1;
                                  end
                            2'd1: begin
                                    spiData <= {1'b1, framebufferData[15:8]};
                                    framebuffer_pulth   <= 1'b0;
                                    frameBufferPixCounter <= frameBufferPixCounter + 2'd1;
                                  end
                            2'd2: 
                                begin
                                    spiData <= {1'b1, framebufferData[15:8]};
                                    framebuffer_pulth       <= 1'b1;
                                    frameBufferPixCounter   <= 2'd0;
                                end
                            default: 
                                begin
                                    spiDataSet <= 1'b0;
                                    framebuffer_pulth   <= 1'b0;
                                end     
                        endcase
                    end

                    default: begin
                        state               <= ST_START;
                        remainingDelayTicks <= 24'd0;
                    end
                endcase
            end
        end
    end

endmodule
