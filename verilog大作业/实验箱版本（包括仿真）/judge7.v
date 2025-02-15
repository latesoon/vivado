`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/13 13:57:32
// Design Name: 
// Module Name: judge7
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


module judge7(
    input clk,
    input [3:0] scorein,
    input submit,
    output reg [7:0] seg,
    output reg [1:0] sel
    );

reg submit_l;
wire submit_e = (submit_l & ~submit);

reg [3:0] judgenum = 4'd0;//裁判总数
reg [4:0] scoremax = 5'd0;//最高分
reg [4:0] scoremin = 5'd16;//最低分
reg [6:0] scoresum = 5'd0;//总分

reg [15:0] clk_div = 0;
wire slow_clk = (clk_div == 16'd50000);//分频器

wire [4:0] scoreavg = (judgenum >= 4'd3) ? ((scoresum - scoremax -scoremin )/( judgenum - 4'd2)):
                       (judgenum == 4'd0) ? 5'd0 :(scoresum /judgenum);
wire [3:0] ten = scoreavg / 4'd10;
wire [3:0] one = scoreavg % 4'd10;

always @(posedge clk) begin
    
    clk_div <= clk_div + 1;
    if (clk_div >= 16'd50000)
        clk_div <= 0;

    submit_l <= submit;

    if (submit_e) begin
        if (judgenum < 3'd7) begin
            judgenum <= judgenum + 1;
            scoresum <= scoresum + scorein;
            if (scoremax < scorein)
                scoremax <= scorein;
            if (scoremin > scorein)
                scoremin <= scorein;
        end
        else begin
            judgenum <= 4'd0;
            scoremax <= 5'd0;
            scoremin <= 5'd16;
            scoresum <= 5'd0;
        end
    end

    if (slow_clk) begin
        if (sel == 2'b01) begin //个位
            sel <= 2'b10;
            case (one)
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
        end else begin //十位
            sel <= 2'b01;
            case (ten)
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
