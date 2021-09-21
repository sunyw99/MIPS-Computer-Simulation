`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 00:11:18
// Design Name: comparator
// Module Name: equal
// Project Name: project 2
// Target Devices: FPGA board 
// Description: compare the two number a and b
// 
// Dependencies: a,b
// 
//////////////////////////////////////////////////////////////////////////////////


module equal(a,b,out);
input [31:0] a,b;
output out;

reg out;
always @(a,b)
  out=a==b;
endmodule
