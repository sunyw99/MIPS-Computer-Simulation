
module ALU(Result,A,B,ALUControl);
    parameter n=32;
    input [n-1:0]A;
    input [n-1:0]B;
    input [3:0]ALUControl;
    output [n-1:0]Result;
    reg [n-1:0]Result;
    
    initial begin 
       Result=32'b0;
    end
    
    always @(A,B,ALUControl) begin
        case(ALUControl)
            4'b0010: Result=A+B;
            4'b0110: Result=A+(~B)+32'b1;
            4'b0000: Result=A&B;
            4'b0001: Result=A|B;
            4'b0111: Result=(A+(~B)+32'b1)>>31;
            default Result=32'b0;
        endcase
    end
    
endmodule


module ALU_Control(ALUControl,ALUop,funct);
    input [1:0]ALUop;
    input [5:0]funct;
    output [3:0]ALUControl;
    reg [3:0]ALUControl;
    
    initial begin 
      ALUControl=4'b0;
    end
    
    always @(funct,ALUop) begin
        case(ALUop)
            2'b00: ALUControl=4'b0010;
            2'b01: ALUControl=4'b0110;  
            2'b11: ALUControl=4'b0000;  //andi
            2'b10:
                case(funct)
                    6'b100000: ALUControl=4'b0010;  //add
                    6'b100010: ALUControl=4'b0110;  //sub
                    6'b100100: ALUControl=4'b0000;  //and
                    6'b100101: ALUControl=4'b0001;  //or
                    6'b101010: ALUControl=4'b0111;  //slt
                    default: ALUControl=4'b1111;
                endcase
        endcase
    end
endmodule

module EX(data1,data2,aluout_wb,aluout_mem,memout_wb,fa,fb,aluout,imme,
ex,data2_out,rd_in,rt_in,rd);
input [31:0] data1,data2,aluout_wb,aluout_mem,memout_wb;
input [1:0] fa,fb;
input [31:0] imme;
input [4:0] rd_in,rt_in;
input [3:0] ex;
output [31:0] aluout,data2_out;
output [4:0] rd;

wire [31:0] alu1,alu2;
wire [3:0] aluc;


mux_2_1_5bit m5(rd,rt_in,rd_in,ex[3]);
ALU_Control a2(aluc,ex[2:1],imme[5:0]);
mux_4_1_32bit m6(alu1,data1,aluout_wb,aluout_mem,memout_wb,fa);
mux_4_1_32bit m7(data2_out,data2,aluout_wb,aluout_mem,memout_wb,fb);
mux_2_1_32bit m8(alu2,data2_out,imme,ex[0]);
ALU a3(aluout,alu1,alu2,aluc);
 
endmodule 