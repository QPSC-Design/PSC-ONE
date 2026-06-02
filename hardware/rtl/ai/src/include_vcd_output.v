// vcd output
//`include "include_vcd_output.v"
`define DUMP_VCD_FILE
//`define DUMP_FST_FILE

`ifdef DUMP_VCD_FILE
initial begin
    $dumpfile("./wave/SA_test1.vcd");  // 出力するVCDファイル名
    $dumpvars(0);     // 第1引数: 階層 (0 はこのモジュールを最上位として)
end
`endif

`ifdef DUMP_FST_FILE
initial begin
    $dumpfile("./wave/SA_test1.fst");  // 出力するVCDファイル名
    $dumpvars(0);     // 第1引数: 階層 (0 はこのモジュールを最上位として)
end
`endif
