`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 11:23:38
// Design Name: 
// Module Name: count
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


module count(
    input [31:0] innum,
    output [5:0] cnt0,
    output [5:0] cnt1
    );
    reg [5:0] c1,i;
    always @(*) 
    begin
        c1 = 0;
        for (i = 0; i < 32; i = i + 1) 
        begin
            if (innum[i] == 1'b1)
                c1 = c1 + 1;
            end
    end
    assign cnt0 = 6'd32 - c1;
    assign cnt1 = c1; 
endmodule
