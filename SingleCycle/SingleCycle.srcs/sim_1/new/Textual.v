//include "EX.v";
module TestBenchSingle;
reg clk;
reg reset;
reg [6:0]clk_count;
SingleCycle UUT (clk,reset);

initial begin
#0  $display("==============================================================");
#0	clk = 0; reset=1; clk_count=7'b01;
#2  reset=0;
 	$dumpfile("TestBenchSingle.vcd");
	$dumpvars(0, TestBenchSingle);
#500  $display("=============================================================="); 
$finish;
end

always begin
    #10 clk_count<=clk_count+1;
end

always begin
    #5 clk<=~clk;
end

always begin
	#10
	$display("Time: %t, CLK = %d, PC = 0x%h", $time, clk_count, UUT.PC);
        $display("[$s0] = 0x%h, [$s1] = 0x%h, [$s2] = 0x%h", UUT.M2.register[16],UUT.M2.register[17],UUT.M2.register[18]);
    	$display("[$s3] = 0x%h, [$s4] = 0x%h, [$s5] = 0x%h", UUT.M2.register[19],UUT.M2.register[20],UUT.M2.register[21]);
    	$display("[$s6] = 0x%h, [$s7] = 0x%h, [$t0] = 0x%h", UUT.M2.register[22],UUT.M2.register[23],UUT.M2.register[8]);
    	$display("[$t1] = 0x%h, [$t2] = 0x%h, [$t3] = 0x%h", UUT.M2.register[9],UUT.M2.register[10],UUT.M2.register[11]);
    	$display("[$t4] = 0x%h, [$t5] = 0x%h, [$t6] = 0x%h", UUT.M2.register[12],UUT.M2.register[13],UUT.M2.register[14]);
    	$display("[$t7] = 0x%h, [$t8] = 0x%h, [$t9] = 0x%h", UUT.M2.register[15],UUT.M2.register[24],UUT.M2.register[25]);
	end 
endmodule