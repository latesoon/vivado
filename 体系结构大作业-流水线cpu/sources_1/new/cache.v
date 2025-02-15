`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/24 13:26:43
// Design Name: 
// Module Name: cache
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


module cache(
    input [31:0]addr,
    input wen,
    //input ren,
    input [31:0] w_data,
    //output reg hit,
    output now_valid,
    output [24:0] now_label,
    output [31:0] r_data
    );

reg [57:0] cacheline [31:0];//[57] valid,[56:32]addr,[31:0] data

integer i;
initial begin
    for (i = 0; i < 32; i = i + 1) begin
        cacheline[i] = 57'b0;
    end
    //hit = 1'b0;
end

wire [4:0] now_line;
wire [24:0] write_label;
//wire [24:0] now_label;
//wire now_valid;
//wire [31:0] now_data;
assign now_line = addr[6:2];
assign now_valid = cacheline[now_line][57];
assign write_label = addr[31:7];
assign now_label = cacheline[now_line][56:32];
assign r_data = cacheline[now_line][31:0];
//assign hit = ren & now_valid & (write_label == now_label);
always @(*) begin
    if(wen) begin
        cacheline[now_line] ={1'b1,write_label,w_data};
    end
    //hit = ren & now_valid & (write_label == now_label);
end

endmodule
