module ALU_Control(ALUControl,opcode,funct);
    input [5:0]opcode;
    input [5:0]funct;
    output [3:0]ALUControl;
    reg [3:0]ALUControl;
    
    always @(funct,opcode) begin
        case(opcode)
            6'h2b: ALUControl<=4'b0010;  //sw
            6'h23: ALUControl<=4'b0010;  //lw
            6'h04: ALUControl<=4'b0110;  //beq
            6'h05: ALUControl<=4'b0110;  //bne
            6'h08: ALUControl<=4'b0010;  //addi
            6'h0c: ALUControl<=4'b0000;  //andi
            6'h00: 
                case(funct)
                    6'h20: ALUControl=4'b0010;  //add
                    6'h22: ALUControl=4'b0110;  //sub
                    6'h24: ALUControl=4'b0000;  //and
                    6'h25: ALUControl=4'b0001;  //or
                    6'h2a: ALUControl=4'b0111;  //slt
                    default ALUControl=4'b0010;
                endcase
            default ALUControl=4'b0010;
        endcase
    end
endmodule