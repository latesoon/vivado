`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 14:45:41
// Design Name: 
// Module Name: tb12012
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


module tb12012();
reg tclkin,treset;
wire tclkout;
wire [3:0] tcnt;
divider10 mydiv(tclkin,treset,tcnt,tclkout);
initial begin
    tclkin = 1'b0;
    treset = 1'b1;
    #2;
    treset = 1'b0;
end
always #1 tclkin = ~tclkin;
always #37 treset = ~treset;
endmodule
