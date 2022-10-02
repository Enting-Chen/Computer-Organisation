`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/12/25 15:13:20
// Design Name:
// Module Name: MEM
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


module MEM(//clk,
           //reset,
           MemRead_mem,
           MemWrite_mem,
           Branch_mem,
           alu_zero_mem,
           alu_res_mem,
           RtData_mem,
           branch_or_pc_mem,
           Dout_mem);
    //input clk;
    //MemRead信号暂时不要了
    //input reset;
    input MemRead_mem;
    input MemWrite_mem;
    input Branch_mem;
    input alu_zero_mem;
    input[31:0]alu_res_mem;
    input[31:0] RtData_mem;
    output branch_or_pc_mem;
    output[31:0] Dout_mem;
    
    DM_unit DM_unit(
    //.clk(clk),//input clka
    //.reset(rest),
    .Wr(~MemRead_mem&MemWrite_mem),//input [0:0] wea
    .DMAdr(alu_res_mem),//input [9 : 0] addra
    .wd(RtData_mem),//input [31:0] dina
    .rd(Dout_mem)//output [31:0] douta
    );
    
    //and模块，确定跳转信号
    assign branch_or_pc_mem = Branch_mem & alu_zero_mem;
    
endmodule
    
