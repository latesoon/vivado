`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 13:34:26
// Design Name: 
// Module Name: tb1201
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


module tb1201();
reg [31:0]tnum;
wire [5:0] tcnt0,tcnt1;
count mycnt(tnum,tcnt0,tcnt1);
initial begin
    tnum = 32'b0;
end
always #5 tnum=$random;
endmodule
