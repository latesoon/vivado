`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 19:07:55
// Design Name: 
// Module Name: tbmul
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


module tbmul();
reg [31:0] ta,tb;
wire [63:0] tans;
multiplier mymul(ta,tb,tans);
initial begin
    ta = 32'b0;
    tb = 32'b0;
end
always #5 ta = $random;
always #5 tb = $random;
endmodule
