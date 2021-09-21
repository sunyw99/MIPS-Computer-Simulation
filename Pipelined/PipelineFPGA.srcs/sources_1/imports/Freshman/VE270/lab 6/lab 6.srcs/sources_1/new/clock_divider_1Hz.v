`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 18:53:47
// Design Name: 
// Module Name: clock_divider_1Hz
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


module clkdiv_1Hz(clock,clkdiv);
input clock;
reg [31:0] count;  
output reg clkdiv;  
parameter C=32'd1000;
always @ (posedge clock)
begin
if (count == C - 1)
count <= 32'b0;
else
count <= count + 1;
end
always @ (posedge clock)
begin
if (count == C - 1)
clkdiv <= ~clkdiv;
else
clkdiv <= clkdiv;
end
endmodule
