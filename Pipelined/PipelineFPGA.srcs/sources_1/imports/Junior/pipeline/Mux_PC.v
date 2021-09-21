`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 10:49:18
// Design Name: 
// Module Name: Mux_PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Outputs the next PC address based on the input controls
// 
// Dependencies: Branch, Jump, pc_next, BrAdd, JAdd
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_PC(Branch, Jump, pc_next, BrAdd, JAdd, out);
    input Branch, Jump;
    input [31:0] pc_next, BrAdd, JAdd;
    output reg [31:0] out;
    
    
    always @(Branch, Jump, pc_next) begin
        if (Branch)
            out <= BrAdd;
        else if (Jump)
            out <= JAdd;
        else
            out <= pc_next;
    end 
endmodule
