module RegisterFile(read1,read2,write,w_data,data1,data2,regWrite,clock,reset,regnum,regdata);
    input [4:0] read1,read2,write;
    input [31:0] w_data;
    input regWrite;
    input clock,reset;
    input [4:0]regnum;
    output [31:0] data1,data2;
    output [31:0]regdata;
    reg[31:0] register[31:0];
    
    assign data1=(reset)? 0:register[read1];
    assign data2=(reset)? 0:register[read2];
    assign regdata=(reset)? 0:register[regnum];
    always @(posedge clock or posedge reset) begin
        if (reset) begin
           register[0]=32'b0;
           register[1]=32'b0;
           register[2]=32'b0;
           register[3]=32'b0;
           register[4]=32'b0;
           register[5]=32'b0;
           register[6]=32'b0;
           register[7]=32'b0;
           register[8]=32'b0;
           register[9]=32'b0;
           register[10]=32'b0;
           register[11]=32'b0;
           register[12]=32'b0;
           register[13]=32'b0;
           register[14]=32'b0;
           register[15]=32'b0;
           register[16]=32'b0;
           register[17]=32'b0;
           register[18]=32'b0;
           register[19]=32'b0;
           register[20]=32'b0;
           register[21]=32'b0;
           register[22]=32'b0;
           register[23]=32'b0;
           register[24]=32'b0;
           register[25]=32'b0;
           register[26]=32'b0;
           register[27]=32'b0;
           register[28]=32'b0;
           register[29]=32'b0;
           register[30]=32'b0;
           register[31]=32'b0;
        end
        else if (regWrite && write!=0) register[write]=w_data;
    end
endmodule