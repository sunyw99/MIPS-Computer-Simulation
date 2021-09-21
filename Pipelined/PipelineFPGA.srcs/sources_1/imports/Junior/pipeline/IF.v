`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying 
// 
// Create Date: 2019/11/01 14:47:16
// Design Name: IF stage 
// Module Name: IF
// Project Name: project 2
// Target Devices: FPGA board 
// Tool Versions: 
// Description: operates if stage 
// 
// Dependencies: pc_in
// 
//////////////////////////////////////////////////////////////////////////////////


module IF(pc_in,pc_out,instruction_out, PC);

input [31:0] pc_in;
output [31:0] pc_out,instruction_out, PC;
reg [31:0] pc_out, PC;
initial begin
  pc_out=32'b0;
  end
InstructionMem im(pc_in,instruction_out);
always @(pc_in) begin
   pc_out=pc_in+32'b100;
   end


endmodule
