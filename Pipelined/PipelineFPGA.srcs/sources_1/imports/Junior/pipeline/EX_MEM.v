`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 19:40:00
// Design Name: 
// Module Name: EX_MEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_MEM(MemReadEX, MemtoRegEX, MemWriteEX, RegWriteEX, ALUResultEX, 
MuxForwardEX, RegDstEX, MemReadMEM, MemtoRegMEM, MemWriteMEM, 
RegWriteMEM, ALUResultMEM, MuxForwardMEM, RegDstMEM,clk);
    input MemReadEX, MemtoRegEX, MemWriteEX, RegWriteEX,clk;
    input [31:0] ALUResultEX, MuxForwardEX;
    input [4:0] RegDstEX;
    output reg MemReadMEM, MemtoRegMEM, MemWriteMEM, RegWriteMEM;
    output reg [31:0] ALUResultMEM, MuxForwardMEM;
    output reg [4:0]RegDstMEM;
   
    initial begin
        MemReadMEM<=1'b0;
        MemtoRegMEM<=1'b0;
        MemWriteMEM<=1'b0;
        RegWriteMEM<=1'b0;
    end
    
    always @(posedge clk) begin
        MemReadMEM<=MemReadEX;
        MemtoRegMEM<=MemtoRegEX;
        MemWriteMEM<=MemWriteEX;
        RegWriteMEM<=RegWriteEX;
        ALUResultMEM<=ALUResultEX;
        MuxForwardMEM<=MuxForwardEX;
        RegDstMEM<=RegDstEX;
    end
endmodule
