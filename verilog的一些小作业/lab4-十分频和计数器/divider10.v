`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 14:30:24
// Design Name: 
// Module Name: divider10
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


module divider10(
     input clk_in,
     input reset,
     output reg [3:0] count,
     output reg clk_out
    );
    always @(posedge clk_in) begin
        if (reset) begin
            count <= 4'd0;
            clk_out <= 1'b0;
        end else begin
            if (count == 4'd4 || count == 4'd9) begin
                clk_out <= ~clk_out;
            end
            count <= (count + 1'd1) % 4'd10 ;
        end
    end
endmodule
