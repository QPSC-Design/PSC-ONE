`timescale 1ns/1ps
// -----------------------------------------------------------------------------
// PE_INT (N-bit compatible, sequential multiplication version)
// - A/B inputs are first latched into a_reg/b_reg before computation starts
// - B propagates vertically only through en_b_shift_bottom
//   (it does not move with en_shift_right)
// - ps is updated by adding product only once after multiplication completes,
//   on the first en_shift_bottom event
// -----------------------------------------------------------------------------
module PE_INT #(
    parameter integer DW            = 8,          // Bit width of A/B
    parameter integer PW            = 32,         // Product width (fixed to 32-bit)
    parameter integer SW            = PW,         // Partial-sum width
    parameter integer PE_CYCLE      = 1
)(
    // Clock & Reset
    input  wire             clock,
    input  wire             reset_n,

    // Control signals
    input  wire             data_clear,         // Clear internal registers
    input  wire             start,              // Start multiplication (accepted only when busy=0)
    input  wire             en_b_shift_bottom,  // Capture B from top / forward B downward
    input  wire             en_shift_right,     // Capture A from left / forward A rightward
    input  wire             en_shift_bottom,    // Capture partial sum from top / forward downward
    
    // Inputs
    input  wire [DW-1:0]    b_in,               // B input from top PE
    input  wire [DW-1:0]    a_in,               // A input from left PE
    input  wire [SW-1:0]    ps_in,              // Partial sum input from top PE

    // Multiplier interface / result / valid-ready handshake
    output reg              data_out_valid,
    input  wire             data_in_ready,

    output wire [DW-1:0]    data_A,
    output wire [DW-1:0]    data_B,
    input  wire [SW-1:0]    result_C,

    // Outputs to neighboring PEs
    output reg              busy,
    output reg              done,
    output wire [DW-1:0]    a_shift_to_right,   // Forward A to right PE
    output wire [DW-1:0]    b_shift_to_bottom,  // Forward B to bottom PE
    output reg  [SW-1:0]    sum_to_bottom,      // Forward partial sum to bottom PE
    output reg  [SW-1:0]    ps_acc              // PE accumulator (32-bit)
);

    // VCD waveform output
    //`include "./src/include_vcd_output.v"

    //========================================================
    reg [DW-1:0] a_reg;   // A register propagated to the right
    reg [DW-1:0] b_reg;   // B register propagated downward

    // Interface to PE_mult
    assign data_A   = a_reg;
    assign data_B   = b_reg;

    // A shift chain: updated only by en_shift_right
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            a_reg <= {DW{1'b0}};
        end else if (data_clear) begin
            a_reg <= {DW{1'b0}};
        end else if (en_shift_right) begin
            a_reg <= a_in; // Capture A from left PE
        end
    end
    assign a_shift_to_right = a_reg;

    // B shift chain: updated only by en_b_shift_bottom
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            b_reg <= {DW{1'b0}};
        end else if (data_clear) begin
            b_reg <= {DW{1'b0}};
        end else if (en_b_shift_bottom) begin
            b_reg <= b_in; // Capture B from top PE
        end
    end
    assign b_shift_to_bottom = b_reg;

    //========================================================
    localparam integer CW = (DW <= 1) ? 1 : $clog2(DW+1);

    // Internal working registers
    reg          wait_mult;
    reg [PW-1:0] product;        // Final multiplication result
    reg [7:0]    count;          // Cycle counter
    reg          inject_product; // One-shot flag for product accumulation

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            product        <= {PW{1'b0}};
            wait_mult      <= 1'b0;
            count          <= 8'd0;
            data_out_valid <= 1'b0;
            busy           <= 1'b0;
            done           <= 1'b0;
            inject_product <= 1'b0;
            sum_to_bottom  <= {SW{1'b0}};
            ps_acc         <= {SW{1'b0}};
        end else begin
            // Generate a one-cycle done pulse
            done <= 1'b0;

            // data_clear resets only the computation path
            // (a_reg and b_reg are cleared in their own processes)
            if (data_clear) begin
                product        <= {PW{1'b0}};
                count          <= 8'd0;
                data_out_valid <= 1'b0;
                busy           <= 1'b0;
                done           <= 1'b0;
                inject_product <= 1'b0;
                ps_acc         <= {SW{1'b0}};
            end else begin
                // Default assignments
                inject_product <= 1'b0;
                data_out_valid <= 1'b0;

                // Accept a new multiplication request when idle
                if (start && !busy) begin
                    count          <= 8'd0;
                    wait_mult      <= 1'b0;
                    busy           <= 1'b1;
                    inject_product <= 1'b0;

                // Multiplication in progress
                end else if (busy) begin
                    if (count == (PE_CYCLE) && !wait_mult) begin
                        data_out_valid <= 1'b1;
                        wait_mult      <= 1'b1;

                        // Final multiplication stage:
                        // product is generated through PE_mult
                        //product <= a_reg * b_reg;

                    end else if (data_in_ready) begin
                        data_out_valid <= 1'b0;
                        wait_mult      <= 1'b0;
                        product        <= result_C; // Result from PE_mult
                        busy           <= 1'b0;
                        done           <= 1'b1;    // One-cycle pulse
                        count          <= 8'd0;
                        inject_product <= 1'b1;    // Wait for partial-sum injection

                    end else begin
                        count          <= count + 8'd1;
                        inject_product <= 1'b0;
                    end
                end

                // Partial-sum propagation path
                if (en_shift_bottom) begin
                    sum_to_bottom <= ps_in + product;
                end

                // Output-stationary accumulation
                if (inject_product) begin
                    ps_acc <= ps_acc + product; // Future usage TBD
                end
            end
        end
    end

endmodule