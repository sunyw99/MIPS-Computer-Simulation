module SingleCycle(clock,reset);
    input clock,reset;
    reg [31:0]PC;
    wire [31:0]PC_next;
    wire [31:0]PC_normal;
    wire [31:0]PC_temp;
    wire [31:0]PC_jump;
    wire [31:0]PC_branch;
    wire [31:0]instruction;
    wire [4:0]write_register;
    wire RegDst;
    wire [4:0]ins25_21;
    wire [4:0]ins20_16;
    wire [4:0]ins15_11;
    wire [31:0]write_data;
    wire [31:0]read_data1;
    wire [31:0]read_data2;
    wire RegWrite;
    wire [5:0]opcode,funct;
    wire [15:0]imm;
    wire [3:0]ALUControl;
    wire [31:0]ALU_in2;
    wire [31:0]ALU_out;
    wire Zero;
    wire ALUSrc;
    wire MemWrite;
    wire MemRead;
    wire [31:0]DataMem_ReadData;
    wire MemtoReg;
    wire [31:0]DM_out;
    wire [31:0]RA;
    wire Branch;
    wire Branch_ne;
    wire Jump;
    
    //PC generation
    always @(posedge reset or posedge clock) begin
        if (reset) PC=-4;
        else if (PC==-4) PC=0;
        else if (PC_next<168) PC=PC_next;
    end
    //Instruction Fetch
    InstructionMem M1 (instruction, PC, reset);
    //Instruction Decode and Register Read/Write
    assign ins25_21=instruction[25:21];
    assign ins20_16=instruction[20:16];
    assign ins15_11=instruction[15:11];
    assign write_register=(RegDst)? ins15_11:ins20_16;
    RegisterFile M2 (ins25_21,ins20_16,write_register,write_data,read_data1,read_data2,RegWrite,clock,reset,regnum,regdata);
    //Instruction Decode and Execution
    assign opcode=instruction[31:26];
    assign funct=instruction[5:0];
    assign imm=instruction[15:0];
    ALU_Control M3 (ALUControl,opcode,funct);
    assign ALU_in2=(ALUSrc)? imm:read_data2;
    ALU M4 (ALU_out,Zero,read_data1,ALU_in2,ALUControl);
    //Access Memory Operand
    DataMem M5 (MemWrite,MemRead,read_data2,ALU_out,DataMem_ReadData,reset,clock);
    assign DM_out=(MemtoReg)? DataMem_ReadData:ALU_out;
    assign write_data=DM_out;
    //PC selection
    assign PC_normal=PC+4;
    assign PC_jump={PC_normal[31:28],instruction[25:0],2'b00};
    assign RA={{16{instruction[15]}},instruction[15:0]};
    assign PC_branch=PC_normal+(RA<<2);
    assign PC_temp=((Branch_ne&&(~Zero))||(Branch&&Zero))? PC_branch:PC_normal;
    assign PC_next=(Jump)? PC_jump:PC_temp;
    //Control Unit
    ControlUnit M7 (opcode,RegDst,Jump,Branch,Branch_ne,MemRead,MemWrite,MemtoReg,ALUSrc,RegWrite);
endmodule