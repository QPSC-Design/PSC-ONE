// NISHIHARU
// PSC_ONE_LCD module. cpu write data ready.
// ILI9488
`timescale 1ns / 1ps

module PSC_ONE_LCD #(
    // MMIO base (word addressed)
    parameter integer CLK_FREQ               = 80,
    parameter integer DIV_CLK                = 2,
    parameter         IPS_MODE               = 1,           // IPS LCD = 1.
    parameter integer X_PIXELS               = 320,
    parameter integer Y_PIXELS               = 480,
    parameter integer ADDR_WIDTH             = 32,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_ADDR = 32'h1000_3000,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_DATA = 32'h1000_3004,
    parameter [ADDR_WIDTH-1:0] LCD_PIXS_ST   = 32'h1000_3008
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
    input  wire                     cpu_rvalid,
    input  wire [ADDR_WIDTH-1:0]    cpu_raddr,
    output reg  [31:0]              cpu_rdata,
    output reg                      cpu_rready,

    input  wire                     cpu_wvalid,
    input  wire [ADDR_WIDTH-1:0]    cpu_waddr,
    input  wire [31:0]              cpu_wdata,
    output reg                      cpu_wready   // 1clk パルス
);

    // アドレス
    wire [ADDR_WIDTH-1:0]     cpu_byte_waddr = cpu_waddr;   // byte address
    wire [ADDR_WIDTH-1:0]     cpu_byte_raddr = cpu_raddr;   // byte address

    // ---------------- cpu_valid latch ----------------
    reg     cpu_rvalid_latch;
    reg     cpu_wvalid_latch;
    
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            cpu_rvalid_latch    <= 1'b0;
            cpu_wvalid_latch    <= 1'b0;
        end else begin
            cpu_rvalid_latch    <= cpu_rvalid;
            cpu_wvalid_latch    <= cpu_wvalid;
        end
    end

    // ------------------------------------------------------------
    // CPU書き込み側アドレス
    reg [17:0] pix_waddr;
    reg [17:0] pix_wdata;
    reg cpu_waddr_ready;
    reg pix_wen;
    reg write_start;
    wire write_ready;

    reg [8:0] x_start_pos;
    reg [8:0] y_start_pos;

    always @(posedge clock or negedge reset_n) begin
        if (~reset_n) begin
            x_start_pos <= 9'd0;
            y_start_pos <= 9'd0;
            pix_waddr <= 17'd0;
            pix_wdata <= 18'd0;
            cpu_wready <= 1'b0;
            cpu_rready <= 1'b0;
            pix_wen <= 1'b0;
            write_start <= 1'b0;
        end else begin
            cpu_wready <= 1'b0;
            cpu_rready <= 1'b0;
            pix_wen <= 1'b0;
            //write_start <= 1'b0;
            // CPU I/F
            // R
            if(cpu_rvalid_latch) begin
                case(cpu_byte_raddr)
                    LCD_PIXS_ADDR: begin
                        cpu_rready <= 1'b1;
                    end
                    LCD_PIXS_DATA: begin
                        cpu_rready <= 1'b1;
                    end
                    LCD_PIXS_ST: begin
                        cpu_rdata  <= {31'h0, write_start};
                        cpu_rready <= 1'b1;
                    end
                endcase
            end
            // W
            if(cpu_wvalid_latch) begin
                case(cpu_byte_waddr)
                    LCD_PIXS_ADDR: begin
                        {y_start_pos, x_start_pos} <= cpu_wdata[17:0]; 
                        pix_waddr  <= 17'd0; 
                        cpu_wready <= 1'b1;
                    end
                    LCD_PIXS_DATA: begin
                        pix_wdata <= cpu_wdata[17:0];
                        cpu_wready <= 1'b1;
                        pix_wen <= 1'b1;
                    end
                    LCD_PIXS_ST: begin
                        cpu_wready <= 1'b1;
                    end
                endcase
            end
            if (pix_wen) begin
                if (pix_waddr == 32*32-1) begin
                    write_start <= 1'b1;
                end else begin
                    pix_waddr <= pix_waddr + 17'd1;
                end
            end
            if (write_ready) 
                write_start <= 1'b0;
        end
    end

    // ------------------------------------------------------------
    // PIXELS Data Memory
    reg  [9:0]               data_read_addr;
    wire [17:0]              data_rdata;
    reg                      data_rvalid;
    reg                      data_rvalid_r1;

    wire                     data_wready;
    wire                     data_rready;

    lcd_pixels_data #(
        .DATA_WIDTH         (18),           // rgb 6bit x 3 
        .INDEX_WIDTH        (10)            // 32 x 32 = 1024: 10bit.
    ) u_data (
        .clock              (clock),
        .reset_n            (reset_n),

        // CPU write port (clockドメイン)
        .data_waddr         (pix_waddr[9:0]),   // 10bit
        .data_wvalid        (pix_wen),
        .data_wready        (data_wready),
        .data_write         (pix_wdata),

        // LCD read port (同じclockドメインで今は読んでる)
        // ※将来はデュアルポート化してfbClk側から読ませるとCDC消える
        .data_rvalid        (data_rvalid),
        .data_rready        (data_rready),
        .data_raddr         (data_read_addr),
        .data_read          (data_rdata)
    );

    // ------------------ clock_divider --------------------------
    wire    div_clk;

    clock_divider #(
        .DIV            (DIV_CLK)
    ) m_clock_divider (
        .clock          (clock),
        .reset_n        (reset_n),
        .clk_div        (div_clk)
    );

    // ------------------------------------------------------------
    // ここから下はdiv_clk駆動
    // ------------------------------------------------------------
    // data_valid の立ち上がりパルス
    wire  data_valid;

    reg   data_valid_d0;
    reg   data_valid_d1;

    always @(posedge div_clk or negedge reset_n) begin
        if (~reset_n) begin
            data_valid_d0 <= 1'b0;
            data_valid_d1 <= 1'b0;
        end else begin
            data_valid_d0 <= data_valid;
            data_valid_d1 <= data_valid_d0;
        end
    end

    wire data_valid_edge = (data_valid_d0 & ~data_valid_d1);

    // ------------------------------------------------------------
    // X, Y 座標計算 (fbClkドメイン)
    // ------------------------------------------------------------
    reg [8:0] x_pos;
    reg [8:0] y_pos;

    wire frame_change;

    always @(posedge div_clk or negedge reset_n) begin
        if (~reset_n) begin
            x_pos <= 9'd0;
            y_pos <= 9'd0;
        end else if (frame_change) begin
            x_pos <= 9'd0;
            y_pos <= 9'd0;
        end else if (data_valid_edge) begin
            if (x_pos == (32 - 1)) begin
                x_pos <= 9'd0;
                if (y_pos == (32 - 1))
                    y_pos <= 9'd0;
                else
                    y_pos <= y_pos + 9'd1;
            end else begin
                x_pos <= x_pos + 9'd1;
            end
        end
    end

    // ------------------------------------------------------------
    // フレームバッファ読み出し
    // 読み側のアドレス: 

    wire [8:0] read_x_pos = x_pos[8:0];
    wire [8:0] read_y_pos = y_pos[8:0];

    always @(posedge div_clk) begin
        // addres
        data_read_addr  <= { read_y_pos[4:0], read_x_pos[4:0] };    
        // rvalid
        if(data_valid_edge) begin
            data_rvalid_r1 <= 1'b1;
        end else begin
            data_rvalid_r1 <= 1'b0;
        end
        data_rvalid <= data_rvalid_r1;
    end

    // ------------------------------------------------------------
    // ピクセル色生成 (fbClkドメイン)
    // ------------------------------------------------------------
    // RGB666
    wire [5:0] red;
    wire [5:0] blue;
    wire [5:0] green;

    wire [23:0] currentPixel;

    /*
    assign red   =  (x_pos==10 || y_pos==10) ? 6'h3F: 6'd0;
    assign blue  =  (x_pos==20 || y_pos==20) ? 6'h3F: 6'd0;
    assign green =  (x_pos==30 || y_pos==30) ? 6'h3F: 6'd0;
    */

    // VRAM mode.
    assign red   =  data_rdata[17:12];
    assign blue  =  data_rdata[11:6];
    assign green =  data_rdata[5:0];
    /*
    assign red   =  6'h3F;
    assign blue  =  6'h0;
    assign green =  6'h0;
    */
    
    if (IPS_MODE)
        assign currentPixel = {{{6'h3F - red},   2'b00}, 
                               {{6'h3F - green}, 2'b00},
                               {{6'h3F - blue},  2'b00}};
    else 
        assign currentPixel = {{red,   2'b00}, 
                               {green, 2'b00},
                               {blue,  2'b00}};

    // ------------------------------------------------------------
    // TFT Module
    //  - tft_ILI9488 は SPI 叩いて ILI9488 にピクセルを投げる
    //  - currentPixel を逐次受け取る
    // ------------------------------------------------------------
    tft_ili9488 #(
        .INPUT_CLK_MHZ          (CLK_FREQ),
        .DIV_CLK                (DIV_CLK),
        .X_PIXELS               (32),                        // 320
        .Y_PIXELS               (32)                         // 480
    ) u_tft (
        .clk                    (div_clk),
        .reset_n                (reset_n),

        .write_start            (write_start),
        .write_ready            (write_ready),
        .x_start_pos            (x_start_pos),                // max 319
        .y_start_pos            (y_start_pos),                // max 479
        .x_end_pos              (x_start_pos + 9'd31),            
        .y_end_pos              (y_start_pos + 9'd31),    

        .tft_sdo                (tft_sdo),                    // Input not used.
        .tft_sck                (tft_sck),
        .tft_sdi                (tft_sdi),
        .tft_dc                 (tft_dc),
        .tft_reset              (tft_reset),
        .tft_cs                 (tft_cs),
        .framebufferData        (currentPixel[23:0]),
        .framebufferData_valid  (data_valid),
        .framebufferData_ready  (data_rready),
        .frame_change           (frame_change)
    );

endmodule

// ===============================================================
// フレームバッファRAM（1クロック同期, R/W同時OK, 衝突時は書き込み値を即読出）
// ===============================================================
module lcd_pixels_data #(
    parameter DATA_WIDTH  = 18,
    parameter INDEX_WIDTH = 12,
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
    output reg                      data_rready,
    input  wire [INDEX_WIDTH-1:0]   data_raddr,
    output reg  [DATA_WIDTH-1:0]    data_read
);

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    `ifdef COCOTB_SIM
        wire [DATA_WIDTH-1:0] debug_mem_0   = mem[0];
        wire [DATA_WIDTH-1:0] debug_mem_1   = mem[1];
        wire [DATA_WIDTH-1:0] debug_mem_2   = mem[2];
        wire [DATA_WIDTH-1:0] debug_mem_3   = mem[3];
        wire [DATA_WIDTH-1:0] debug_mem_60  = mem[60];
        wire [DATA_WIDTH-1:0] debug_mem_61  = mem[61];
        wire [DATA_WIDTH-1:0] debug_mem_62  = mem[62];
        wire [DATA_WIDTH-1:0] debug_mem_63  = mem[63];

        wire [DATA_WIDTH-1:0] debug_mem_254 = mem[254];
        wire [DATA_WIDTH-1:0] debug_mem_255 = mem[255];

        wire [DATA_WIDTH-1:0] debug_mem_799 = mem[799];
        wire [DATA_WIDTH-1:0] debug_mem_800 = mem[800];
        
        wire [DATA_WIDTH-1:0] debug_mem_1022  = mem[1022];
        wire [DATA_WIDTH-1:0] debug_mem_1023  = mem[1023];
    `endif

    // data_rready立ち上がりエッジ判定
    reg  data_rvalid_d0;
    reg  data_rvalid_d1;
    reg  data_rvalid_latch;

    always @(posedge clock) begin
        if (~reset_n) begin
            data_rvalid_d0      <= 1'b0;
            data_rvalid_d1      <= 1'b0;
            data_rvalid_latch   <= 1'b0;
        end else begin
            data_rvalid_d0      <= data_rvalid;
            data_rvalid_d1      <= data_rvalid_d0;
            data_rvalid_latch   <= 1'b0;

            if (data_rvalid_d0 & ~data_rvalid_d1) begin
                data_rvalid_latch <= 1'b1;
            end
        end
    end

    // 同期Read/Write + 衝突時フォワード
    always @(posedge clock) begin
        if (~reset_n) begin
            data_rready <= 1'b0;
            data_wready <= 1'b0;
            data_read   <= {DATA_WIDTH{1'b0}};
        end else begin
            // デフォルトは非アサート
            data_rready <= 1'b0;
            data_wready <= 1'b0;

            // 先にWrite（同サイクル衝突時のメモリ内容はベンダ依存なので明示的に書く）
            if (data_wvalid) begin
                mem[data_waddr] <= data_write;
                data_wready     <= 1'b1;
            end

            // Readは同期更新
            if (data_rvalid_latch) begin
                // 通常はメモリから読んで出力
                data_read       <= mem[data_raddr];
                data_rready     <= 1'b1;

                // ただし同一サイクルで R/W 両方有効かつ同一アドレスなら
                // 直前に書いた data_write を “ライトスルー” で優先させる
                if (data_wvalid && (data_waddr == data_raddr)) begin
                    data_read <= data_write;
                end
            end
        end
    end
endmodule

// ===============================================================
// clock_divider
// ===============================================================
module clock_divider #(
    parameter DIV = 2
)(
    input  wire clock,
    input  wire reset_n,
    output reg  clk_div
);

    reg [$clog2(DIV)-1:0] cnt;

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            cnt     <= 0;
            clk_div <= 1'b0;
        end else begin
            if (cnt == (DIV/2 - 1)) begin
                cnt     <= 0;
                clk_div <= ~clk_div;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

endmodule
