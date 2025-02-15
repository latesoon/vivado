`timescale 1ns / 1ps
module multiply(              // 乘法器
    input         clk,        // 时钟
    input         mult_begin, // 乘法开始信号
    input  [31:0] mult_op1,   // 乘法源操作数1
    input  [31:0] mult_op2,   // 乘法源操作数2
    output [63:0] product,    // 乘积
    output        mult_end    // 乘法结束信号
);

    //乘法正在运算信号和结束信号
    reg mult_valid;
    assign mult_end = mult_valid & ~(|multiplier) & (op2_sign | ~(xmultiplier)) ; //乘法结束信号：乘数全0
    always @(posedge clk)
    begin
        if (!mult_begin || mult_end)
        begin
            mult_valid <= 1'b0;
        end
        else
        begin
            mult_valid <= 1'b1;
        end
    end

    //两个源操作取绝对值，正数的绝对值为其本身，负数的绝对值为取反加1
    wire        op1_sign;      //操作数1的符号位
    wire        op2_sign;      //操作数2的符号位
    wire [31:0] op1;  //操作数1的绝对值
    wire [31:0] op2;  //操作数2的绝对值
    assign op1_sign = mult_op1[31];
    assign op2_sign = mult_op2[31];
    assign op1=mult_op1;
    assign op2=mult_op2;

    //加载被乘数，运算时每次左移一位
    reg  [63:0] multiplicand;
    reg  [63:0] m_multiplicand;
    always @ (posedge clk)
    begin
        if (mult_valid)
        begin    // 如果正在进行乘法，则被乘数每时钟左移一位
            multiplicand <= {multiplicand[61:0],2'b0};
            m_multiplicand <= {m_multiplicand[61:0],2'b0};
        end
        else if (mult_begin) 
        begin   // 乘法开始，加载被乘数，为乘数1的绝对值
            if(op1_sign)
            begin
                multiplicand <= {32'hFFFF_FFFF,op1};
                m_multiplicand <={31'b0,(~op1+1),1'b0};
            end
            else
            begin
                multiplicand <= {32'b0,op1};
                m_multiplicand<= {31'h7FFF_FFFF,(~op1+1),1'b0};
            end
        end
    end

    //加载乘数，运算时每次右移一位
    reg  [31:0] multiplier;
    reg  xmultiplier;
    always @ (posedge clk)
    begin
        if (mult_valid)
        begin   // 如果正在进行乘法，则乘数每时钟右移一位
            xmultiplier <= multiplier[1];
            multiplier <= {2'b0,multiplier[31:2]}; 
        end
        else if (mult_begin)
        begin   // 乘法开始，加载乘数，为乘数2的绝对值
            multiplier <= op2;
            xmultiplier<= 1'b0;
        end
    end
    
    // 部分积：乘数末位为1，由被乘数左移得到；乘数末位为0，部分积为0
    wire [63:0] partial_product;
    assign partial_product = mult_end?64'b0:((xmultiplier ? multiplicand : 64'b0)+(multiplier[0] ? multiplicand: 64'b0)+(multiplier[1]?m_multiplicand:64'b0));
    
    //累加器
    reg [63:0] product_temp;
    always @ (posedge clk)
    begin
        if (mult_valid)
        begin
            product_temp <= product_temp + partial_product;
        end
        else if (mult_begin) 
        begin
            product_temp <= 64'd0;  // 乘法开始，乘积清零 
        end
    end 
    //若乘法结果为负数，则需要对结果取反+1
    assign product = product_temp;
endmodule
