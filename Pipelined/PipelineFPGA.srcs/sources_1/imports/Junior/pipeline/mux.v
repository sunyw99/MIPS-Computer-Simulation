`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:Pan Qiying 
// 
// Create Date: 2019/10/31 23:59:28
// Design Name: 2_to_1 mux
// Module Name: mux
// Project Name: project 2
// Target Devices: FPGA Board
// Description: choose one from the two input
// 
// Dependencies: i0,i1,sel
//////////////////////////////////////////////////////////////////////////////////


module mux_2_1_32bit(out,i0,i1,sel);
  input sel;
  input [31:0] i0,i1;
  output [31:0] out; 
  reg [31:0] out;
  
  always @(i0,i1,sel)
  begin
    case (sel)
      1'b0:out=i0;
      1'b1:out=i1;
      default out=0;
    endcase
 end
endmodule

module mux_4_1_32bit(out,i0,i1,i2,i3,sel);
  input [31:0] i0,i1,i2,i3;
  input [1:0] sel;
  output [31:0] out;
  reg [31:0] out;
  
  always @(i0,i1,i2,sel,i3)
  begin 
    case (sel)
      2'b00:out=i0;
      2'b01:out=i1;
      2'b10:out=i2;
      2'b11:out=i3;
      default:out=0;
    endcase 
  end  
  
endmodule

module mux_2_1_5bit(out,i0,i1,sel);
  input sel;
  input [4:0] i0,i1;
  output [4:0] out; 
  reg [4:0] out;
  
  always @(i0,i1,sel)
  begin
    case (sel)
      1'b0:out=i0;
      1'b1:out=i1;
      default out=0;
    endcase
 end
endmodule