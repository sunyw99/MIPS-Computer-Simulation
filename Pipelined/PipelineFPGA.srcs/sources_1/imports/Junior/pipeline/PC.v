`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 14:56:32
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Outputs the address of the PC
// 
// Dependencies: PCWrite, pc_prev
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(PCWrite, pc_prev, pc, clk);
    input PCWrite,clk;
    input [31:0] pc_prev;
    output reg [31:0] pc;
    
    initial 
      pc=32'b0;
    
    always @(posedge clk) begin
        if (PCWrite) 
            pc = pc_prev;

    end
endmodule