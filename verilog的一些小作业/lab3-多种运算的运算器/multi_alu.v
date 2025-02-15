`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 16:50:24
// Design Name: 
// Module Name: multi_alu
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

module multi_alu(
    input [7:0] ina,
    input [7:0] inb,
    output [7:0] sumab,
    output sumflag,
    output [15:0] leftshiftA,
    output lessflag,
    output equalflag,
    output bitXorflag
);
_8bitadder my8bitadder(ina,inb,0,sumab,sumflag);
assign leftshiftA = ina << (inb % 4'd9);
assign lessflag = ina < inb;
assign equalflag = ina == inb;
assign bitXorflag = ^ina;
endmodule

