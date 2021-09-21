 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 10:58:54
// Design Name: ID stage and WB stage 
// Module Name: idwb
// Project Name: project 2
// Target Devices: FPGA board
// Description: Realize the id stage and wb stage 
// 
// Dependencies: pc_in,instruction,mem_out,alu_out,w_addr,regwrite,bubble,mem_to_reg

//////////////////////////////////////////////////////////////////////////////////


module idwb(pc_in,instruction,branch,jadd,mem_out,alu_out,regwrite,wb,ex,mem,
data1,data2,imme,rd,rt1,rt2,rs,jump,beq,bne,pc_out,mem_to_reg,w_addr,compare,
fa,fb,aluout_mem,clk,registersel, FPGAout);
input [31:0] pc_in,instruction,mem_out,alu_out,aluout_mem;
input [1:0] fa,fb;
input regwrite,mem_to_reg,clk;
input [4:0] w_addr, registersel;
output [1:0] wb,mem;
output [3:0] ex;
output [31:0] data1,data2,branch,pc_out,imme,jadd, FPGAout;
output [4:0] rd,rt1,rt2,rs;
output jump,beq,bne,compare;

wire [31:0] imme_mul_4,write,d1,d2;

reg [4:0] rd,rt1,rt2,rs;
reg [31:0] pc_out,jadd;

initial begin 
  pc_out=32'b0;
  jadd=32'b0;
  rd=5'b0;
  rt1=5'b0;
  rt2=5'b0;
  rs=5'b0;
end

control c(instruction[31:26],wb,mem,ex,jump,beq,bne,instruction[5:0]);
signextension s(instruction[15:0],imme);
shift2 sh(imme,imme_mul_4);
adder a(imme_mul_4,pc_in,branch);
mux_2_1_32bit m1(write,alu_out,mem_out,mem_to_reg);
register r(instruction[25:21],instruction[20:16],w_addr,write,d1,d2,regwrite,clk,registersel, FPGAout);
mux_4_1_32bit m2(data1,d1,alu_out,aluout_mem,mem_out,fa);
mux_4_1_32bit m3(data2,d2,alu_out,aluout_mem,mem_out,fb);
equal eq(data1,data2,compare);



always @(pc_in,imme)
begin 
  pc_out=pc_in;
  jadd={pc_in[31:28],instruction[25:0],2'b0};
  rd=instruction[15:11];
  rt1=instruction[20:16];
  rt2=instruction[20:16];
  rs=instruction[25:21];
end

endmodule
