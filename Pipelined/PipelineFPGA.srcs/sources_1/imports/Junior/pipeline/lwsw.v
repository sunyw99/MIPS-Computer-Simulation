`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 23:59:34
// Design Name: 
// Module Name: lwsw
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


module lwsw(memsrc,wb_rt,mem_rt,wb_memread,mem_memwrite);
input wb_memread,mem_memwrite;
input [4:0] wb_rt,mem_rt;
output memsrc; 

reg memsrc;

initial
   memsrc=0;

always @(wb_rt,mem_rt,wb_memread,mem_memwrite)
   if ({wb_rt,wb_memread,mem_memwrite}=={mem_rt,1'b1,1'b1})
      memsrc=1;
endmodule
