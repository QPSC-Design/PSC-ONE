// NISHIHARU
// PSC_ONE_LCD module. cpu write data ready.
// ILI9488
`timescale 1ns / 1ps
`define BSRAM_REDUCE

module PSC_ONE_LCD #(
    // MMIO base (word addressed)
    parameter integer CLK_FREQ               = 80,
    parameter integer DIV_CLK                = 8,
    parameter integer ADDR_WIDTH             = 32,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_ADDR = 32'h1000_3000,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_DATA = 32'h1000_3004
)(
    input  wire                     clock,
    input  wire                     reset_n,

    // TFT panel pins
    input  wire                     tft_sdo,    // input
    output wire                     tft_sck,
    output wire                     tft_sdi,
    output wire                     tft_dc,
    output wire                     tft_reset,
    output wire                     tft_cs,

    // CPU write IF (1clk パルス)
    input  wire                     cpu_wvalid,
    input  wire [ADDR_WIDTH-1:0]    cpu_waddr,
    input  wire [31:0]              cpu_wdata,
    output reg                      cpu_wready   // 1clk パルス
);

    `ifdef BSRAM_REDUCE
    localparam  address_width = 15;
    `else
    localparam  address_width = 17;
    `endif

    // アドレス
    wire [ADDR_WIDTH+1:0]     cpu_byte_waddr = cpu_waddr;   // byte address

    // ---------------- cpu_valid latch ----------------
    reg     cpu_wvalid_latch;
    
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            cpu_wvalid_latch    <= 1'b0;
        end else begin
            cpu_wvalid_latch    <= cpu_wvalid;
        end
    end

    // ===============================================================
    // clock_divider
    // ===============================================================
    reg [$clog2(DIV_CLK)-1:0] cnt;
    reg clk_div;

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            cnt     <= 0;
            clk_div <= 1'b0;
        end else begin
            if (cnt == (DIV_CLK/2 - 1)) begin
                cnt     <= 0;
                clk_div <= ~clk_div;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

    wire    div_clk = clk_div;

    // ===============================================================
    // ここから下はdiv_clk駆動
    // ===============================================================
    wire    fbClk_posedge;

    // ------------------------------------------------------------
    // fbClk: TFT側からのピクセル転送クロック (kHz想定)
    //        tft_ili9488 から受け取る
    // ------------------------------------------------------------

    //localparam integer FB_PIXELS = 320*240; // 76800
    //localparam integer FB_BITS   = 17;      // ceil(log2(76800)) = 17
    localparam integer FB_PIXELS = 480*320;
    localparam integer FB_BITS   = 20;

    // framebufferIndex: 今描画中のピクセル番号 (0..76799)
    reg [FB_BITS-1:0] framebufferIndex;

    always @(posedge div_clk or negedge reset_n) begin
        if (~reset_n) begin
            framebufferIndex <= {FB_BITS{1'b0}};
        end else begin
            if(fbClk_posedge) begin
                // increment with wrap
                if (framebufferIndex == FB_PIXELS-1)
                    framebufferIndex <= {FB_BITS{1'b0}};
                else
                    framebufferIndex <= framebufferIndex + 1'b1;
            end
        end
    end

    // ------------------------------------------------------------
    // X, Y 座標計算 (fbClkドメイン)
    // x: 0..319 (9bit), y: 0..239 (8bit)
    // 合成では /, % は重いけどまずは正しさ優先
    // ------------------------------------------------------------
    reg [8:0] pos_x;
    reg [9:0] pos_y;

    always @(posedge div_clk or negedge reset_n) begin
        if (~reset_n) begin
            pos_x <= 9'd0;
            pos_y <= 10'd0;
        end else if (fbClk_posedge) begin
            if (pos_x == 9'd479) begin
                pos_x <= 9'd0;
                if (pos_y == 10'd319)
                    pos_y <= 10'd0;
                else
                    pos_y <= pos_y + 10'd1;
            end else begin
                pos_x <= pos_x + 9'd1;
            end
        end
    end

    // ------------------------------------------------------------
    // CPU書き込み側アドレス
    reg [address_width-1:0] pix_waddr;
    reg [2:0] pix_wdata;
    reg cpu_waddr_ready;
    reg pix_wen;

    always @(posedge div_clk or negedge reset_n) begin
        if (~reset_n) begin
            pix_waddr <= 17'd0;
            pix_wdata <= 3'd0;
            cpu_wready <= 1'b0;
            pix_wen <= 1'b0;
        end else begin
            cpu_wready <= 1'b0;
            pix_wen <= 1'b0;
            // CPU I/F
            if(cpu_wvalid_latch) begin
                case(cpu_byte_waddr)
                    LCD_PIXS_ADDR: begin
                        pix_waddr <= cpu_wdata[16:0]; 
                        cpu_wready <= 1'b1;
                    end
                    LCD_PIXS_DATA: begin
                        pix_wdata <= cpu_wdata[2:0];
                        cpu_wready <= 1'b1;
                        pix_wen <= 1'b1;
                    end
                endcase
            end
        end
    end

    // ------------------------------------------------------------
    // フレームバッファ読み出し
    // 読み側のアドレス: 
    reg [address_width-1:0] data_read_addr;
    reg data_rvalid;

    wire [7:0] offset_x = 8'd1;
    wire [7:0] x_offseted = (pos_x >= offset_x)? pos_x - offset_x : 8'd0;

    always @(posedge div_clk) begin
        // address
        `ifdef BSRAM_REDUCE
        data_read_addr <= { pos_y[8:1], pos_x[7:1] };    // BSRAM削減Ver
        `else
        data_read_addr <= { pos_y[8:0], pos_x[7:0] };    // 9bit + 8bit
        `endif
        // rvalid
        if(fbClk_posedge) begin
            data_rvalid <= 1'b1;
        end else begin
            data_rvalid <= 1'b0;
        end
    end

    wire [2:0] data_rdata;

    // PIXELS Data Memory
    lcd_pixels_data #(
        .DATA_WIDTH         (3),
        `ifdef BSRAM_REDUCE
        .INDEX_WIDTH        (15)     // BSRAM削減Ver
        `else
        .INDEX_WIDTH        (17)
        `endif
    ) u_data (
        .clock              (div_clk),
        .reset_n            (reset_n),

        // CPU write port (clockドメイン)
        .data_waddr         (pix_waddr),
        .data_wvalid        (pix_wen),
        .data_wready        (),
        .data_write         (pix_wdata),

        // LCD read port (同じclockドメインで今は読んでる)
        // ※将来はデュアルポート化してfbClk側から読ませるとCDC消える
        .data_rvalid        (data_rvalid),
        .data_raddr         (data_read_addr),
        .data_read          (data_rdata)
    );

    // ------------------------------------------------------------
    // ピクセル色生成 (fbClkドメイン)
    // ------------------------------------------------------------
    wire [2:0] pixel_on = data_rdata;

    // RGB666
    wire [5:0] red;
    wire [5:0] blue;
    wire [5:0] green;

    /*
    assign red   =  (y[3]==1'b1) ? 5'h1F : 5'd0;
    assign blue  =  (y[4]==1'b1) ? 5'h1F : 5'd0;
    assign green =  (y[5]==1'b1) ? 6'h3F : 6'd0;
    */

    assign red   =  (pos_x[5]==1'b1) ? 6'h3F : 6'd0;
    assign blue  =  (pos_x[6]==1'b1) ? 6'h3F : 6'd0;
    assign green =  (pos_x[7]==1'b1) ? 6'h3F : 6'd0;

    /*
    assign red   =  pixel_on[0] ? 5'h1F : 5'd0;
    assign blue  =  pixel_on[1] ? 5'h1F : 5'd0;
    assign green =  pixel_on[2] ? 6'h3F : 6'd0;
    */

    wire [23:0] currentPixel = {{red,2'b00}, {green,2'b00}, {blue,2'b00}};

    // ------------------------------------------------------------
    // TFT Module
    //  - tft_ILI9488 は SPI 叩いて ILI9488 にピクセルを投げる
    //  - fbClk_posedge (fbClk_posedge) を出してくる想定
    //  - currentPixel を逐次受け取る
    // ------------------------------------------------------------
    tft_ili9488 #(
        .INPUT_CLK_MHZ      (CLK_FREQ)
    ) u_ili_tft (
        .clk                (div_clk),
        .reset_n            (reset_n),
        .tft_sdo            (tft_sdo),          // Input
        .tft_sck            (tft_sck),
        .tft_sdi            (tft_sdi),
        .tft_dc             (tft_dc),
        .tft_reset          (tft_reset),
        .tft_cs             (tft_cs),
        .framebufferData    (currentPixel[23:0]),
        .framebuffer_pulth  (fbClk_posedge)
    );

endmodule

// ===============================================================
// フレームバッファRAM（1クロック同期, R/W同時OK, 衝突時は書き込み値を即読出）
// ===============================================================
module lcd_pixels_data #(
    parameter DATA_WIDTH  = 3,
    parameter INDEX_WIDTH = 17,
    parameter DEPTH       = (1 << INDEX_WIDTH)
)(
    input  wire                     clock,
    input  wire                     reset_n,

    // CPU write port
    input  wire [INDEX_WIDTH-1:0]   data_waddr,
    input  wire                     data_wvalid,
    output reg                      data_wready,
    input  wire [DATA_WIDTH-1:0]    data_write,

    // LCD read port
    input  wire                     data_rvalid,
    input  wire [INDEX_WIDTH-1:0]   data_raddr,
    output reg  [DATA_WIDTH-1:0]    data_read
);

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

`ifdef COCOTB_SIM
    integer i;
    initial begin
        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] = {DATA_WIDTH{1'b0}};
    end
`endif

    // 同期Read/Write + 衝突時フォワード
    always @(posedge clock or negedge reset_n) begin
        if (~reset_n) begin
            data_read <= {DATA_WIDTH{1'b0}};
        end else begin
            // デフォルトは非アサート
            data_wready <= 1'b0;

            // 先にWrite（同サイクル衝突時のメモリ内容はベンダ依存なので明示的に書く）
            if (data_wvalid) begin
                mem[data_waddr] <= data_write;
                data_wready      <= 1'b1;
            end

            // Readは同期更新
            if (data_rvalid) begin
                // 通常はメモリから読んで出力
                data_read <= mem[data_raddr];

                // ただし同一サイクルで R/W 両方有効かつ同一アドレスなら
                // 直前に書いた data_write を “ライトスルー” で優先させる
                if (data_wvalid && (data_waddr == data_raddr)) begin
                    data_read <= data_write;
                end
            end
        end
    end
endmodule
