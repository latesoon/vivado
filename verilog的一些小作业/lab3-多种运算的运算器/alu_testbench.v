`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 16:59:50
// Design Name: 
// Module Name: alu_testbench
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


module alu_testbench();
reg [7:0] tina,tinb;
wire [7:0] tsumab;
wire tsumflag,tlessflag,tequalflag,tbitXorflag;
wire [15:0] tleftshiftA; 
multi_alu myalu(tina,tinb,tsumab,tsumflag,tleftshiftA,tlessflag,tequalflag,tbitXorflag);
initial begin
    tina = 8'b0;
    tinb = 8'b0;
end
always #5 tina=$random % 9'b1_0000_0000;
always #5 tinb=$random % 9'b1_0000_0000;
endmodule
