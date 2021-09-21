`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 10:49:51
// Module Name: and_a_b
// Project Name: project 2
// Target Devices: FPGA board
// Description: a&&b
// 
// Dependencies: a,b
//////////////////////////////////////////////////////////////////////////////////


module and_a_b(a,b,out);
input a,b;
output out;
reg out;

always @(a,b)
  out=a&&b;
endmodule
