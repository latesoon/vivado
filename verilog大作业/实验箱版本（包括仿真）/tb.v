`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/13 15:16:09
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
reg clk;
reg [3:0] scorein;
reg submit;
wire [7:0] seg;
wire [1:0] sel;
judge7 uut(clk,scorein,submit,seg,sel);
initial begin
    clk = 1'd0;
    scorein = 4'd0;
    submit = 1'd0;
end
always #1 clk = ~clk;
always #500000 begin
    scorein = $random % 4'd15 + 1;
    submit = 1'd1;
    #3
    submit = 1'd0;
end
endmodule
