`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 19:29:06
// Design Name: 
// Module Name: SSD
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


module SSD(in, C);
input [3:0] in;
output [6:0] C;
reg [6:0]C;
always @ (in) begin
case (in)
4'b0000: C=7'b1000000;
4'b0001: C=7'b1111001;
4'b0010: C=7'b0100100;
4'b0011: C=7'b0110000;
4'b0100: C=7'b0011001;
4'b0101: C=7'b0010010;
4'b0110: C=7'b0000010;
4'b0111: C=7'b1111000;
4'b1000: C=7'b0000000;
4'b1001: C=7'b0010000;
4'b1010: C=7'b0001000;
4'b1011: C=7'b0000011;
4'b1100: C=7'b1000110;
4'b1101: C=7'b0100001;
4'b1110: C=7'b0000100;
4'b1111: C=7'b0001110;
default C=7'b0000000;
endcase;
end;

endmodule
