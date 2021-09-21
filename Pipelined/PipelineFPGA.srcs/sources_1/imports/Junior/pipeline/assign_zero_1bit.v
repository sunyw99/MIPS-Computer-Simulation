`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying 
// 
// Create Date: 2019/11/01 23:49:53
// Design Name:  
// Module Name: assign_zero_1bit
// Project Name: project 2
// Target Devices: FPGA board 
// Description: Assign initalized value to numbers
// 
// Dependencies: 
//////////////////////////////////////////////////////////////////////////////////


module assign_zero_1bit(data);
output data; 
reg data;

initial 
  data=0;
endmodule

module assign_one_1bit(data);
output data; 
reg data;

initial 
  data=1;
endmodule

module assign_zero_32bit(data);
output [31:0] data; 
reg [31:0] data;

initial 
  data=32'b0;
endmodule

module assign_one_32bit(data);
output [31:0] data; 
reg [31:0] data;

initial 
  data=32'b1;
endmodule
