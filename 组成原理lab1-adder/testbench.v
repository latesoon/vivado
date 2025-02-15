`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/21 23:28:13
// Design Name: 
// Module Name: testbench
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


module testbench;

    // Inputs
    reg [63:0] operand1;
    reg [63:0] operand2;
    reg cin;

    // Outputs
    wire [63:0] result;
    wire cout;
    // Instantiate the Unit Under Test (UUT)
    adder uut (
        .operand1(operand1), 
        .operand2(operand2), 
        .cin(cin), 
        .result(result), 
        .cout(cout)
    );
    initial begin
        // Initialize Inputs
        operand1 = 0;
        operand2 = 0;
        cin = 0;
        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
    end
    always #10 operand1[63:32] = $random;  //$randomΪϵͳ���񣬲���һ�������32λ��
    always #10 operand2[63:32] = $random;  //#10 ��ʾ�ȴ�10����λʱ��(10ns)����ÿ��10ns����ֵһ�������32λ��
    always #10 operand1[31:0] = $random;
    always #10 operand2[31:0] = $random;
    always #10 cin = {$random} % 2; //����ƴ�ӷ���{$random}����һ���Ǹ�������2ȡ��õ�0��1
endmodule
