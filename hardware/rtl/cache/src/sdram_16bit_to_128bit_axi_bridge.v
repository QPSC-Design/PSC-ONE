/*
NISHIHARU — 16bit × 8 beat ⇄ 128bit line bridge (AXI4 master, FIXED + fence)
 - Cache side : 128-bit read/write (16B aligned)
 - AXI side   : 16-bit AXI4 master, INCR, SIZE=1(2B), LEN=7(=8beat)
 - Order      : beat0->LSB ... beat7->MSB (final-beat merge @ MSB)
*/
`timescale 1ns/1ps

module sdram_16bit_to_128bit_axi_bridge #(
    parameter integer ADDR_WIDTH   = 32,
    parameter integer ID_WIDTH     = 1,
    parameter integer DATA_WIDTH   = 16,   // fixed 16
    parameter integer FENCE_CYCLES = 2     // ★ W完了(B)後の保護バブル
)(
    input  wire                     clock,
    input  wire                     reset_n,

    // ===== Cache side (128-bit line) =====
    input  wire                     read_valid,
    output reg                      read_ready,          // 1clk pulse
    input  wire [ADDR_WIDTH-1:0]    read_addr,           // byte addr (16B aligned 推奨)
    output reg  [127:0]             read_data,

    input  wire                     write_valid,
    output reg                      write_ready,         // 1clk pulse
    input  wire [ADDR_WIDTH-1:0]    write_addr,          // byte addr (16B aligned 推奨)
    input  wire [127:0]             write_data,

    // ===== AXI4 Master (16-bit) =====
    // Write Address
    output reg  [ID_WIDTH-1:0]      m_axi_awid,
    output reg  [ADDR_WIDTH-1:0]    m_axi_awaddr,
    output reg  [7:0]               m_axi_awlen,         // 7 (=8beat)
    output reg  [2:0]               m_axi_awsize,        // 1 (2B)
    output reg  [1:0]               m_axi_awburst,       // INCR=01
    output reg                      m_axi_awvalid,
    input  wire                     m_axi_awready,

    // Write Data
    output reg  [DATA_WIDTH-1:0]    m_axi_wdata,
    output reg  [(DATA_WIDTH/8)-1:0]m_axi_wstrb,         // 2'b11
    output reg                      m_axi_wlast,
    output reg                      m_axi_wvalid,
    input  wire                     m_axi_wready,

    // Write Response
    input  wire [ID_WIDTH-1:0]      m_axi_bid,
    input  wire [1:0]               m_axi_bresp,
    input  wire                     m_axi_bvalid,
    output reg                      m_axi_bready,

    // Read Address
    output reg  [ID_WIDTH-1:0]      m_axi_arid,
    output reg  [ADDR_WIDTH-1:0]    m_axi_araddr,
    output reg  [7:0]               m_axi_arlen,         // 7 (=8beat)
    output reg  [2:0]               m_axi_arsize,        // 1
    output reg  [1:0]               m_axi_arburst,       // INCR
    output reg                      m_axi_arvalid,
    input  wire                     m_axi_arready,

    // Read Data
    input  wire [ID_WIDTH-1:0]      m_axi_rid,
    input  wire [DATA_WIDTH-1:0]    m_axi_rdata,
    input  wire [1:0]               m_axi_rresp,
    input  wire                     m_axi_rlast,
    input  wire                     m_axi_rvalid,
    output reg                      m_axi_rready
);

    // --------- helpers ---------
    function automatic [ADDR_WIDTH-1:0] align16(input [ADDR_WIDTH-1:0] ba);
        align16 = {ba[ADDR_WIDTH-1:4], 4'b0000};
    endfunction

    function automatic [15:0] slc16(input [127:0] v, input [2:0] idx);
        case (idx)
            3'd0: slc16 = v[ 15:  0];
            3'd1: slc16 = v[ 31: 16];
            3'd2: slc16 = v[ 47: 32];
            3'd3: slc16 = v[ 63: 48];
            3'd4: slc16 = v[ 79: 64];
            3'd5: slc16 = v[ 95: 80];
            3'd6: slc16 = v[111: 96];
            default: slc16 = v[127:112];
        endcase
    endfunction

    // --------- FSM ---------
    localparam [3:0] ST_IDLE  = 4'd0,
                     ST_W_AW  = 4'd1,  // AW VALID保持
                     ST_W_W0  = 4'd2,  // AW握手後の1拍（W開始準備）
                     ST_W_W   = 4'd3,  // Wデータ連送
                     ST_W_B   = 4'd4,  // B応答待ち
                     ST_FENCE = 4'd5,  // ★ B後の保護バブル
                     ST_R_AR  = 4'd6,  // AR VALID保持
                     ST_R_R0  = 4'd7,  // AR握手後の1拍（R受信準備）
                     ST_R_R   = 4'd8;  // R受信

    reg [3:0]              st;
    reg [ADDR_WIDTH-1:0]   base_r, base_w;
    reg [127:0]            rbuf, wbuf;
    reg [2:0]              beat;          // 0..7
    reg [$clog2(FENCE_CYCLES+1)-1:0] fence_cnt;

    wire aw_fire = m_axi_awvalid & m_axi_awready;
    wire w_fire  = m_axi_wvalid  & m_axi_wready;
    wire b_fire  = m_axi_bvalid  & m_axi_bready;
    wire ar_fire = m_axi_arvalid & m_axi_arready;
    wire r_fire  = m_axi_rvalid  & m_axi_rready;

    // --------- sequential only ---------
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            st            <= ST_IDLE;

            base_r        <= '0;
            base_w        <= '0;
            rbuf          <= '0;
            wbuf          <= '0;
            beat          <= 3'd0;
            fence_cnt     <= '0;

            // Cache side
            read_data     <= 128'h0;
            read_ready    <= 1'b0;
            write_ready   <= 1'b0;

            // AXI defaults
            m_axi_awid    <= '0;
            m_axi_awaddr  <= '0;
            m_axi_awlen   <= 8'd7;
            m_axi_awsize  <= 3'd1;
            m_axi_awburst <= 2'b01;
            m_axi_awvalid <= 1'b0;

            m_axi_wdata   <= '0;
            m_axi_wstrb   <= { (DATA_WIDTH/8){1'b1} };
            m_axi_wlast   <= 1'b0;
            m_axi_wvalid  <= 1'b0;

            m_axi_bready  <= 1'b0;

            m_axi_arid    <= '0;
            m_axi_araddr  <= '0;
            m_axi_arlen   <= 8'd7;
            m_axi_arsize  <= 3'd1;
            m_axi_arburst <= 2'b01;
            m_axi_arvalid <= 1'b0;

            m_axi_rready  <= 1'b0;

        end else begin
            // 1clk パルスはデフォルト Low
            read_ready   <= 1'b0;
            write_ready  <= 1'b0;

            // 送信中は常に WSTRB=11（未定義化防止）
            if (m_axi_wvalid) m_axi_wstrb <= { (DATA_WIDTH/8){1'b1} };

            case (st)
                // ---------------- IDLE ----------------
                ST_IDLE: begin
                    m_axi_awvalid <= 1'b0;
                    m_axi_wvalid  <= 1'b0;
                    m_axi_wlast   <= 1'b0;
                    m_axi_bready  <= 1'b0;
                    m_axi_arvalid <= 1'b0;
                    m_axi_rready  <= 1'b0;
                    beat          <= 3'd0;

                    // ★ フェンス中は新規トランザクションを開始しない
                    if (fence_cnt != 0) begin
                        st <= ST_FENCE;
                    end else if (write_valid) begin
                        // WRITE開始：ライン基底を 16B アラインで固定
                        base_w        <= align16(write_addr);
                        wbuf          <= write_data;

                        m_axi_awid    <= {ID_WIDTH{1'b0}};
                        m_axi_awaddr  <= align16(write_addr);
                        m_axi_awlen   <= 8'd7;
                        m_axi_awsize  <= 3'd1;
                        m_axi_awburst <= 2'b01;
                        m_axi_awvalid <= 1'b1;

                        st            <= ST_W_AW;

                    end else if (read_valid) begin
                        // READ開始：ライン基底
                        base_r        <= align16(read_addr);

                        m_axi_arid    <= {ID_WIDTH{1'b0}};
                        m_axi_araddr  <= align16(read_addr);
                        m_axi_arlen   <= 8'd7;
                        m_axi_arsize  <= 3'd1;
                        m_axi_arburst <= 2'b01;
                        m_axi_arvalid <= 1'b1;

                        st            <= ST_R_AR;
                    end
                end

                // ---------------- FENCE (B後の保護) ----------------
                ST_FENCE: begin
                    if (fence_cnt != 0) fence_cnt <= fence_cnt - 1'b1;
                    if (fence_cnt == 1) st <= ST_IDLE; // 次拍で解放
                end

                // ---------------- WRITE: AW ----------------
                ST_W_AW: begin
                    if (aw_fire) begin
                        m_axi_awvalid <= 1'b0;     // 握手で確実に下げる
                        beat          <= 3'd0;
                        st            <= ST_W_W0;  // 1clk バブル → W 安全開始
                    end
                end

                // ---------------- WRITE: W 準備 (1clk) ----------------
                ST_W_W0: begin
                    m_axi_wdata  <= slc16(wbuf, 3'd0);
                    m_axi_wlast  <= 1'b0;              // 初回はまだ最後ではない
                    m_axi_wvalid <= 1'b1;
                    st           <= ST_W_W;
                end

                // ---------------- WRITE: W 連続送出 ----------------
                ST_W_W: begin
                    if (w_fire) begin
                        if (beat == 3'd7) begin
                            // 8ビート送出完了
                            m_axi_wvalid <= 1'b0;
                            m_axi_wlast  <= 1'b0;
                            m_axi_bready <= 1'b1;
                            st           <= ST_W_B;
                        end else begin
                            beat        <= beat + 3'd1;
                            m_axi_wdata <= slc16(wbuf, beat + 3'd1);
                            m_axi_wlast <= (beat + 3'd1 == 3'd7);
                        end
                    end
                end

                // ---------------- WRITE: B 応答待ち ----------------
                ST_W_B: begin
                    if (b_fire) begin
                        // OKAY(00)想定。必要なら bresp 監視を追加。
                        m_axi_bready <= 1'b0;
                        write_ready  <= 1'b1;      // 完了パルス
                        // ★ ここでフェンス開始
                        fence_cnt    <= (FENCE_CYCLES == 0) ? '0 : FENCE_CYCLES[$clog2(FENCE_CYCLES+1)-1:0];
                        st           <= (FENCE_CYCLES == 0) ? ST_IDLE : ST_FENCE;
                    end
                end

                // ---------------- READ: AR ----------------
                ST_R_AR: begin
                    if (ar_fire) begin
                        m_axi_arvalid <= 1'b0;
                        beat          <= 3'd0;
                        st            <= ST_R_R0;  // 1clk バブル → R 受信開始
                    end
                end

                // ---------------- READ: 受信準備 (1clk) ----------------
                ST_R_R0: begin
                    m_axi_rready <= 1'b1;          // 受信中は 1 を維持
                    st           <= ST_R_R;
                end

                // ---------------- READ: R 受信 ----------------
                ST_R_R: begin
                    if (r_fire) begin
                        case (beat)
                            3'd0: rbuf[ 15:  0] <= m_axi_rdata;
                            3'd1: rbuf[ 31: 16] <= m_axi_rdata;
                            3'd2: rbuf[ 47: 32] <= m_axi_rdata;
                            3'd3: rbuf[ 63: 48] <= m_axi_rdata;
                            3'd4: rbuf[ 79: 64] <= m_axi_rdata;
                            3'd5: rbuf[ 95: 80] <= m_axi_rdata;
                            3'd6: rbuf[111: 96] <= m_axi_rdata;
                            default: ; // 3'd7 は確定時に先頭へ
                        endcase

                        if (m_axi_rlast || (beat == 3'd7)) begin
                            // ★ 最終ビート（MSB）で確定（非AXI版と同じ）
                            read_data    <= { m_axi_rdata, rbuf[111:0] };
                            m_axi_rready <= 1'b0;
                            read_ready   <= 1'b1;
                            // 読み後にも軽いフェンスを入れたい場合は下記を有効化
                            // fence_cnt    <= (FENCE_CYCLES == 0) ? '0 : FENCE_CYCLES[$clog2(FENCE_CYCLES+1)-1:0];
                            // st           <= (FENCE_CYCLES == 0) ? ST_IDLE : ST_FENCE;
                            st           <= ST_IDLE;
                        end else begin
                            beat <= beat + 3'd1;
                        end
                    end
                end

                default: st <= ST_IDLE;
            endcase
        end
    end
endmodule
