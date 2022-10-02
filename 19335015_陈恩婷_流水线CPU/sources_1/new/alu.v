`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 15:36:14
// Design Name: 
// Module Name: alu
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


`timescale 1ns / 1ps
module alu(input [31:0] input1,
           input [31:0] input2,
           input [2:0] aluCtr,
           output reg[31:0] aluRes,
           output reg ZF,
           //output reg CF,
           output reg OF
           //output reg Branch_ctr
            );

reg CF;
always@(*) // 运算数或控制码变化时操作
begin
case(aluCtr)

4'b000: // and
begin
    aluRes = input1 & input2; if (aluRes == 0) ZF = 1; else ZF = 0; 
    OF = 0; CF = 0; 
    //Branch_ctr = 0;
end

4'b001: // or
begin
    aluRes = input1 | input2; if (aluRes == 0) ZF = 1; else ZF = 0;
    OF = 0; CF = 0; 
    //Branch_ctr = 0;
end

4'b010: // 加addi add 
begin
    {CF,aluRes} = $signed(input1) + $signed(input2); if (aluRes == 0) ZF = 1; else ZF = 0;
    OF          = input1[31]^input2[31]^aluRes[31]^CF;//溢出标志公式
   // Branch_ctr = 0;
end

// 4'b1010: // 加addiu lw sw
// begin
//     {CF,aluRes} = input1 + input2; if (aluRes == 0) ZF = 1; else ZF = 0;
//     OF = 0;//溢出标志公式 
//     Branch_ctr = 0;
// end

4'b110: // 减sub
begin
    {CF,aluRes} = input1 - input2; if (aluRes == 0)
    ZF = 1; else ZF = 0;
    OF = input1[31]^input2[31]^aluRes[31]^CF;//溢出标志公式
    //if ( aluRes == 0 ) Branch_ctr = 1; else Branch_ctr = 0;
end

4'b100: // 或非nor
begin
    aluRes  = ~(input1 | input2); if (aluRes == 0) ZF  = 1;
    else ZF = 0;
    OF = 0; CF = 0;
    //Branch_ctr = 0;
end

// 4'b0111: // 小于设置slt
// begin
//     if ($signed(input1)<$signed(input2)) aluRes = 1;
//     //($signed(a) < $signed(b));
//     else aluRes = 0; if (aluRes == 0) ZF = 1;  else ZF = 0;
//     if ( aluRes == 0 ) Branch_ctr = 0; else Branch_ctr = 1;
//     OF = 0; CF = 0;
// end

// 4'b1011: // 小于设置sltiu
// begin
//     if ($signed(input1)<input2) aluRes = 1;
//     //($signed(a) < $signed(b));
//     else aluRes = 0; if (aluRes == 0) ZF = 1;  else ZF = 0;
//     if ( aluRes == 0 ) Branch_ctr = 0; else Branch_ctr = 1;
//     OF = 0; CF = 0;
// end

// 4'b1000://sll
// begin
//     aluRes = input2<<shamt; if (aluRes == 0) ZF = 1; else ZF = 0;
//     OF = 0; CF = 0; Branch_ctr = 0;
// end 

// 4'b1001://srl
// begin
//     aluRes = input2>>shamt; if (aluRes == 0) ZF = 1; else ZF = 0;
//     OF = 0; CF = 0; Branch_ctr = 0;
// end

// 4'b0011://bne
// begin
//     aluRes = input1-input2;
//     if (aluRes == 0) ZF = 0;//这里的zero是指不为0，不相等
//     else ZF = 1;
//     if ( aluRes == 0 ) Branch_ctr = 0; else Branch_ctr = 1;
//     OF = 0; CF = 0;
// end

4'b011://xor
begin
    aluRes = (~input1&input2)|(input1&~input2); if (aluRes == 0) ZF  = 1;
    else ZF = 0;
    OF = 0; CF = 0; 
    //Branch_ctr = 0;
end

// 4'b1101://lui
// begin
//     aluRes = {input2[15:0],16'b0000_0000_0000_0000};
//     OF = 0; CF = 0; ZF = 0; Branch_ctr = 0;
// end

default:
begin
    aluRes = 0; ZF = 0;OF = 0; ZF = 0; 
    //Branch_ctr = 0;
end
endcase
end

endmodule