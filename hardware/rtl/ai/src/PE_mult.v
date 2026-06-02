module PE_mult #(
    parameter integer DW = 8,
    parameter integer PW = 32,
    parameter integer SW = PW,
    parameter integer N  = 4    // max:4
)(
    input  wire                     clock,
    input  wire                     reset_n,

    input  wire [N-1:0]             data_in_valid,
    output reg  [N-1:0]             data_out_ready,

    input  wire [N*DW-1:0]          data_A,
    input  wire [N*DW-1:0]          data_B,
    output reg  [SW-1:0]            result_C
);

    reg  [1:0]          idx;      // max(N)=4
    reg  [3:0]          data_in_valid_reg;
    reg  [N*DW-1:0]     data_A_latch;
    reg  [N*DW-1:0]     data_B_latch;

    wire  [DW-1:0] A_sel = data_A_latch[idx*DW +: DW];
    wire  [DW-1:0] B_sel = data_B_latch[idx*DW +: DW];

    reg  [31:0]   result_C_32bit;

    integer i;

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            idx            <= 0;
            data_in_valid_reg <= 16'h0;
            data_out_ready <= {N{1'b0}};
            result_C_32bit <= 32'h0;
            result_C       <= {(N*SW){1'b0}};
        end else begin
            data_out_ready <= {N{1'b0}};

            // valid_reg
            for (i=0; i<N; i++) begin
                if (data_in_valid[i]) begin
                    data_in_valid_reg[i] <= 1'b1;
                    data_A_latch <= data_A;
                    data_B_latch <= data_B;
                end
            end

            // multify
            if (data_in_valid_reg[idx]) begin
                data_in_valid_reg[idx]  <= 1'b0;
                data_out_ready[idx]     <= 1'b1;
                // result
                result_C <= A_sel * B_sel;
            end

            if (idx == N-1)
                idx <= 0;
            else
                idx <= idx + 1'b1;
        end
    end

endmodule