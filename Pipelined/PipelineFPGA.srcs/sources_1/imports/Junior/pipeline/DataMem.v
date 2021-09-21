`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 16:59:23
// Design Name: 
// Module Name: DataMem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Writes data or reads data based on the control input
// 
// Dependencies: MemWrite, MemRead, WriteData, ALU_address
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// DataMem dm(memwrite,memread,write_data,addr,memout_mem);
//////////////////////////////////////////////////////////////////////////////////


module DataMem(MemWrite, MemRead, WriteData, ALU_address, ReadData, clk);
    input MemWrite, MemRead, clk;
    input [31:0] WriteData, ALU_address;
    output [31:0] ReadData;
    reg [31:0] DataMemory [31:0];
    wire [31:0] i;
    assign i = ALU_address >> 2;
    initial begin 
       DataMemory[0]=32'b0;
       DataMemory[1]=32'b0;
       DataMemory[2]=32'b0;
       DataMemory[3]=32'b0;
       DataMemory[4]=32'b0;
       DataMemory[5]=32'b0;
       DataMemory[6]=32'b0;
       DataMemory[7]=32'b0;
       DataMemory[8]=32'b0;
       DataMemory[9]=32'b0;
       DataMemory[10]=32'b0;
       DataMemory[11]=32'b0;
       DataMemory[12]=32'b0;
       DataMemory[13]=32'b0;
       DataMemory[14]=32'b0;
       DataMemory[15]=32'b0;
       DataMemory[16]=32'b0;
       DataMemory[17]=32'b0;
       DataMemory[18]=32'b0;
       DataMemory[19]=32'b0;
       DataMemory[20]=32'b0;
       DataMemory[21]=32'b0;
       DataMemory[22]=32'b0;
       DataMemory[23]=32'b0;
       DataMemory[24]=32'b0;
       DataMemory[25]=32'b0;
       DataMemory[26]=32'b0;
       DataMemory[27]=32'b0;
       DataMemory[28]=32'b0;
       DataMemory[29]=32'b0;
       DataMemory[30]=32'b0;
       DataMemory[31]=32'b0;
    end

    always@(posedge clk) begin
        if (MemWrite==1'b1) DataMemory[i] = WriteData;
        else DataMemory[i] = DataMemory[i];
    end
    assign ReadData = (MemRead==1'b1)? DataMemory[i]:32'b0;
endmodule
