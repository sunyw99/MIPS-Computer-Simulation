`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/05 10:08:12
// Design Name: 
// Module Name: sim
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


module sim;
  parameter half_period=50;
  reg clock;
  top UUT(clock);
  
  initial begin 
    $display("==============================");
  end
  
  initial begin 
    #0 clock=0;
  end
  
  always #half_period clock=~clock;
  
  initial 
    #9200 $stop;
endmodule
