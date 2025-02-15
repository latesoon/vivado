`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 20:50:06
// Design Name: 
// Module Name: _8bitadder
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


module _8bitadder(
    input [7:0] a,
    input [7:0] b,
    input ci,
    output [7:0] sum,
    output co
    );
    wire [6:0] temp;
    fulladder f1(a[0],b[0],ci,sum[0],temp[0]);
    fulladder f2(a[1],b[1],temp[0],sum[1],temp[1]);
    fulladder f3(a[2],b[2],temp[1],sum[2],temp[2]);
    fulladder f4(a[3],b[3],temp[2],sum[3],temp[3]);
    fulladder f5(a[4],b[4],temp[3],sum[4],temp[4]);
    fulladder f6(a[5],b[5],temp[4],sum[5],temp[5]);
    fulladder f7(a[6],b[6],temp[5],sum[6],temp[6]);
    fulladder f8(a[7],b[7],temp[6],sum[7],co);
endmodule
