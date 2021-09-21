module ControlUnit(opcode,RegDst,Jump,Branch,Branch_ne,MemRead,MemWrite,MemtoReg,ALUSrc,RegWrite);
    input [5:0]opcode;
    output RegDst,Jump,Branch,Branch_ne,MemRead,MemWrite,MemtoReg,ALUSrc,RegWrite;
    
    assign RegDst=(opcode==6'h00);
    assign Jump=(opcode==6'h02);
    assign Branch=(opcode==6'h04);
    assign Branch_ne=(opcode==6'h05);
    assign MemRead=(opcode==6'h23);
    assign MemWrite=(opcode==6'h2b);
    assign MemtoReg=(opcode==6'h23);
    assign ALUSrc=(opcode==6'h08||opcode==6'h0c||opcode==6'h23||opcode==6'h2b);
    assign RegWrite=(opcode==6'h00||opcode==6'h08||opcode==6'h0c||opcode==6'h23);
endmodule