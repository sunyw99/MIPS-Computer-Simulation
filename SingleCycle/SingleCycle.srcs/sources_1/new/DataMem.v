module DataMem(MemWrite,MemRead,WriteData,ALU_address,ReadData,reset,clock);
    input MemWrite, MemRead;
    input [31:0] WriteData, ALU_address;
    input clock,reset;
    output [31:0] ReadData;
    reg [31:0] DataMemory [0:31];
    
    assign ReadData=(reset|~MemRead)? 0:DataMemory[ALU_address>>2];
    always @(negedge clock or posedge reset) begin
        if (reset) begin 
            for (integer i=0; i<32; i=i+1) DataMemory[i] = 32'b0;
        end
        else if (MemWrite) DataMemory[ALU_address>>2] = WriteData;
    end
endmodule