module ALU(Result,Zero,A,B,ALUControl);
    input [31:0]A;
    input [31:0]B;
    input [3:0]ALUControl;
    output [31:0]Result;
    output Zero;
    reg [31:0]Result;
    wire Zero;
    
    always @(A,B,ALUControl) begin
        case(ALUControl)
            4'b0010: Result=A+B;
            4'b0110: Result=A-B;
            4'b0000: Result=A&B;
            4'b0001: Result=A|B;
            4'b0111: Result=A<B;
            default Result=32'b11111111111111111111111111111111;
        endcase
    end
    assign Zero=(Result==0);
endmodule