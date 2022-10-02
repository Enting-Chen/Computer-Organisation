`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/12/25 15:11:41
// Design Name:
// Module Name: EX
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


module EX(clk,
          next_pc_ex,
          ALUCode_ex,
          ALUSrcB_ex,
          RegDst_ex,
          Imm_ex,
          RsData_ex,
          RtData_ex,
          RtAddr_ex,
          RdAddr_ex,
          Branch_addr_ex,
          alu_zero_ex,
          alu_res_ex,
          RegWriteAddr_ex);
    input clk;
    input[31:0] next_pc_ex;
    input[2:0] ALUCode_ex;
    input ALUSrcB_ex;
    input RegDst_ex;
    input[31:0] Imm_ex;
    input[31:0] RsData_ex;
    input[31:0] RtData_ex;
    input[4:0] RtAddr_ex;
    input[4:0] RdAddr_ex;
    //
    output[31:0] Branch_addr_ex;
    output alu_zero_ex;
    output[31:0] alu_res_ex;
    output reg[4:0] RegWriteAddr_ex;
    
    //分支地址
    adder_32bits adder_32bits_ex(.a(next_pc_ex),.b(Imm_ex<<2),.c(Branch_addr_ex));
    
    //ALUSrcB的多选器
    reg[31:0] alu_in;
    always@(*)begin
        case(ALUSrcB_ex)
            1'b0:alu_in <= RtData_ex;//来自寄存器堆第二个输入
            1'b1:alu_in <= Imm_ex;//来自符号扩展
        endcase
    end
    //ALU
    alu alu(.aluCtr(ALUCode_ex),.input1(RsData_ex),.input2(alu_in),
    .aluRes(alu_res_ex),.ZF(alu_zero_ex),.OF()//overflow什么也不连
    );
    
    //写寄存器堆地址的多选器
    always@(*)begin
        case(RegDst_ex)
            1'b0:RegWriteAddr_ex <= RtAddr_ex;//rt
            1'b1:RegWriteAddr_ex <= RdAddr_ex;//rd
        endcase
    end
    
endmodule
