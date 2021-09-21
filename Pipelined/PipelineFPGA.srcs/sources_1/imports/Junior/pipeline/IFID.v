`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/10/31 21:00:27
// Design Name: IFID pipeline register
// Module Name: IFID
// Project Name: project 2
// Target Devices: FPGA board
// Description: This register serves as a pipeline register from IF stage to ID 
//              stage. 
// Dependencies: flush, write, clock, PC, instruction
// 
//////////////////////////////////////////////////////////////////////////////////


module IFID(write, flush, PC, instruction, PC_out, instruction_out,clk);
  input write, flush,clk; 
  input [31:0] PC,instruction; 
  output [31:0] PC_out,instruction_out;
  reg [31:0] PC_out,instruction_out;
  
  initial
  begin 
    PC_out=32'b0;
    instruction_out=32'b0;
  end
  
  always @(posedge clk) begin
    if ({flush,write}==2'b11)
       instruction_out=32'b0;
    else if ({flush,write}==2'b01)
       instruction_out=instruction;
    if (write==1)
       PC_out=PC;
  end
endmodule
