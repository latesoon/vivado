`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 20:42:43
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input a,
    input b,
    input ci,
    output sum,
    output co
    );
    wire t1,t2,t3;
    halfadder h1(a,b,t1,t2);
    halfadder h2(t1,ci,sum,t3);
    assign co=t2^t3;
endmodule
