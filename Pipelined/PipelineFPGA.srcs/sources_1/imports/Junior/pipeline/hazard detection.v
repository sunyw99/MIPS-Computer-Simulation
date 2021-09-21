`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pan Qiying
// 
// Create Date: 2019/11/01 00:24:32
// Design Name: Hazard detection
// Module Name: hazard
// Project Name: project 2
// Target Devices: FPGA board
// Description: detect hazard
// 
// Dependencies: memread,idexrt,ifidrt,ifidrd
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hazard(ifidwrite,stall,memread,idexrt,ifidrt,ifidrd,pcwrite,bne,beq,idexrd,
ifidrs,idexregwrite,settle,stall_finish,exmemrt,exmemread,exmemregwrite);
input memread,bne,beq,idexregwrite,stall_finish,exmemread,exmemregwrite;
input [4:0] idexrt,ifidrt,ifidrd,idexrd,ifidrs,exmemrt;
output ifidwrite,stall,pcwrite,settle;

reg ifidwrite,stall,pcwrite,stall2,settle;

initial 
begin 
  ifidwrite=1;
  stall=0;
  pcwrite=1;
  stall2=0;
  settle=0;
end
always @(memread,idexrt,ifidrt,ifidrd,bne,beq,idexrd,idexregwrite,ifidrs,stall_finish,exmemrt,exmemread,exmemregwrite)
begin
 
     stall=0;
     stall2=0;

  stall=stall || (memread &&(idexrt!=5'b0) &&((idexrt==ifidrt)||(idexrt==ifidrs))&&idexregwrite);
  stall=stall || (exmemread && (exmemrt!=5'b0) && ((exmemrt==ifidrt)||(exmemrt==ifidrs))&&(bne||beq)&&exmemregwrite);
  stall=stall || ((idexrd!=5'b0)&&((idexrd==ifidrs)||(idexrd==ifidrt))&&(beq||bne)&&idexregwrite);
  ifidwrite=!stall;
  pcwrite=!stall; 

end
endmodule
