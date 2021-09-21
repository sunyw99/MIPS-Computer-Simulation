`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 00:20:23
// Design Name: Adder
// Module Name: adder
// Project Name: project 2
// Target Devices: FPGA board
// Description: add the two inputs 
// 
// Dependencies: a,b
//////////////////////////////////////////////////////////////////////////////////


module adder(a,b,out);
input [31:0] a,b;
output [31:0] out;
reg [31:0] out;
initial begin 
   out=32'b0;
end

always @(a,b)
  out=a+b;
endmodule
