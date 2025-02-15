`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/12 19:51:04
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
    input clk,
    input turn,
    input reset,
    output reg [7:0] seg,
    output reg [1:0] sel,
    output reg led=1'b0
);


reg [7:0] cnt = 8'd0;
reg p_turn;
wire turn_e = (~p_turn & turn);

reg [15:0] clk_div;
wire slow_clk = (clk_div == 16'd50000);

always @(posedge clk) begin
    
    if(reset) begin
        cnt<= 8'd0;
        led<= 1'b0;
    end

    clk_div <= clk_div + 1;
    if (clk_div >= 16'd50000)
        clk_div <= 0;

    p_turn <= turn;

    if (turn_e) begin
        if (cnt == 8'd59)begin
            cnt <= 8'd0;
            led <= 1'b1;
        end
        else begin
            cnt <= cnt + 1;
            led <= 1'b0;
        end
    end

    if (slow_clk) begin
        if (sel == 2'b01) begin // 显示个位
            sel <= 2'b10;
            case (cnt % 10)
                4'd0: seg <= 8'b0111_1110; // 0
                4'd1: seg <= 8'b0011_0000; // 1
                4'd2: seg <= 8'b0110_1101; // 2
                4'd3: seg <= 8'b0111_1001; // 3
                4'd4: seg <= 8'b0011_0011; // 4
                4'd5: seg <= 8'b0101_1011; // 5
                4'd6: seg <= 8'b0101_1111; // 6
                4'd7: seg <= 8'b0111_0000; // 7
                4'd8: seg <= 8'b0111_1111; // 8
                4'd9: seg <= 8'b0111_1011; // 9
                default: seg <= 8'b0100_1111; // E
            endcase
        end else begin // 显示十位
            sel <= 2'b01;
            case (cnt / 10)
                4'd0: seg <= 8'b0111_1110; // 0
                4'd1: seg <= 8'b0011_0000; // 1
                4'd2: seg <= 8'b0110_1101; // 2
                4'd3: seg <= 8'b0111_1001; // 3
                4'd4: seg <= 8'b0011_0011; // 4
                4'd5: seg <= 8'b0101_1011; // 5
                4'd6: seg <= 8'b0101_1111; // 6
                4'd7: seg <= 8'b0111_0000; // 7
                4'd8: seg <= 8'b0111_1111; // 8
                4'd9: seg <= 8'b0111_1011; // 9
                default: seg <= 8'b0100_1111; // E
            endcase
        end
    end
end

endmodule
