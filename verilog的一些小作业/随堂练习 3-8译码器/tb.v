`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/12 18:18:53
// Design Name: 
// Module Name: tb
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


module tb();
reg[2:0] indata;
wire[7:0] outdata;
decoder38 uut(indata,outdata);
initial begin
indata=3'b000;
end
always #2 indata[0]=~indata[0];
always #3 indata[1]=~indata[1];
always #5 indata[2]=~indata[2];

endmodule
