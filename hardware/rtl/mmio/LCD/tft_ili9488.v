// NISHIHARU
// Verilog-2001版 ST7796 SPI ドライバ + framebuffer read request + reset_n対応
`timescale 1ns/1ps
module tft_ili9488 #(
    parameter integer INPUT_CLK_MHZ     = 100,
    parameter integer DIV_CLK           = 8,
    parameter integer X_PIXELS          = 32,
    parameter integer Y_PIXELS          = 32,
    parameter integer READ_MEM_CYCLE    = 50,
    parameter integer PANEL_PIXELS      = X_PIXELS * Y_PIXELS
)(
    input  wire        clk,
    input  wire        reset_n,     // Input

    input  wire        write_start,
    output reg         write_ready,
    input  wire [8:0]  x_start_pos,
    input  wire [8:0]  y_start_pos,
    input  wire [8:0]  x_end_pos,
    input  wire [8:0]  y_end_pos,

    input  wire        tft_sdo,     // 現状未使用 (MISO)
    output wire        tft_sck,
    output wire        tft_sdi,
    output wire        tft_dc,
    output reg         tft_reset,
    output wire        tft_cs,

    input  wire [23:0] framebufferData,         // 8bit x 3
    output reg         framebufferData_valid,
    input  wire        framebufferData_ready,   // 未使用
    output wire        frame_change
);

    // ------------------------------------------------------------
    reg [32:0] pixel_count;
    assign frame_change = (pixel_count == 32'd0);

    // ------------------------------------------------------------
    // SPIインターフェース制御側レジスタ
    // ------------------------------------------------------------
    reg [8:0] spiData;
    reg       spiCmdSet;
    reg       spiDataSet;
    wire      spiIdle;

    // SPIサブモジュール
    tft_ili9488_spi spi (
        .spiClk        (clk),
        .data          (spiData),
        .dataAvailable (spiCmdSet | spiDataSet),
        .tft_sck       (tft_sck),
        .tft_sdi       (tft_sdi),
        .tft_dc        (tft_dc),
        .tft_cs        (tft_cs),
        .idle          (spiIdle)
    );

    // ------------------------------------------------------------
    // 初期化シーケンス
    // ------------------------------------------------------------
    //localparam integer INIT_SEQ_LEN = 52;
    localparam integer INIT_SEQ_LEN = 19;
    wire [8:0] INIT_SEQ [0:INIT_SEQ_LEN-1];

    reg [7:0] initSeqCounter;

    localparam [2:0] ST_START            = 3'd0;
    localparam [2:0] ST_HOLD_RESET       = 3'd1;
    localparam [2:0] ST_WAIT_FOR_POWERUP = 3'd2;
    localparam [2:0] ST_SEND_INIT_SEQ    = 3'd3;
    localparam [2:0] ST_DATA_READ        = 3'd4;
    localparam [2:0] ST_LOOP             = 3'd5;

    reg [2:0]  state;
    reg [23:0] remainingDelayTicks;

    reg [3:0]  sub_pixel_count;

    // ------------------------------------------------------------
    // INIT_SEQ の内容を初期設定（これはFPGA合成可）
    // ------------------------------------------------------------
    
    /*
    // ili9341
    initial begin
        // --- (省略なしで以前と同じ内容) ---
        INIT_SEQ[0]  = {1'b0, 8'h28};
        INIT_SEQ[1]  = {1'b0, 8'hCF}; INIT_SEQ[2]  = {1'b1, 8'h00}; INIT_SEQ[3]  = {1'b1, 8'h83}; INIT_SEQ[4]  = {1'b1, 8'h30};
        INIT_SEQ[5]  = {1'b0, 8'hED}; INIT_SEQ[6]  = {1'b1, 8'h64}; INIT_SEQ[7]  = {1'b1, 8'h03}; INIT_SEQ[8]  = {1'b1, 8'h12}; INIT_SEQ[9]  = {1'b1, 8'h81};
        INIT_SEQ[10] = {1'b0, 8'hE8}; INIT_SEQ[11] = {1'b1, 8'h85}; INIT_SEQ[12] = {1'b1, 8'h01}; INIT_SEQ[13] = {1'b1, 8'h79};
        INIT_SEQ[14] = {1'b0, 8'hCB}; INIT_SEQ[15] = {1'b1, 8'h39}; INIT_SEQ[16] = {1'b1, 8'h2C}; INIT_SEQ[17] = {1'b1, 8'h00}; INIT_SEQ[18] = {1'b1, 8'h34}; INIT_SEQ[19] = {1'b1, 8'h02};
        INIT_SEQ[20] = {1'b0, 8'hF7}; INIT_SEQ[21] = {1'b1, 8'h20};
        INIT_SEQ[22] = {1'b0, 8'hEA}; INIT_SEQ[23] = {1'b1, 8'h00}; INIT_SEQ[24] = {1'b1, 8'h00};
        INIT_SEQ[25] = {1'b0, 8'hC0}; INIT_SEQ[26] = {1'b1, 8'h26};
        INIT_SEQ[27] = {1'b0, 8'hC1}; INIT_SEQ[28] = {1'b1, 8'h11};
        INIT_SEQ[29] = {1'b0, 8'hC5}; INIT_SEQ[30] = {1'b1, 8'h35}; INIT_SEQ[31] = {1'b1, 8'h3E};
        INIT_SEQ[32] = {1'b0, 8'hC7}; INIT_SEQ[33] = {1'b1, 8'hBE};
        INIT_SEQ[34] = {1'b0, 8'h3A}; INIT_SEQ[35] = {1'b1, 8'h55};
        INIT_SEQ[36] = {1'b0, 8'hB1}; INIT_SEQ[37] = {1'b1, 8'h00}; INIT_SEQ[38] = {1'b1, 8'h1B};
        INIT_SEQ[39] = {1'b0, 8'h26}; INIT_SEQ[40] = {1'b1, 8'h01};
        INIT_SEQ[41] = {1'b0, 8'h51}; INIT_SEQ[42] = {1'b1, 8'hFF};
        INIT_SEQ[43] = {1'b0, 8'hB7}; INIT_SEQ[44] = {1'b1, 8'h07};
        INIT_SEQ[45] = {1'b0, 8'hB6}; INIT_SEQ[46] = {1'b1, 8'h0A}; INIT_SEQ[47] = {1'b1, 8'h82}; INIT_SEQ[48] = {1'b1, 8'h27}; INIT_SEQ[49] = {1'b1, 8'h00};
        INIT_SEQ[50] = {1'b0, 8'h29};
        INIT_SEQ[51] = {1'b0, 8'h2C};
    end
    */

    // Software Reset
    assign INIT_SEQ[0] = {1'b0,8'h01};

    // NOP
    assign INIT_SEQ[1] = {1'b0,8'h00};

    // Pixel Format = RGB666
    assign INIT_SEQ[2] = {1'b0,8'h3A};
    assign INIT_SEQ[3] = {1'b1,8'h66};

    // Memory Access Control
    assign INIT_SEQ[4] = {1'b0,8'h36};
    //assign INIT_SEQ[5] = {1'b1,8'h48};
    assign INIT_SEQ[5] = {1'b1,8'hC8};

    // Sleep Out
    assign INIT_SEQ[6] = {1'b0,8'h11};

    // Display ON
    assign INIT_SEQ[7] = {1'b0,8'h29};

    // Column Address Set
    assign INIT_SEQ[8]  = {1'b0,8'h2A};
    assign INIT_SEQ[9]  = {1'b1, {7'd0, x_start_pos[8]}};
    assign INIT_SEQ[10] = {1'b1, x_start_pos[7:0]};
    assign INIT_SEQ[11] = {1'b1, {7'd0, x_end_pos[8]}};    // 0x001F = 31
    assign INIT_SEQ[12] = {1'b1, x_end_pos[7:0]};

    //assign INIT_SEQ[9]  = {1'b1,8'h01};    // 0x013F = 319
    //assign INIT_SEQ[10] = {1'b1,8'h3F};

    // Row Address Set
    assign INIT_SEQ[13] = {1'b0,8'h2B};
    assign INIT_SEQ[14] = {1'b1, {7'd0, y_start_pos[8]}};
    assign INIT_SEQ[15] = {1'b1, y_start_pos[7:0]};
    assign INIT_SEQ[16] = {1'b1, {7'd0, y_end_pos[8]}};
    assign INIT_SEQ[17] = {1'b1, y_end_pos[7:0]};    // 0x003F = 31

    //assign INIT_SEQ[14] = {1'b1,8'h01};
    //assign INIT_SEQ[15] = {1'b1,8'hDF};    // 0x01DF = 479

    // Memory Write
    assign INIT_SEQ[18] = {1'b0,8'h2C};


    // ------------------------------------------------------------
    // ステートマシン
    // ------------------------------------------------------------
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // ★ リセット時の同期初期化
            tft_reset             <= 1'b1;
            spiData               <= 9'd0;
            spiCmdSet             <= 1'b0;
            spiDataSet            <= 1'b0;
            framebufferData_valid <= 1'b0;
            initSeqCounter        <= 8'd0;
            state                 <= ST_START;
            remainingDelayTicks   <= 24'd0;
            pixel_count           <= 32'd0;
            sub_pixel_count       <= 4'd0;
            write_ready           <= 1'b0;
        end else begin
            // 通常動作
            spiCmdSet             <= 1'b0;
            spiDataSet            <= 1'b0;
            write_ready           <= 1'b0;
            framebufferData_valid <= 1'b0;

            if (remainingDelayTicks > 0) begin
                remainingDelayTicks <= remainingDelayTicks - 24'd1;
            end else if (write_start && spiIdle && (spiCmdSet == 1'b0) && (spiDataSet == 1'b0)) begin
                case (state)
                    // state = 0
                    ST_START: begin
                        tft_reset           <= 1'b0;
                        remainingDelayTicks <= INPUT_CLK_MHZ * 10;
                        state               <= ST_HOLD_RESET;
                    end

                    // state = 1
                    ST_HOLD_RESET: begin
                        tft_reset           <= 1'b1;
                        `ifdef COCOTB_SIM
                        remainingDelayTicks <= INPUT_CLK_MHZ * 10;
                        `else
                        remainingDelayTicks <= INPUT_CLK_MHZ * 120000;
                        `endif
                        state               <= ST_WAIT_FOR_POWERUP;
                    end

                    // state = 2
                    ST_WAIT_FOR_POWERUP: begin
                        spiData             <= {1'b0, 8'h11};
                        spiCmdSet           <= 1'b1;
                        `ifdef COCOTB_SIM
                        remainingDelayTicks <= INPUT_CLK_MHZ * 5;
                        `else
                        remainingDelayTicks <= INPUT_CLK_MHZ * 5000;
                        `endif
                        state               <= ST_SEND_INIT_SEQ;
                    end

                    // state = 3
                    ST_SEND_INIT_SEQ: begin
                        if (initSeqCounter < INIT_SEQ_LEN) begin
                            spiData        <= INIT_SEQ[initSeqCounter];
                            spiCmdSet      <= 1'b1;
                            initSeqCounter <= initSeqCounter + 8'd1;
                        end else begin
                            state               <= ST_DATA_READ;
                            `ifdef COCOTB_SIM
                            remainingDelayTicks <= INPUT_CLK_MHZ * 10;
                            `else
                            remainingDelayTicks <= INPUT_CLK_MHZ * 10000;
                            `endif
                        end
                    end

                    // state = 4
                    ST_DATA_READ: begin
                        framebufferData_valid <= 1'b1;
                        state               <= ST_LOOP;
                        remainingDelayTicks <= READ_MEM_CYCLE;
                    end

                    // state = 5
                    ST_LOOP: begin

                        case (sub_pixel_count)
                            4'd0: begin
                                spiData <= {1'b1, framebufferData[23:16]};    // LCDパネルがRGBではなく、BRGなどになってる
                                sub_pixel_count   <= 4'd1;
                                spiDataSet        <= 1'b1;
                            end
                            4'd1: begin
                                spiData <= {1'b1, framebufferData[7:0]};
                                sub_pixel_count   <= 4'd2;
                                spiDataSet        <= 1'b1;
                            end
                            4'd2: begin
                                spiDataSet        <= 1'b1;
                                if (pixel_count == PANEL_PIXELS - 1) begin
                                    pixel_count         <= 32'd0;
                                    write_ready         <= 1'b1;
                                    remainingDelayTicks <= INPUT_CLK_MHZ * 100;
                                    sub_pixel_count     <= 4'd0;
                                    initSeqCounter      <= 8;      // Column Address Set
                                    state               <= ST_SEND_INIT_SEQ;
                                end else begin
                                    spiData <= {1'b1, framebufferData[15:8]};
                                    sub_pixel_count      <= 4'd0;
                                    pixel_count          <= pixel_count + 32'd1;
                                    state                <= ST_DATA_READ;
                                end
                            end
                            default: begin
                                spiData <= {1'b0, 8'h0};
                                spiDataSet        <= 1'b1;
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
