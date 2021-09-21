`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying 
// 
// Create Date: 2019/11/01 00:17:18
// Design Name: shift 2 operator
// Module Name: shift2
// Project Name: project 2
// Target Devices: FPGA board 
// Description: left shift the input 2 bits
// 
// Dependencies: in
//////////////////////////////////////////////////////////////////////////////////


module shift2(in,out);
input [31:0] in;
output [31:0] out;

reg [31:0] out;

initial 
   out=32'b0;
always @(in)
  out=in*4;
endmodule
