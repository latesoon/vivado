`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 20:46:54
// Design Name: 
// Module Name: testbench2
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


module testbench2();
reg tempa,tempb,tempci;
wire tsum,tco;
fulladder myfu(tempa,tempb,tempci,tsum,tco);
initial begin
    tempa = 1'b0;
    tempb = 1'b0;
    tempci = 1'b0;
end
always #5 tempa = ~tempa;
always #3 tempb = ~tempb;
always #7 tempci = ~tempci;
endmodule
