`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/10/31 22:38:11
// Design Name: sign extension
// Module Name: signextension
// Project Name: project 2
// Target Devices: FPGA borad
// Description: Sign extended the input to 32-bit number. 
// 
// Dependencies: imme[15:0]
//////////////////////////////////////////////////////////////////////////////////


module signextension(imme,imme_out);
input [15:0] imme;
output [31:0] imme_out;

reg [31:0] imme_out;
initial begin 
  imme_out=32'b0;
end
always @(imme)
  imme_out={{16{imme[15]}},imme[15:0]};
endmodule
