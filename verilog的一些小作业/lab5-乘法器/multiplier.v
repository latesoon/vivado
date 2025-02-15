`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 18:56:49
// Design Name: 
// Module Name: multiplier
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


module multiplier(
    input [31:0] ina,inb,
    output [63:0] ans
    );
    reg [63:0] out,a;
    reg [31:0] b;
    reg [5:0] i;
    assign ans = out;
    always@(ina or inb) begin
        out = 64'd0;
        a = {32'b0,ina};
        b = inb;
        i = 6'd32;
        while(i) begin
            if(b[0]) begin
                out = out + a;
            end
            a = (a << 1);
            b = (b >> 1);
            i = i - 1;
        end
    end
endmodule
