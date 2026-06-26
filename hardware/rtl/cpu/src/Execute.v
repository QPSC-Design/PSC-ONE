// NISHIHARU

module Execute(
    input wire              clock,
    input wire              reset_n,
    input wire              execute_enb,
    input wire [4:0]        r_addr1,
    input wire [4:0]        r_addr2,
    input wire [31:0]       reg_data_addr1,
    input wire [31:0]       reg_data_addr2,
    input wire              op1sel,
    input wire              op2sel,
    input wire [4:0]        alucon,
    input wire [31:0]       imm,
    input wire [31:0]       in_pc,
    // output 
    output reg [31:0]       alu_data,
    output reg [31:0]       r_data1,
    output reg [31:0]       r_data2,
    // pc
    output reg [31:0]       out_pc
);

    wire [31:0] r_data1_w;
    wire [31:0] r_data2_w;

    assign r_data1_w = reg_data_addr1;
    assign r_data2_w = reg_data_addr2;

    // SELECTOR
    wire [31:0] s_data1_w;
    wire [31:0] s_data1_w1, s_data1_w2, s_data2_w;
    assign s_data1_w = (op1sel == 1'b1) ? in_pc: r_data1_w;
    assign s_data2_w = (op2sel == 1'b1) ? imm : r_data2_w;

    // =====================================================================================
    function [31:0] ALU_EXEC( input [4:0] control, input [31:0] data1, input [31:0] data2);
        case(control)
            5'b0_0000: ALU_EXEC     = data1 + data2;                 // ADD/ADDI
            5'b1_0000: ALU_EXEC     = data1 - data2;                 // SUB
            5'b0_0001: ALU_EXEC     = data1 << data2[4:0];           // SLL/SLLI
            5'b0_0010: ALU_EXEC     = ($signed(data1) < $signed(data2)) ? 32'b1 : 32'b0; // SLT/SLTI
            5'b0_0011: ALU_EXEC     = (data1 < data2) ? 32'b1 : 32'b0;                   // SLTU/SLTIU
            5'b0_0100: ALU_EXEC     = data1 ^ data2;                 // XOR/XORI
            5'b0_0101: ALU_EXEC     = data1 >> data2[4:0];           // SRL/SRLI
            5'b1_0101: ALU_EXEC     = $signed(data1) >>> data2[4:0]; // SRA/SRAI（bit30=1）
            5'b0_0110: ALU_EXEC     = data1 | data2;                 // OR/ORI
            5'b0_0111: ALU_EXEC     = data1 & data2;                 // AND/ANDI
            
            // RV32M: MUL, MULLHSU, MULHUのみ対応
            5'b1_1000: ALU_EXEC     = data1 * data2;  // MUL
            5'b1_1001: begin
                // MULH（仮実装でも可）
                ALU_EXEC = ($signed({{32{data1[31]}}, data1}) *
                            $signed({{32{data2[31]}}, data2})) >> 32;
            end
            5'b1_1010: begin
                // MULHSU（仮実装）
                ALU_EXEC = ($signed({{32{data1[31]}}, data1}) *
                            {32'b0, data2}) >> 32;
            end
            5'b1_1011: begin
                // MULHU
                ALU_EXEC = ({32'b0, data1} * {32'b0, data2}) >> 32;
            end
            /*
            5'b1_1100: ALU_EXEC     = $signed(data1) / $signed(data2); // DIV
            5'b1_1101: ALU_EXEC     = data1 / data2;                   // DIVU
            5'b1_1110: ALU_EXEC     = $signed(data1) % $signed(data2); // REM
            5'b1_1111: ALU_EXEC     = data1 % data2;                   // REMU
            */
            default:   ALU_EXEC     = 32'b0;
        endcase
    endfunction

    // state==EXECUTE
    always @(posedge clock or negedge reset_n) begin
        if(!reset_n) begin
            alu_data    <= 0; 
            r_data1     <= 0;
            r_data2     <= 0;
            out_pc      <= 32'h0;
        end else begin
            if(execute_enb) begin
                alu_data    <= ALU_EXEC(alucon, s_data1_w, s_data2_w);
                r_data1     <= r_data1_w;
                r_data2     <= r_data2_w;
                out_pc      <= in_pc;
            end
        end
    end
endmodule
