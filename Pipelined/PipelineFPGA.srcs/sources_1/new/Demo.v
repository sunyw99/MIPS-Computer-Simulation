`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 09:21:19
// Design Name: 
// Module Name: Demo
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


module Demo(clk,clk2, pc_switch,an, ca, register_sw);
input clk,clk2, pc_switch;
output [3:0] an;
output reg [6:0] ca;
wire clk1kHz;
reg [4:0] an1, an2, an3, an4;
reg [6:0] ca1, ca2, ca3, ca4;
wire [31:0] PC,REG;
input [4:0] register_sw;
top pipeline(clk2, PC, register_sw, REG);

clkdiv_1Hz clkdiv1k(clk,clk1kHz);
RingCounter count(an, clk1kHz);

 always@(*) begin
 if (pc_switch==1'b1) begin
 an1<=PC[3:0];
 an2<=PC[7:4];
 an3<=PC[11:8];
 an4<=PC[15:12];
 end
 else begin
 an1<=REG[3:0];
 an2<=REG[7:4];
 an3<=REG[11:8];
 an4<=REG[15:12];
 end
 end
 
 always@(an1) begin
 case (an1)
 4'b0000: ca1=7'b1000000;
 4'b0001: ca1=7'b1111001;
 4'b0010: ca1=7'b0100100;
 4'b0011: ca1=7'b0110000;
 4'b0100: ca1=7'b0011001;
 4'b0101: ca1=7'b0010010;
 4'b0110: ca1=7'b0000010;
 4'b0111: ca1=7'b1111000;
 4'b1000: ca1=7'b0000000;
 4'b1001: ca1=7'b0010000;
 4'b1010: ca1=7'b0001000;
 4'b1011: ca1=7'b0000011;
 4'b1100: ca1=7'b1000110;
 4'b1101: ca1=7'b0100001;
 4'b1110: ca1=7'b0000110;
 4'b1111: ca1=7'b0001110;
 default ca1=7'b0000000;
 endcase
 end
 
 always@(an2) begin
  case (an2)
  4'b0000: ca2=7'b1000000;
  4'b0001: ca2=7'b1111001;
  4'b0010: ca2=7'b0100100;
  4'b0011: ca2=7'b0110000;
  4'b0100: ca2=7'b0011001;
  4'b0101: ca2=7'b0010010;
  4'b0110: ca2=7'b0000010;
  4'b0111: ca2=7'b1111000;
  4'b1000: ca2=7'b0000000;
  4'b1001: ca2=7'b0010000;
  4'b1010: ca2=7'b0001000;
  4'b1011: ca2=7'b0000011;
  4'b1100: ca2=7'b1000110;
  4'b1101: ca2=7'b0100001;
  4'b1110: ca2=7'b0000110;
  4'b1111: ca2=7'b0001110;
  default ca2=7'b0000000;
  endcase
  end

always@(an3) begin
 case (an3)
 4'b0000: ca3=7'b1000000;
 4'b0001: ca3=7'b1111001;
 4'b0010: ca3=7'b0100100;
 4'b0011: ca3=7'b0110000;
 4'b0100: ca3=7'b0011001;
 4'b0101: ca3=7'b0010010;
 4'b0110: ca3=7'b0000010;
 4'b0111: ca3=7'b1111000;
 4'b1000: ca3=7'b0000000;
 4'b1001: ca3=7'b0010000;
 4'b1010: ca3=7'b0001000;
 4'b1011: ca3=7'b0000011;
 4'b1100: ca3=7'b1000110;
 4'b1101: ca3=7'b0100001;
 4'b1110: ca3=7'b0000110;
 4'b1111: ca3=7'b0001110;
 default ca3=7'b0000000;
 endcase
 end
  
always@(an4) begin
  case (an4)
  4'b0000: ca4=7'b1000000;
  4'b0001: ca4=7'b1111001;
  4'b0010: ca4=7'b0100100;
  4'b0011: ca4=7'b0110000;
  4'b0100: ca4=7'b0011001;
  4'b0101: ca4=7'b0010010;
  4'b0110: ca4=7'b0000010;
  4'b0111: ca4=7'b1111000;
  4'b1000: ca4=7'b0000000;
  4'b1001: ca4=7'b0010000;
  4'b1010: ca4=7'b0001000;
  4'b1011: ca4=7'b0000011;
  4'b1100: ca4=7'b1000110;
  4'b1101: ca4=7'b0100001;
  4'b1110: ca4=7'b0000110;
  4'b1111: ca4=7'b0001110;
  default ca4=7'b0000000;
  endcase
  end
 
 always@(an) begin
 case(an)
 4'b1110:ca=ca1;
 4'b1101:ca=ca2;
 4'b1011:ca=ca3;
 4'b0111:ca=ca4;
 endcase
 end
endmodule
