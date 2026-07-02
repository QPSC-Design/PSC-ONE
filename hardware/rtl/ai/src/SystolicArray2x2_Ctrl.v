`timescale 1ns/1ps

module SystolicArray2x2_Ctrl (
    input  wire             clock,
    input  wire             reset_n,
    input  wire             start,
    input  wire             sa_state_reset,
    input  wire [3:0]       sa_os_instruction,  // 4'b0000: mul, 4'b0001: add, 4'b0010: LRU .. TBD.
    input  wire             sa_os_mode,         // 1'b0: Data Flow mode. 1'b1: Output Stationary mode.
    input  wire             sa_clear,
    input  wire             sa_store,
    input  wire [7:0]       sa_cycle,       // 0, 2, 4, 8...  0: Single mode.

    // SDRAM base
    input  wire [31:0]      BASE_ADDR_A,
    input  wire [31:0]      BASE_ADDR_B,
    input  wire [31:0]      BASE_ADDR_C,

    // req ready
    input  wire             sa_req_ready,   

    // READ port
    output reg  [31:0]      rd_read_addr,
    output reg              rd_read_valid,
    input  wire             rd_read_ready,
    input  wire [31:0]      rd_read_data,

    // WRITE port
    output reg              c_write_valid,
    output reg  [31:0]      c_write_addr,
    output reg  [31:0]      c_write_wdata,
    input  wire             c_write_ready,

    output reg              busy,
    output reg              done
);

// vcd output
//`include "./src/include_vcd_output.v"

localparam integer N = 2;
localparam integer PE_CYCLE = 1;
localparam integer SHIFT_DOWN_REP = 2;

//--------------------------------------------
// SA signals
//--------------------------------------------
reg               data_clear;
reg               en_b_shift_bottom;
reg               en_shift_right;
reg               en_shift_bottom;
reg               start_pulse;

reg  [3:0]        cycle_idx;

reg  [15:0]       a_left_in_bus;
reg  [15:0]       b_top_in_bus;
wire [31:0]       ps_top_in_bus_0 = 32'd0;
wire [31:0]       ps_top_in_bus_1 = 32'd0;

wire              busy_out;
wire              done_out;
wire [31:0]       ps_bottom_out_bus_0;
wire [31:0]       ps_bottom_out_bus_1;

// debug
wire [31:0]       ps_acc_0;
wire [31:0]       ps_acc_1;
wire [31:0]       ps_acc_2;
wire [31:0]       ps_acc_3;

//--------------------------------------------
// SA instance
//--------------------------------------------
SystolicArray2x2_x2 #(
    .PE_CYCLE               (PE_CYCLE)
) u_sa (
    .clock                  (clock),
    .reset_n                (reset_n),

    .data_clear             (data_clear | (sa_os_mode & sa_clear)),
    .en_b_shift_bottom      (en_b_shift_bottom),
    .en_shift_right         (en_shift_right),
    .en_shift_bottom        (en_shift_bottom),
    .start_pulse            (start_pulse),

    .a_left_in_bus          (a_left_in_bus),        // 8bit x 2
    .b_top_in_bus           (b_top_in_bus),         // 8bit x 2
    .ps_top_in_bus_0        (ps_top_in_bus_0),      // 32bit
    .ps_top_in_bus_1        (ps_top_in_bus_1),      // 32bit

    .ps_bottom_out_bus_0    (ps_bottom_out_bus_0),
    .ps_bottom_out_bus_1    (ps_bottom_out_bus_1),
    .ps_acc_0               (ps_acc_0),
    .ps_acc_1               (ps_acc_1),
    .ps_acc_2               (ps_acc_2),
    .ps_acc_3               (ps_acc_3),

    .busy_out               (busy_out),
    .done_out               (done_out)
);

//--------------------------------------------
// Internal buffers
//--------------------------------------------
reg [31:0] a_data [0:N-1];
reg [31:0] b_data [0:N-1];

reg [31:0] cur_a_data;
reg [31:0] cur_b_data;

wire [31:0] debug_a_data_0 = a_data[0];
wire [31:0] debug_a_data_1 = a_data[1];

wire [31:0] debug_b_data_0 = b_data[0];
wire [31:0] debug_b_data_1 = b_data[1];

//--------------------------------------------
// Internal wire for Output Stationary mode
//--------------------------------------------
wire [31:0] a_os_data[0:N+1];  
wire [31:0] b_os_data[0:N+1];

assign a_os_data[0] = {24'd0, a_data[0][7:0]};
assign a_os_data[1] = {16'd0, a_data[1][7:0], a_data[0][15:8]};
assign a_os_data[2] = {16'd0, a_data[1][15:8], 8'd0};
assign a_os_data[3] = 32'd0;

assign b_os_data[0] = {24'd0, b_data[0][7:0]};
assign b_os_data[1] = {16'd0, b_data[0][15:8], b_data[1][7:0]};
assign b_os_data[2] = {16'd0, b_data[1][15:8], 8'd0};
assign b_os_data[3] = 32'd0;

//--------------------------------------------
// Result value Internal buffers
//--------------------------------------------
reg [31:0]  c_data_00;
reg [31:0]  c_data_01;
reg [31:0]  c_data_10;
reg [31:0]  c_data_11;

//--------------------------------------------
// Address helpers
//--------------------------------------------
function [31:0] addr_A(input [3:0] k, input [3:0] idx);
    begin
        addr_A = BASE_ADDR_A + (k * 4) + 4 * N * idx;
    end
endfunction

function [31:0] addr_B(input [3:0] k, input [3:0] idx);
    begin
        addr_B = BASE_ADDR_B + (k * 4) + 4 * N * idx;
    end
endfunction

function [31:0] addr_C(input [3:0] k);
    begin
        addr_C = BASE_ADDR_C + (k * 4);
    end
endfunction

//--------------------------------------------
// SA input mapping
//--------------------------------------------
always @(posedge clock or negedge reset_n) begin
    if (!reset_n) begin
        a_left_in_bus <= 16'd0;
        b_top_in_bus  <= 16'd0;
    end else begin
        a_left_in_bus <= {cur_a_data[15:8], cur_a_data[7:0]};
        b_top_in_bus  <= {cur_b_data[15:8], cur_b_data[7:0]};
    end
end

//--------------------------------------------
// FSM
//--------------------------------------------
localparam [5:0]
    S_IDLE                  = 6'd0,
    S_CLEAR                 = 6'd1,

    S_RA_START              = 6'd2,
    S_RA_WAIT               = 6'd3,

    S_RB_START              = 6'd4,
    S_RB_WAIT               = 6'd5,

    // Output-Stationary mode.
    S_OS_START              = 6'd6,
    S_OS_SHIFT              = 6'd7,
    S_OS_SHIFT_PULSE        = 6'd8,
    S_OS_START_PULSE        = 6'd9,
    S_OS_START_WAIT         = 6'd10,
    S_OS_SHIFT_WAIT         = 6'd11,
    S_OS_FLUSH              = 6'd12,
    S_OS_FLUSH_START_PULSE  = 6'd13,
    S_OS_FLUSH_WAIT         = 6'd14,

    // Output to Memory
    S_OUTPUT_MEMORY         = 6'd20,
    S_OUTPUT_MEMORY_W       = 6'd21,
    S_DONE                  = 6'd31;

reg [5:0]   state;

reg [3:0]   a_idx;
reg [3:0]   b_idx;
reg [3:0]   b_send_idx;
reg [3:0]   row_s;
reg [3:0]   wait_cnt;
reg [3:0]   shift_down_cnt;

//--------------------------------------------
// Main FSM
//--------------------------------------------
always @(posedge clock or negedge reset_n) begin
    if (!reset_n) begin
        state <= S_IDLE;

        data_clear        <= 1'b0;
        en_b_shift_bottom <= 1'b0;
        en_shift_right    <= 1'b0;
        en_shift_bottom   <= 1'b0;
        start_pulse       <= 1'b0;

        cycle_idx         <= 4'd0;

        rd_read_addr      <= 32'd0;
        rd_read_valid     <= 1'b0;

        c_write_valid     <= 1'b0;
        c_write_addr      <= 32'd0;
        c_write_wdata     <= 32'd0;

        cur_a_data        <= 32'd0;
        cur_b_data        <= 32'd0;

        c_data_00         <= 32'd0;
        c_data_01         <= 32'd0;
        c_data_10         <= 32'd0;
        c_data_11         <= 32'd0;

        a_idx             <= 4'd0;
        b_idx             <= 4'd0;
        b_send_idx        <= 4'd0;
        row_s             <= 4'd0;
        wait_cnt          <= 4'd0;
        shift_down_cnt    <= 4'd0;

        busy              <= 1'b0;
        done              <= 1'b0;
    end else begin
        // default
        data_clear        <= 1'b0;
        en_b_shift_bottom <= 1'b0;
        en_shift_right    <= 1'b0;
        en_shift_bottom   <= 1'b0;
        start_pulse       <= 1'b0;
        rd_read_valid     <= 1'b0;
        c_write_valid     <= 1'b0;

        busy <= (state != S_IDLE) && (state != S_DONE);
        done <= (state == S_DONE);

        case (state)
            //--------------------------------------------
            S_IDLE: begin
                if (start) begin
                    a_idx          <= 4'd0;
                    b_idx          <= 4'd0;
                    b_send_idx     <= 4'd0;
                    row_s          <= 4'd0;
                    wait_cnt       <= 4'd0;
                    shift_down_cnt <= 4'd0;
                    cur_a_data     <= 32'd0;
                    cur_b_data     <= 32'd0;
                    cycle_idx      <= 4'd0;
                    state          <= S_CLEAR;
                end
            end

            //--------------------------------------------
            // state = 1
            S_CLEAR: begin
                if (!sa_os_mode) begin
                    data_clear    <= 1'b1;
                end
                state         <= S_RA_START;
            end

            //--------------------------------------------
            // READ A
            // state = 2
            S_RA_START: begin
                if (sa_req_ready) begin
                    rd_read_addr  <= addr_A(4'd0, cycle_idx);
                    rd_read_valid <= 1'b1;
                    a_idx         <= 4'd0;
                    state         <= S_RA_WAIT;
                end
            end

            // state = 3
            S_RA_WAIT: begin
                if (rd_read_ready) begin
                    a_data[a_idx] <= rd_read_data;
                    if (a_idx == (N-1)) begin
                        state         <= S_RB_START;
                    end else begin
                        a_idx         <= a_idx + 4'd1;
                        rd_read_addr  <= addr_A(a_idx + 4'd1, cycle_idx);
                        rd_read_valid <= 1'b1;
                        state         <= S_RA_WAIT;
                    end
                end
            end

            //--------------------------------------------
            // READ B
            // state = 4
            S_RB_START: begin
                if (sa_req_ready) begin
                    b_idx         <= 4'd0;
                    rd_read_addr  <= addr_B(4'd0, cycle_idx);
                    rd_read_valid <= 1'b1;
                    a_idx         <= 4'd0;
                    state         <= S_RB_WAIT;
                end
            end

            // state = 5
            S_RB_WAIT: begin
                if (rd_read_ready) begin
                    b_data[b_idx] <= rd_read_data;
                    if (b_idx == (N-1)) begin
                        b_send_idx <= (N-1);
                        state      <= S_OS_START;
                    end else begin
                        b_idx         <= b_idx + 4'd1;
                        rd_read_addr  <= addr_B(b_idx + 4'd1, cycle_idx);
                        rd_read_valid <= 1'b1;
                        state         <= S_RB_WAIT;
                    end
                end
            end

            // ===============================================================
            // Output Stationary mode
            // ===============================================================
            S_OS_START: begin
                row_s <= 4'd0;
                state <= S_OS_SHIFT;
            end

            S_OS_SHIFT: begin
                cur_a_data <= a_os_data[row_s];
                cur_b_data <= b_os_data[row_s];
                state <= S_OS_SHIFT_PULSE;
            end

            S_OS_SHIFT_PULSE: begin
                en_shift_right <= 1'b1;
                en_b_shift_bottom <= 1'b1;
                state <= S_OS_START_PULSE;
            end

            S_OS_START_PULSE: begin
                start_pulse <= 1'b1;
                state <= S_OS_START_WAIT;
            end

            S_OS_START_WAIT: begin
                if (done_out) begin
                    state <= S_OS_SHIFT_WAIT;
                end
            end

            S_OS_SHIFT_WAIT: begin
                if (row_s == (2*N - 2)) begin
                    cur_a_data <= 32'd0;
                    row_s      <= 4'd0;
                    state      <= S_OS_FLUSH;
                end else begin
                    row_s <= row_s + 4'd1;
                    state <= S_OS_SHIFT;
                end
            end

            S_OS_FLUSH: begin
                cur_a_data <= 32'd0;
                cur_b_data <= 32'd0;
                en_shift_right <= 1'b1;
                en_b_shift_bottom <= 1'b1;
                state <= S_OS_FLUSH_START_PULSE;
            end

            S_OS_FLUSH_START_PULSE: begin
                start_pulse <= 1'b1;
                state <= S_OS_FLUSH_WAIT;
            end

            S_OS_FLUSH_WAIT: begin
                if (done_out) begin
                    if (row_s == N-1) begin
                        row_s      <= 4'd0;
                        if (sa_store) begin
                            cycle_idx  <= cycle_idx + 4'd1;
                            if ((sa_cycle == 8'd0) || (cycle_idx == sa_cycle - 8'd1))
                                state      <= S_OUTPUT_MEMORY;
                            else
                                state      <= S_CLEAR;
                        end else begin
                            state      <= S_DONE;
                        end
                    end else begin
                        row_s <= row_s + 4'd1;
                        state <= S_OS_FLUSH;
                    end
                end
            end

            //--------------------------------------------
            // state = 19
            S_OUTPUT_MEMORY: begin
                if (sa_req_ready) begin
                    c_write_valid <= 1'b1;
                    c_write_addr  <= addr_C(row_s);
                    state      <= S_OUTPUT_MEMORY_W;
                    if (sa_os_mode) begin
                        case(row_s)
                            0: c_write_wdata <= {ps_acc_0[31:0]};
                            1: c_write_wdata <= {ps_acc_1[31:0]};
                            2: c_write_wdata <= {ps_acc_2[31:0]};
                            3: c_write_wdata <= {ps_acc_3[31:0]};
                        endcase
                    end else begin
                        // Data flow mode.
                        case(row_s)
                            0: c_write_wdata <= {c_data_00[15:0]};
                            1: c_write_wdata <= {c_data_01[15:0]};
                            2: c_write_wdata <= {c_data_10[15:0]};
                            3: c_write_wdata <= {c_data_11[15:0]};
                        endcase
                    end
                end
            end

            //--------------------------------------------
            // state = 20
            S_OUTPUT_MEMORY_W: begin
                if (c_write_ready) begin
                    state <= S_OUTPUT_MEMORY;
                    if (row_s == 2*N-1)
                        state <= S_DONE;
                    else
                        row_s <= row_s + 4'd1;
                end
            end

            //--------------------------------------------
            S_DONE: begin
                if (sa_state_reset)
                    state <= S_IDLE;
            end

            default: begin
                state <= S_IDLE;
            end
        endcase
    end
end

endmodule
