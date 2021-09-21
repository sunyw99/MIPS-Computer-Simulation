module ID_EX_register(EX_out,MEM_out,WB_out,
regdata1_out,regdata2_out,imm_out,rs_out,rt1_out,rd_out,
EX_in,MEM_in,WB_in,regdata1_in,rt2_out,
regdata2_in,imm_in,rs_in,rt1_in,rd_in,rt2_in,clk,bubble);
    input [1:0]WB_in,MEM_in;
    input [3:0]EX_in;
    input clk,bubble;
    input [31:0]regdata1_in,regdata2_in,imm_in;
    input [4:0]rs_in,rt1_in,rd_in,rt2_in;
    output [1:0]WB_out,MEM_out;
    output [3:0]EX_out;
    output [31:0]regdata1_out,regdata2_out,imm_out;
    output [4:0]rs_out,rt1_out,rd_out,rt2_out;
    reg [1:0]WB_out,MEM_out;
    reg [3:0]EX_out;
    reg [31:0]regdata1_out,regdata2_out,imm_out;
    reg [4:0]rs_out,rt1_out,rd_out,rt2_out;
    reg [133:0]ID_EX;
    
    initial begin 
       WB_out=2'b0;
       MEM_out=2'b0;
       EX_out=4'b0;
       regdata1_out=32'b0;
       regdata2_out=32'b0;
       imm_out=32'b0;
       rs_out=5'b0;
       rt1_out=5'b0;
       rd_out=5'b0;
       rt2_out=5'b0;
       ID_EX=134'b0;
    end
    
    always @(posedge clk)begin
        if (!bubble) begin 
            ID_EX[133:132]=WB_in;
            ID_EX[130:127]=EX_in;
            ID_EX[126:125]=MEM_in;
        end else begin 
            ID_EX[133:132]=2'b0;
            ID_EX[130:127]=4'b0;
            ID_EX[126:125]=2'b0;
        end
            ID_EX[122:118]=rt2_in;
            ID_EX[110:79]=regdata1_in;
            ID_EX[78:47]=regdata2_in;
            ID_EX[46:15]=imm_in;
            ID_EX[14:10]=rs_in;
            ID_EX[9:5]=rt1_in;
            ID_EX[4:0]=rd_in;
        WB_out=ID_EX[133:132];
        EX_out=ID_EX[130:127];
        MEM_out=ID_EX[126:125];
        rt2_out=ID_EX[122:118];
        regdata1_out=ID_EX[110:79];
        regdata2_out=ID_EX[78:47];
        imm_out=ID_EX[46:15];
        rs_out=ID_EX[14:10];
        rt1_out=ID_EX[9:5];
        rd_out=ID_EX[4:0];
    end
endmodule