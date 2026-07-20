package PSC_Types;

    typedef struct packed {
        logic [4:0]  r_addr1;
        logic [4:0]  r_addr2;
        logic [4:0]  w_addr;

        logic [31:0] imm;
        logic [4:0]  alucon;
        logic [2:0]  funct3;
        logic        op1sel;
        logic        op2sel;

        logic        mem_rw;
        logic        rf_wen;
        logic [1:0]  wb_sel;

        logic [1:0]  pc_sel;
        logic [31:0] out_pc;

        logic        is_fence;
        logic        is_fence_i;
        logic        is_sfence_vma;

        logic        csr_wr;
        logic [1:0]  csr_cmd;
        logic        csr_use_imm;
        logic [11:0] csr_addr;
        logic [4:0]  csr_zimm;

        logic        is_sret;
        logic        is_mret;
        logic        is_ecall;

        logic        is_load;
        logic        is_store;

        logic        is_R_type;
        logic        is_op_imm;

        logic        raise_illegal_instruction;
    } dec_ctrl_t;

endpackage