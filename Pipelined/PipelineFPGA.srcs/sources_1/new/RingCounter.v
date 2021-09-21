`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 11:09:34
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(an, clk1kHz);
output reg [3:0] an = 4'b0111;
input clk1kHz;
always@(posedge clk1kHz) begin
begin if (an==4'b0111) an<=4'b1011;
else if (an==4'b1011) an<=4'b1101;
else if (an==4'b1101) an<=4'b1110;
else if (an==4'b1110) an<=4'b0111;
else an<=4'b0111;
end
end
endmodule
