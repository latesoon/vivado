`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 02:03:09
// Design Name: 
// Module Name: testbench3
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


module testbench3();
reg [7:0] tempa,tempb;
reg tempci;
wire [7:0]tsum;
wire tco;
_8bitadder my8bit(tempa,tempb,tempci,tsum,tco);
initial begin
    tempa = 8'b0;
    tempb = 8'b0;
    tempci = 1'b0;
end
always #5 tempa=$random % 9'b1_0000_0000;
always #5 tempb=$random % 9'b1_0000_0000;
always #5 tempci=~tempci;
endmodule
