// =====================================================================================
module Branch(
    input wire clock,
    input wire reset_n,
    input wire branch_enb,
    input wire [2:0] funct3,
    input wire [31:0] r_data1,
    input wire [31:0] r_data2,
    input wire [1:0] pc_sel,
    input wire [31:0] in_pc,
    // output 
    output reg pc_sel2,
    // pc
    output reg [31:0]  out_pc
);
    
    function BRANCH_EXEC(
        input [2:0] branch_op,
        input [31:0] data1,
        input [31:0] data2,
        input [1:0] pc_sel
    );
        case (pc_sel)
            2'b00: // PC + 4
                BRANCH_EXEC = 1'b0;
            2'b01: begin // BRANCH
                case (branch_op)
                    3'b000: // BEQ
                        BRANCH_EXEC = (data1 == data2) ? 1'b1 : 1'b0;
                    3'b001: // BNE
                        BRANCH_EXEC = (data1 != data2) ? 1'b1 : 1'b0;
                    3'b100: // BLT (SIGNED)
                        BRANCH_EXEC = ($signed(data1) < $signed(data2)) ? 1'b1 : 1'b0;
                    3'b101: // BGE (SIGNED)
                        BRANCH_EXEC = ($signed(data1) >= $signed(data2)) ? 1'b1 : 1'b0;
                    3'b110: // BLTU (UNSIGNED)
                        BRANCH_EXEC = (data1 < data2) ? 1'b1 : 1'b0;
                    3'b111: // BGEU (UNSIGNED)
                        BRANCH_EXEC = (data1 >= data2) ? 1'b1 : 1'b0;
                    default: // ILLEGAL
                        BRANCH_EXEC = 1'b0;
                endcase
            end
            2'b10: // JAL / JALR
                BRANCH_EXEC = 1'b1;
            default: // ILLEGAL
                BRANCH_EXEC = 1'b0;
        endcase
    endfunction

    always @(posedge clock or negedge reset_n) begin
        if(!reset_n) begin
            pc_sel2   <= 0;
            out_pc    <= 32'h0;
        end else begin
            if(branch_enb) begin
                pc_sel2 <= BRANCH_EXEC(funct3, r_data1, r_data2, pc_sel);
                out_pc  <= in_pc;
            end
        end
    end

endmodule