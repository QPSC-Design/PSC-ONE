/*
NISHIHARU
*/
`timescale 1ns / 1ps

module sdram_controller #(
    parameter CLK_FREQ_MHz          = 80,
    // SDRAM ADDR
    parameter COL_ADDR_BUS_WIDTH    = 8,
    parameter ROW_ADDR_BUS_WIDTH    = 11,
    parameter BNK_ADDR_BUS_WIDTH    = 2,
    // DQ, DQM
    parameter DQ_BUS_WIDTH          = 16,
    parameter DQM_BUS_WIDTH         = 2,
    parameter SD_ADDR_BUS_WIDTH     = 11,
    parameter integer SDRAM_INIT_CNT =  (64 * CLK_FREQ_MHz) / 10,  // 64us
    parameter clk_dly_ps            = 1,       // not use
    parameter timing_CAS            = 3,
    parameter timing_RCD            = 2,
    parameter timing_RP             = 3,
    parameter timing_MD             = 3,
    parameter timing_RFC            = 8,        // 66 nsec. 100MHz = 6.6 CLK.
    // INNER Param
    parameter CW    = COL_ADDR_BUS_WIDTH,
    parameter RW    = ROW_ADDR_BUS_WIDTH,
    parameter BW    = BNK_ADDR_BUS_WIDTH,
    parameter SDAW  = SD_ADDR_BUS_WIDTH
)(
    input  wire                     clock,
    input  wire                     reset_n,

    input  wire [3:0]               rw_length,           // 1,4,8
    output wire                     req_ready,
    output reg                      sdram_init_fin,

    // ==== READ要求（Bank/Row/Col 分離）====
    input  wire                     read_valid,
    output reg                      read_ready,
    input  wire [BW-1:0]            read_addr_ba,      // Bank (MT48LC16M16: 2bit, GW2AR SDRAM: 2bit)
    input  wire [RW-1:0]            read_addr_row,     // Row  (MT48LC16M16: 13bit, GW2AR SDRAM: 11bit)
    input  wire [CW-1:0]            read_addr_col,     // Col  (MT48LC16M16: 9bit,  GW2AR SDRAM: 8bit)
    output reg  [DQ_BUS_WIDTH-1:0]  read_data,

    // ==== WRITE要求（Bank/Row/Col 分離）====
    input  wire                     write_valid,
    output reg                      write_ready,
    input  wire [BW-1:0]            write_addr_ba,     // Bank
    input  wire [RW-1:0]            write_addr_row,    // Row
    input  wire [CW-1:0]            write_addr_col,    // Col
    input  wire [DQ_BUS_WIDTH-1:0]  write_data,

    // ============ SDRAM IF ============
    output wire                     sdram_clk,
    output wire                     sdram_cs,
    output wire                     sdram_ras,
    output wire                     sdram_cas,
    output wire                     sdram_we,

    output wire [SDAW-1:0]          sdram_adr,
    output wire [1:0]               sdram_ba,
    output wire [DQM_BUS_WIDTH-1:0] sdram_dqm,
    inout  wire [DQ_BUS_WIDTH-1:0]  sdram_dq
);

    // IODELAY
    /*
    IODELAY sdram_clk_dly(
        .DO      (sdram_clk),
        .DF      (),
        .DI      (clock),
        .SDTAP   (1'b0),
        .VALUE   (1'b0),
        .DLYSTEP (8'd10)
    );

    defparam sdram_clk_dly.C_STATIC_DLY=64;
    defparam sdram_clk_dly.DYN_DLY_EN="FALSE";
    defparam sdram_clk_dly.ADAPT_EN="FALSE";
    */

    // 追加: リクエスト受理ready
    // IDLE stateの前と10clk前に入力NGにする
    assign req_ready = sdram_init_fin && (state==READ_DONE || state==WRITE_DONE || state==IDLE) && !refresh_req_pre10clk; 

    localparam ROW_BITS = RW;
    localparam COL_BITS = CW;
    localparam BA_BITS  = BW;

    reg cs_r, ras_r, cas_r, we_r;
    reg init_cs_r, init_ras_r, init_cas_r, init_we_r;
    reg [12:0] init_adr_r, adr_r;
    reg [1:0]  init_ba_r, ba_r;
    reg [DQM_BUS_WIDTH-1:0] init_dqm_r, dqm_r;
    reg [DQ_BUS_WIDTH-1:0]  dq_out;
    reg        dq_oe;

    assign sdram_clk    = clock;
    assign sdram_cs     = ~sdram_init_fin ? init_cs_r : cs_r;
    assign sdram_ras    = ~sdram_init_fin ? init_ras_r : ras_r;
    assign sdram_cas    = ~sdram_init_fin ? init_cas_r : cas_r;
    assign sdram_we     = ~sdram_init_fin ? init_we_r : we_r;
    assign sdram_adr    = ~sdram_init_fin ? init_adr_r : adr_r;
    assign sdram_ba     = ~sdram_init_fin ? init_ba_r  : ba_r;
    assign sdram_dqm    = ~sdram_init_fin ? init_dqm_r : dqm_r;
    assign sdram_dq     = dq_oe ? dq_out : {DQ_BUS_WIDTH{1'bz}};

    // 2 clock latch.
    reg [DQ_BUS_WIDTH-1:0]  dq_in;
    reg [DQ_BUS_WIDTH-1:0]  dq_d1;
    always @(posedge clock) dq_in <= sdram_dq;
    always @(posedge clock) dq_d1 <= dq_in;

    // ----------------------------------------------------------
    // SDRAM 初期化処理
    // ----------------------------------------------------------
    reg [3:0]  init_state;
    reg [31:0] init_cnt_r;

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            sdram_init_fin  <= 1'b0;
            init_state      <= 4'd0;
            init_cnt_r      <= 32'd0;
            init_cs_r       <= 0; 
            init_ras_r      <= 1; 
            init_cas_r      <= 1; 
            init_we_r       <= 1;
            init_adr_r      <= 13'h000; 
            init_ba_r       <= 2'b00; 
            init_dqm_r      <= {DQM_BUS_WIDTH{1'b1}};
        end else begin
            // 初期化中は基本NOP（必要時に上書き）
            init_cs_r       <= 0; 
            init_ras_r      <= 1; 
            init_cas_r      <= 1; 
            init_we_r       <= 1;
            init_cnt_r      <= init_cnt_r + 32'd1;
            case (init_state)
                0: if (init_cnt_r == SDRAM_INIT_CNT) begin
                        init_state  <= 4'd1; 
                        init_cnt_r  <= 32'd0;
                    end
                1: if (init_cnt_r == 32'd0) begin
                        init_ras_r  <= 0; 
                        init_cas_r  <= 1; 
                        init_we_r   <= 0; 
                        init_adr_r  <= 13'h400; // PRECHARGE ALL (A10=1)
                    end else if (init_cnt_r == 32'd6) begin // tRP
                        init_state  <= 4'd2; 
                        init_cnt_r  <= 32'd0;
                    end
                2: if (init_cnt_r == 32'd0) begin
                        init_ras_r  <= 0; 
                        init_cas_r  <= 0; 
                        init_we_r   <= 1; // Auto Refresh 1
                    end else if (init_cnt_r == 32'd24) begin // tRFC
                        init_state  <= 4'd3; 
                        init_cnt_r  <= 32'd0;
                    end
                3: if (init_cnt_r == 32'd0) begin
                        init_ras_r  <= 0; 
                        init_cas_r  <= 0; 
                        init_we_r   <= 1; // Auto Refresh 2
                    end else if (init_cnt_r == 32'd24) begin // tRFC
                        init_state  <= 4'd4; 
                        init_cnt_r  <= 32'd0;
                    end
                4: if (init_cnt_r == 32'd0) begin
                        init_ras_r  <= 0; 
                        init_cas_r  <= 0; 
                        init_we_r   <= 0; 
                        init_adr_r  <= 13'h130; // Mode Register Set
                    end else if (init_cnt_r == 32'd14) begin // tMRD
                        init_state  <= 4'd5; 
                        init_cnt_r  <= 32'd0;
                    end
                5: if (init_cnt_r == 32'd60) begin
                        sdram_init_fin  <= 1'b1;
                        init_state      <= 4'd6;
                        init_cnt_r      <= 32'd0;
                    end
                6: init_cnt_r   <= 32'd0; // 完了後NOP維持
            endcase
        end
    end

    // ----------------------------------------------------------
    // バッファと制御ロジック
    // ----------------------------------------------------------
    // READ: Bank/Row/Col を独立バッファ
    reg [BA_BITS-1:0]       read_ba_buf  [0:7];
    reg [ROW_BITS-1:0]      read_row_buf [0:7];
    reg [COL_BITS-1:0]      read_col_buf [0:7];

    // WRITE: Bank/Row/Col を独立バッファ
    reg [BA_BITS-1:0]       write_ba_buf  [0:7];
    reg [ROW_BITS-1:0]      write_row_buf [0:7];
    reg [COL_BITS-1:0]      write_col_buf [0:7];
    reg [DQ_BUS_WIDTH-1:0]  write_data_buf[0:7];

    reg [3:0] read_count, write_count;
    reg [3:0] rw_index;
    reg       buffered_read_start, buffered_write_start;

    reg [4:0] state;
    localparam IDLE         = 0,
            READ_ACTIVATE   = 1,
            WAIT_TRCD_READ  = 2,
            READ_CMD        = 3,
            WAIT_CL         = 4,
            RED_CMD_WAIT    = 5,
            READ_PRECHARGE  = 6,
            READ_TRP_WRITE  = 7,
            READ_DONE       = 8,
            WRITE_ACTIVATE  = 9,
            WAIT_TRCD_WRITE = 10,
            WRITE_CMD       = 11,
            WRITE_CMD_WAIT  = 12,
            WRITE_PRECHARGE = 13,
            WAIT_TRP_WRITE  = 14,
            WRITE_DONE      = 15,
            REFRESH_START   = 16,
            REFRESH_CMD     = 17,
            REFRESH_WAIT    = 18;

    reg [4:0] wait_cnt;
    reg [4:0] read_cnt;

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            state       <= IDLE;
            write_ready <= 0;
            adr_r       <= 13'd0;
            ba_r        <= 2'd0;
            cs_r        <= 0; 
            ras_r       <= 1; 
            cas_r       <= 1; 
            we_r        <= 1;
            dq_oe       <= 0; 
            dq_out      <= {DQ_BUS_WIDTH{1'b0}};
            dqm_r       <= {DQM_BUS_WIDTH{1'b0}};
            wait_cnt    <= 5'd0;
            rw_index    <= 4'd0;
            read_count  <= 4'd0; 
            write_count <= 4'd0;
            buffered_read_start     <= 0; 
            buffered_write_start    <= 0;

        end else if (sdram_init_fin) begin
            // default.
            cs_r    <= 0; 
            ras_r   <= 1; 
            cas_r   <= 1; 
            we_r    <= 1;

            // case
            case (state)
                IDLE: begin
                    wait_cnt <= 5'd0;
                    if (refresh_req) begin
                        state <= REFRESH_START;
                    end
                    // ===== READ集約 =====
                    if (read_valid && read_count < rw_length) begin
                        read_ba_buf [read_count] <= read_addr_ba;
                        read_row_buf[read_count] <= read_addr_row;
                        read_col_buf[read_count] <= read_addr_col;
                        read_count <= read_count + 4'd1;
                        if (read_count == rw_length - 4'd1) begin
                            buffered_read_start <= 1;
                            rw_index            <= 4'd0;
                            state               <= READ_ACTIVATE;
                        end
                    end
                    // ===== WRITE集約 =====
                    else if (write_valid && write_count < rw_length) begin
                        write_ba_buf [write_count] <= write_addr_ba;
                        write_row_buf[write_count] <= write_addr_row;
                        write_col_buf[write_count] <= write_addr_col;
                        write_data_buf[write_count] <= write_data;
                        write_ready         <= 0;
                        write_count         <= write_count + 4'd1;
                        if (write_count == rw_length - 4'd1) begin
                            buffered_write_start <= 1;
                            rw_index             <= 4'd0;
                            state                <= WRITE_ACTIVATE;
                        end
                    end
                end

                // --- READ FLOW ---
                READ_ACTIVATE: begin
                    adr_r   <= read_row_buf[0];
                    ba_r    <= read_ba_buf[0];
                    cs_r    <= 0; 
                    ras_r   <= 0; 
                    cas_r   <= 1; 
                    we_r    <= 1; // ACT
                    wait_cnt <= 5'd0;
                    state    <= WAIT_TRCD_READ;
                end

                WAIT_TRCD_READ: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RCD) begin
                        wait_cnt <= 5'd0;
                        state    <= READ_CMD;
                    end
                end

                READ_CMD: begin
                    if (rw_index == rw_length) begin
                        cs_r    <= 0; 
                        ras_r   <= 1; 
                        cas_r   <= 1; 
                        we_r    <= 1; // NOP
                        state   <= WAIT_CL;
                    end else begin
                        dq_oe    <= 0;
                        rw_index <= rw_index + 4'd1;

                        // Col を出力（A12..A11=0, A10=0 固定, A8..A0=Col）
                        adr_r <= {3'b000, read_col_buf[rw_index]};
                        ba_r  <= read_ba_buf[rw_index];

                        cs_r    <= 0; 
                        ras_r   <= 1; 
                        cas_r   <= 0; 
                        we_r    <= 1; // READ
                        dqm_r   <= {DQM_BUS_WIDTH{1'b0}};
                        wait_cnt <= 5'd0;
                    end
                end

                // CAS 分待機
                WAIT_CL: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_CAS) begin
                        wait_cnt <= 5'd0;
                        state    <= RED_CMD_WAIT;
                    end
                end

                RED_CMD_WAIT: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RP) begin
                        wait_cnt <= 5'd0;
                        state <= READ_PRECHARGE;
                    end
                end

                READ_PRECHARGE: begin
                    adr_r   <= 13'b0000_0000_0000_0; // A10=0: 単一バンク
                    ba_r    <= read_ba_buf[0];
                    cs_r    <= 0; 
                    ras_r   <= 0; 
                    cas_r   <= 1; 
                    we_r    <= 0; // PRECHARGE
                    wait_cnt <= 5'd0;
                    state    <= READ_TRP_WRITE;
                end

                READ_TRP_WRITE: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RP) begin // tRP
                        wait_cnt <= 5'd0;
                        state    <= READ_DONE;
                    end
                end

                READ_DONE: begin
                    wait_cnt    <= 5'd0;
                    read_count  <= 0;
                    buffered_read_start <= 0;
                    state               <= IDLE;
                end

                // --- WRITE FLOW ---
                WRITE_ACTIVATE: begin
                    adr_r   <= write_row_buf[0];  // Row
                    ba_r    <= write_ba_buf[0];   // Bank
                    cs_r    <= 0; 
                    ras_r   <= 0; 
                    cas_r   <= 1; 
                    we_r    <= 1; // ACT
                    wait_cnt <= 5'd0;
                    state    <= WAIT_TRCD_WRITE;
                end

                WAIT_TRCD_WRITE: begin
                    cs_r <= 0; ras_r <= 1; cas_r <= 1; we_r <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RCD) begin
                        wait_cnt <= 5'd0;
                        state <= WRITE_CMD;
                    end
                end

                WRITE_CMD: begin
                    dqm_r  <= {DQM_BUS_WIDTH{1'b0}};
                    if (rw_index == rw_length) begin
                        cs_r    <= 0; 
                        ras_r   <= 1; 
                        cas_r   <= 1; 
                        we_r    <= 1; // NOP
                        state   <= WRITE_CMD_WAIT;
                        wait_cnt <= 5'd0;
                        dq_oe    <= 0;
                        write_ready <= 0;
                    end else begin
                        dq_oe       <= 1;
                        write_ready <= 1;
                        rw_index    <= rw_index + 4'd1;
                        dq_out      <= write_data_buf[rw_index];

                        // Col（A10=0固定）, Bank
                        adr_r <= {3'b000, write_col_buf[rw_index]};
                        ba_r  <= write_ba_buf[rw_index];

                        cs_r    <= 0; 
                        ras_r   <= 1; 
                        cas_r   <= 0; 
                        we_r    <= 0; // WRITE
                    end
                end

                WRITE_CMD_WAIT: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RP) begin
                        wait_cnt <= 5'd0;
                        state    <= WRITE_PRECHARGE;
                    end
                end

                WRITE_PRECHARGE: begin
                    adr_r   <= 13'b0000_0000_0000_0;     // A10=0: 単一バンク
                    ba_r    <= write_ba_buf[0];
                    cs_r    <= 0; 
                    ras_r   <= 0; 
                    cas_r   <= 1; 
                    we_r    <= 0; // PRECHARGE
                    wait_cnt <= 5'd0;
                    state    <= WAIT_TRP_WRITE;
                end

                WAIT_TRP_WRITE: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RP) begin
                        wait_cnt <= 5'd0;
                        state    <= WRITE_DONE;
                    end
                end

                WRITE_DONE: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1;
                    write_ready <= 0;
                    dq_oe       <= 0;
                    write_count <= 0;
                    buffered_write_start <= 0;
                    state       <= IDLE;
                end

                // --- REFRESH ---
                REFRESH_START: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_MD) begin
                        wait_cnt <= 5'd0;
                        state    <= REFRESH_CMD;
                    end
                end

                REFRESH_CMD: begin
                    cs_r    <= 0; 
                    ras_r   <= 0; 
                    cas_r   <= 0; 
                    we_r    <= 1; // AUTO REFRESH
                    wait_cnt <= 5'd0;
                    state    <= REFRESH_WAIT;
                end

                REFRESH_WAIT: begin
                    cs_r    <= 0; 
                    ras_r   <= 1; 
                    cas_r   <= 1; 
                    we_r    <= 1; // NOP
                    wait_cnt <= wait_cnt + 5'd1;
                    if (wait_cnt == timing_RFC) begin
                        wait_cnt <= 5'd0;
                        state    <= IDLE;
                    end
                end
            endcase
        end
    end

    // --- READ Dq 取り込み ---
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            read_cnt    <= 5'd0;
            read_ready  <= 0;
            read_data   <= {DQ_BUS_WIDTH{1'b0}};

        end else begin
            if (state==IDLE) begin
                read_cnt    <= 0;
                read_ready  <= 0;
            end
            if (state==READ_CMD || state==WAIT_CL || state==RED_CMD_WAIT || state==READ_PRECHARGE) begin
                read_cnt    <= read_cnt + 5'd1;
                // DQ latch.
                if (read_cnt > (timing_CAS + 5'd2) && read_cnt < rw_length + 5'd6) begin
                    read_ready  <= 1;
                    read_data   <= dq_d1;
                end else begin
                    read_ready  <= 0;
                end
            end
        end
    end

    // --- refresh timer ---
    // 7.1 [usec] = 1039 clk at 133MHz
    localparam integer REF_COUNT    = (71 * CLK_FREQ_MHz) / 10;  // 7.1us
    reg [11:0] ref_timer;
    reg        refresh_req;
    wire       refresh_req_pre10clk = (ref_timer > REF_COUNT - 10) ? 1'b1 : 1'b0;

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            ref_timer       <= 12'd0;
            refresh_req     <= 0;

        end else if (sdram_init_fin) begin
            ref_timer <= ref_timer + 12'd1;
            if (ref_timer >= REF_COUNT) begin
                refresh_req     <= 1;
                if (state == REFRESH_START) begin
                    ref_timer   <= 0;
                    refresh_req <= 0;
                end
            end
        end
    end

endmodule