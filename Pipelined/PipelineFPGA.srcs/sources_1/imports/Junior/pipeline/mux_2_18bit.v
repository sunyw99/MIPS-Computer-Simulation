`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 10:53:47
// Design Name: 2 to 1 8 bit mux
// Module Name: mux_2_18bit
// Project Name: project 2
// Target Devices: FPGA board
// Description: select the two 8 bit numbers 
// 
// Dependencies: i0,i1,sel
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_2_1_8bit(i0,i1,sel,out);
input [7:0] i0,i1;
input sel;
output [7:0] out;
reg [7:0] out;

always @(i0,i1,sel)
  case (sel)
    1'b0:out=i0;
    1'b1:out=i1;
    default:out=8'b0;
  endcase
endmodule
