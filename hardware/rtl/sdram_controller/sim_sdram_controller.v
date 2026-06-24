/*
NISHIHARU
*/
`timescale 1ns / 1ps

module sim_sdram_controller (
    input  wire                     clock,
    input  wire                     reset_n
)

    // SDRAMモデル（GW2AR SDRAM）
    GW2AR_sdram u_sdram_model (
        .Dq         (sdram_dq),
        .Addr       (sdram_adr),
        .Ba         (sdram_ba),
        .Clk        (sdram_clk),
        .Cke        (1'b1),
        .Cs_n       (sdram_cs),
        .Ras_n      (sdram_ras),
        .Cas_n      (sdram_cas),
        .We_n       (sdram_we),
        .Dqm        (sdram_dqm)
    );

endmodule