`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/10/31 22:47:04
// Design Name: register
// Module Name: register
// Project Name: project 2
// Target Devices: FPGA board
// Description: Read data from and write data to the register 
// 
// Dependencies: read1,read2,write,w_data,regWrite
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register(read1,read2,write,w_data,data1,data2,regWrite,clk,registersel, FPGAout);
input [4:0] read1,read2,write, registersel;
input [31:0] w_data;
input regWrite,clk;
output [31:0] data1,data2,FPGAout;
reg[31:0] data1,data2;
reg[31:0] register[31:0], FPGAout;
initial 
begin 
       register[0]=32'b0;
       register[1]=32'b0;
       register[2]=32'b0;
       register[3]=32'b0;
       register[4]=32'b0;
       register[5]=32'b0;
       register[6]=32'b0;
       register[7]=32'b0;
       register[8]=32'b0;
       register[9]=32'b0;
       register[10]=32'b0;
       register[11]=32'b0;
       register[12]=32'b0;
       register[13]=32'b0;
       register[14]=32'b0;
       register[15]=32'b0;
       register[16]=32'b0;
       register[17]=32'b0;
       register[18]=32'b0;
       register[19]=32'b0;
       register[20]=32'b0;
       register[21]=32'b0;
       register[22]=32'b0;
       register[23]=32'b0;
       register[24]=32'b0;
       register[25]=32'b0;
       register[26]=32'b0;
       register[27]=32'b0;
       register[28]=32'b0;
       register[29]=32'b0;
       register[30]=32'b0;
       register[31]=32'b0;
end

always @(read1,read2,write,w_data,regWrite)
begin
  data1=register[read1];
  data2=register[read2];
end
always@(*) begin
FPGAout=register[registersel];
end

always@(negedge clk)
begin
  if (regWrite==1)
  register[write]=w_data;
end

always @(posedge clk)
begin 
  $display("[$s0]=%h,[$s1]=%h,[$s2]=%h",register[16],register[17],register[18]);
  $display("[$s3]=%h,[$s4]=%h,[$s5]=%h",register[19],register[20],register[21]);
  $display("[$s6]=%h,[$s7]=%h,[$t0]=%h",register[22],register[23],register[8]);
  $display("[$t1]=%h,[$t2]=%h,[$t3]=%h",register[9],register[10],register[11]);
  $display("[$t4]=%h,[$t5]=%h,[$t6]=%h",register[12],register[13],register[14]);
  $display("[$t7]=%h,[$t8]=%h,[$t9]=%h",register[15],register[24],register[25]);
end
endmodule
