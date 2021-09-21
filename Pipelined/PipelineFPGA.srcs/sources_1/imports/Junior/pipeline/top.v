`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 23:16:46
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(clk, PC, registersel, FPGAout);
  input clk;
  input [4:0] registersel;
  output [31:0] PC, FPGAout;
  wire pcwrite,branch,jump,ifidwrite,flush,bubble,compare,beq,bne,memread_wb,memsrc,stall_finish,settle;
  wire [31:0] pc_in, pc_out,pc_plus_4_if,bradd,jadd,instr_if,pc_id,instr_id,memout_wb,
  aluout_wb,data1_id,data2_id,imme_id,pc_ex,aluout_ex,aluout_mem,memout_mem,
  memin_mem,data2_ex,data1_ex,data2_ex_in,imme_ex;
  wire [1:0] ex_mem,wb_wb,id_wb,id_mem,ex_wb,mem_wb,fa,fb,mem_mem,fa_id,fb_id;//stage_signal
  wire [4:0] ex_rt2,id_rd,id_rt1,id_rt2,id_rs,w_addr_wb,ex_rs,ex_rt1,w_addr_mem,
  w_addr_ex,ex_rd;
  wire [3:0] id_ex,ex_ex;
  reg [5:0] cycle;
  
  
  initial begin 
    cycle=6'b0;
    $monitor("Time:",$time,", CLK=%d, PC=%h",cycle,pc_out);
  end
  always @(posedge clk)
  begin 
    cycle=cycle+6'b1;
  end
  
  hazard h(ifidwrite,bubble,ex_mem[1],ex_rt2,instr_id[20:16],instr_id[15:11],pcwrite,
  bne,beq,ex_rd,instr_id[25:21],ex_wb[1],settle,stall_finish,w_addr_mem,mem_mem[1],mem_wb[1]);
  PC p(pcwrite,pc_in,pc_out,clk);
  Mux_PC m_p(branch,jump,pc_plus_4_if,bradd,jadd,pc_in);
  if_flush if_f(jump,beq,bne,compare,flush,branch,bubble,stall_finish,settle);
  forward_compare fc(wb_wb[1],w_addr_wb,instr_id[20:16],instr_id[25:21],mem_wb[1],
  w_addr_mem,fa_id,fb_id,mem_mem[1],beq,bne);
  forward f(wb_wb[1],w_addr_wb,ex_rs,ex_rt1,mem_wb[1],w_addr_mem,fa,fb,memread_wb);
  lwsw l(memsrc,w_addr_wb,w_addr_mem,memread_wb,mem_mem[0]);
  
  
  
   
   MEM_WB mw(mem_wb[0],mem_wb[1],memout_mem,aluout_mem,w_addr_mem,wb_wb[0],wb_wb[1],
      memout_wb,aluout_wb,w_addr_wb,mem_mem[1],memread_wb,clk);
    EX_MEM em(ex_mem[1],ex_wb[0],ex_mem[0],ex_wb[1],aluout_ex,data2_ex,
    w_addr_ex,mem_mem[1],mem_wb[0],mem_mem[0],mem_wb[1],aluout_mem,memin_mem,w_addr_mem,clk);
    ID_EX_register ie(ex_ex,ex_mem,ex_wb,data1_ex,data2_ex_in,imme_ex,ex_rs,ex_rt1,ex_rd,
    id_ex,id_mem,id_wb,data1_id,ex_rt2,data2_id,imme_id,id_rs,id_rt1,id_rd,id_rt2,clk,bubble);
    IFID ii(ifidwrite,flush,pc_plus_4_if,instr_if,pc_id,instr_id,clk);
  
  assign PC = pc_out;
  IF iff(pc_out,pc_plus_4_if,instr_if);
  idwb i(pc_id,instr_id,bradd,jadd,memout_wb,aluout_wb,wb_wb[1],id_wb,id_ex,id_mem,
  data1_id,data2_id,imme_id,id_rd,id_rt1,id_rt2,id_rs,jump,beq,bne,pc_ex
   ,wb_wb[0],w_addr_wb,compare,fa_id,fb_id,aluout_mem,clk, registersel, FPGAout);
  EX e(data1_ex,data2_ex_in,aluout_wb,aluout_mem,memout_wb,fa,fb,aluout_ex,imme_ex,ex_ex,
  data2_ex,ex_rd,ex_rt2,w_addr_ex);
  mem m(memsrc,aluout_mem,memin_mem,memout_wb,memout_mem,mem_mem[1],mem_mem[0],clk);
  
endmodule
