// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Fri May 17 14:24:20 2024
// Host        : LAPTOP-9GB7878V running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/composition/vivado-project/sync_inst_rom/sync_inst_rom.srcs/sources_1/ip/inst_rom/inst_rom_stub.v
// Design      : inst_rom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_6,Vivado 2017.1" *)
module inst_rom(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[31:0]" */;
  input clka;
  input [7:0]addra;
  output [31:0]douta;
endmodule
