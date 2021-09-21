`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 23:50:25
// Design Name: 
// Module Name: mem
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


module mem(memsrc,addr,regout,memout_wb,memout_mem,memread,memwrite, clk);
input memsrc,memread,memwrite, clk;
input [31:0] regout,memout_wb,addr;
output [31:0] memout_mem;

wire [31:0] write_data;

  
mux_2_1_32bit m9(write_data,regout,memout_wb,memsrc);
DataMem dm(memwrite,memread,write_data,addr,memout_mem, clk);
endmodule
