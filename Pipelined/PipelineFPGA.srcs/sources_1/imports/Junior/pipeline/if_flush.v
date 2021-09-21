`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 11:23:15
// Design Name: If_flush
// Module Name: if_flush
// Project Name: project 2
// Target Devices: FPGA board
// Description: determine whether to flush if stage 
// 
// Dependencies: jump,beq,bne,equal
//////////////////////////////////////////////////////////////////////////////////


module if_flush(jump,beq,bne,equal,flush,branch,bubble,stall_finish,settle);
input jump,beq,bne,equal,bubble,settle;
output flush,branch,stall_finish;

reg flush,branch,stall_finish;

initial 
   begin 
      flush=0;
      branch=0;
      stall_finish=0;
   end

always @(jump,beq,bne,equal,bubble,settle)
begin
  case ({jump,beq,bne,equal,bubble})
    5'b10000:begin flush=1;branch=0;end
    5'b10010:begin flush=1;branch=0;end
    5'b01010:begin flush=1;branch=1;end
    5'b00100:begin flush=1;branch=1;end
    default:begin flush=0;branch=0;end
  endcase
end
endmodule
