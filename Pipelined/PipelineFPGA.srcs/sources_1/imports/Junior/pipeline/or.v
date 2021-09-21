`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 10:47:34
// Design Name: or
// Module Name: or
// Project Name: project 2
// Target Devices: FPGA board
// Description: a||b
// 
// Dependencies: a,b
// 

//////////////////////////////////////////////////////////////////////////////////


module or_a_b(a,b,out);
input a,b;
output out;
reg out;

always @(a,b)
  out=a||b;
endmodule
