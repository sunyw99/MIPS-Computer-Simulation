`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 22:14:38
// Design Name: 
// Module Name: forward
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


module forward(memwb_write,memwb_rd,idex_rs,idex_rt,exmem_write,exmem_rd,fa,fb,
memwb_memread);
input memwb_write,exmem_write,memwb_memread;
input [4:0] memwb_rd,idex_rs,idex_rt,exmem_rd;
output [1:0] fa,fb;
reg [1:0] fa,fb;

initial begin 
 fa=2'b00;
 fb=2'b00;
end

always @(memwb_write,memwb_rd,idex_rs,idex_rt,exmem_write,exmem_rd,memwb_memread)begin 
   fa=2'b00;
   fb=2'b00;
   if (exmem_rd!=5'b0)
     if ({exmem_write,exmem_rd}=={1'b1,idex_rs})
       fa=2'b10;
   if (fa!=2'b10)
     if (memwb_rd!=5'b0)
       if ({memwb_write,memwb_rd}=={1 'b1,idex_rs})
        if (memwb_memread==0)
         fa=2'b01;
        else 
         fa=2'b11;
   if (exmem_rd!=5'b0)
       if ({exmem_write,exmem_rd}=={1'b1,idex_rt})
          fb=2'b10;
   if (fb!=2'b10)
      if (memwb_rd!=5'b0)
        if ({memwb_write,memwb_rd}=={1'b1,idex_rt})
         if (memwb_memread==0)
           fb=2'b01;
         else
           fb=2'b11;
end
endmodule

module forward_compare(memwb_write,memwb_rd,id_rt,id_rs,exmem_write,exmem_rd,fa,fb,
memwb_memread,beq,bne);
input memwb_write,exmem_write,memwb_memread,beq,bne;
input [4:0] memwb_rd,id_rt,id_rs,exmem_rd;
output [1:0] fa,fb;
reg [1:0] fa,fb;
reg branch;
initial begin
  fa=2'b00;
  fb=2'b00;
end

always @(memwb_write,exmem_write,memwb_rd,id_rt,id_rs,exmem_rd,memwb_memread,beq,bne)
begin 
  fa=2'b00;
  fb=2'b00;
  branch=beq||bne;
  if (exmem_rd!=5'b0)
     if ({exmem_write,exmem_rd,branch}=={1'b1,id_rs,1'b1})
        fa=2'b10;
  if (fa!=2'b10)
     if (memwb_rd!=5'b0)
        if ({memwb_write,memwb_rd,branch}=={1'b1,id_rs,1'b1})
          if (memwb_memread!=1)
            fa=2'b01;
          else 
            fa=2'b11;
   if (exmem_rd!=5'b0)
      if ({exmem_write,exmem_rd,branch}=={1'b1,id_rt,1'b1})
                    fb=2'b10 ;
   if (fb!=2'b10)
       if (memwb_rd!=5'b0)
           if ({memwb_write,memwb_rd,branch}=={1'b1,id_rt,1'b1})
             if (memwb_memread!=1)
                 fb=2'b01;
             else
                 fb=2'b11;
end
endmodule