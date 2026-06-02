// file for: PSC_ONE_Chip
//`define DUMP_VCD_FILE // #-DDUMP_VCD_FILEで設定する.
//`define DUMP_FST_FILE

`ifdef DUMP_VCD_FILE
    initial begin
        $dumpfile("./wave/PSCONE_Chip.vcd");  // 出力するファイル名
        $dumpvars(0);  
        $dumpvars(1,u_chip);     // 第1引数: 階層 (0 はこのモジュールを最上位として)
        $dumpvars(1,u_sdram_model);
        $dumpvars(1,u_sd_model);
        $dumpvars(1,u_chip.u_4port_sdram_axi);
        $dumpvars(1,u_chip.u_4port_sdram_axi.u_sdram_controller);
        $dumpvars(1,u_chip.u_bt_rom); 
        $dumpvars(1,u_chip.u_core_axi); 
        $dumpvars(1,u_chip.u_core_axi.u_core); 
        $dumpvars(1,u_chip.u_uart);  
    end
`endif

// 追加: FSTダンプ用ブロック
`ifdef DUMP_FST_FILE
    initial begin
        $dumpfile("./wave/PSCONE_Chip.fst");  // 出力するファイル名
        $dumpvars(1);    
        $dumpvars(0,u_chip);     // 第1引数: 階層 (0 はこのモジュールを最上位として)
        $dumpvars(1,u_chip.u_uart);  
    end
`endif
