`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 20:50:15
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(MemtoRegMEM, RegWriteMEM, ReadDataMEM, ALUResultMEM, RegDstMEM, 
MemtoRegWB, RegWriteWB, ReadDataWB, ALUResultWB, RegDstWB,MemReadMem,MemReadWB,clk);
    input MemtoRegMEM, RegWriteMEM,MemReadMem,clk;
    input [31:0] ReadDataMEM, ALUResultMEM;
    input [4:0] RegDstMEM;
    output reg MemtoRegWB, RegWriteWB,MemReadWB;
    output reg [31:0] ReadDataWB, ALUResultWB;
    output reg [4:0] RegDstWB;
    
    initial begin
    MemtoRegWB<=1'b0;
    RegWriteWB<=1'b0;
    end
    
    always @(posedge clk) begin
        MemtoRegWB<=MemtoRegMEM;
        RegWriteWB<=RegWriteMEM;
        ReadDataWB<=ReadDataMEM;
        ALUResultWB<=ALUResultMEM;
        RegDstWB<=RegDstMEM;
        MemReadWB<=MemReadMem;
    end
endmodule
