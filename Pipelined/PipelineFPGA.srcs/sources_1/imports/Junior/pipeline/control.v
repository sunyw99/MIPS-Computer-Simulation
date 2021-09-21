`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/10/31 21:31:09
// Design Name: control 
// Module Name: control
// Project Name: project 2
// Target Devices: FPGA board
// Description: Outputs the control signal for the following blocks. 
//              wb[1]:RegWrite wb[0]:MemtoReg
//              m[1]:MemRead m[0]:MemWrite
//              ex[3]:RegDst ex[2:1]:ALUop ex[0]:ALUSrc
// Dependencies: opcode

//////////////////////////////////////////////////////////////////////////////////


module control(opcode,wb,m,ex,jump,beq,bne,funct);
input [5:0] opcode,funct;
output jump,beq,bne;
output [1:0] wb,m;
output [3:0] ex;

reg jump,beq,bne;
reg [1:0] wb,m;
reg [3:0] ex;

initial begin 
wb=2'b00;m=2'b00;ex=4'b0100;jump=0;beq=0;bne=0;
end

always @(opcode,funct)begin 
   case (opcode)
      6'b100011:begin wb=2'b11;m=2'b10;ex=4'b0001;jump=0;beq=0;bne=0; end
      6'b101011:begin wb=2'b00;m=2'b01;ex=4'b0001;jump=0;beq=0;bne=0; end
      6'b001000:begin wb=2'b10;m=2'b00;ex=4'b0001;jump=0;beq=0;bne=0; end
      6'b001100:begin wb=2'b10;m=2'b00;ex=4'b0111;jump=0;beq=0;bne=0; end
      6'b000100:begin wb=2'b00;m=2'b00;ex=4'b0010;jump=0;beq=1;bne=0; end
      6'b000101:begin wb=2'b00;m=2'b00;ex=4'b0010;jump=0;beq=0;bne=1; end
      6'b000010:begin wb=2'b00;m=2'b00;ex=4'b0000;jump=1;beq=0;bne=0; end
      6'b000000:begin wb=2'b10;m=2'b00;ex=4'b1100;jump=0;beq=0;bne=0; end
      default: begin wb=2'b00;m=2'b00;ex=4'b0100;jump=0;beq=0;bne=0;end
   endcase
   if ({opcode,funct}==12'b0)
      begin wb=2'b00;m=2'b00;ex=4'b0100;jump=0;beq=0;bne=0;end
end
endmodule
