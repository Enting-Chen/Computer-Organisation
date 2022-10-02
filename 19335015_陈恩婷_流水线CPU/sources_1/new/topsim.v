`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 15:40:01
// Design Name: 
// Module Name: topsim
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


module topsim; 
    reg clk;
    reg reset;
    wire[31:0] inst_if;
    wire[31:0] alu_res_ex;
    wire[31:0] Dout_mem;
    wire[31:0] RtData_id;
    wire[31:0] PC_out;
    wire [31:0] Branch_addr_ex;
//output [31:0] alu_res_ex;
    wire  alu_zero_ex;
    wire [4:0] RegWriteAddr_ex; 
    wire[4:0] RtAddr_ex,RdAddr_ex, RtAddr_id,RdAddr_id;
    wire MemtoReg_ex,RegWrite_ex,MemWrite_ex;
    wire MemRead_ex,ALUSrcB_ex,RegDst_ex,Branch_ex;
    wire[2:0] ALUCode_ex;
    wire[31:0] Imm_ex,RsData_ex,RtData_ex,next_pc_ex;

    MipsPipelineCPU CPU(
        .clk(clk),
        .reset(reset),
        .inst_if(inst_if),
        .alu_res_ex(alu_res_ex),
        .Dout_mem(Dout_mem),
        .RtData_id(RtData_id),
        .PC_out(PC_out),
        .Branch_addr_ex(Branch_addr_ex),
        .alu_zero_ex(alu_zero_ex),
        .RegWriteAddr_ex(RegWriteAddr_ex),
        .MemtoReg_ex(MemtoReg_ex),
        .RegWrite_ex(RegWrite_ex),
        .MemWrite_ex(MemWrite_ex),
        .MemRead_ex(MemRead_ex),
        .ALUSrcB_ex(ALUSrcB_ex),
        .RegDst_ex(RegDst_ex),
        .Branch_ex(Branch_ex),
        .ALUCode_ex(ALUCode_ex),
        .Imm_ex(Imm_ex),
        .RsData_ex(RsData_ex),
        .RtData_ex(RtData_ex),
        .next_pc_ex(next_pc_ex),
        .RtAddr_id(RtAddr_id),
        .RdAddr_id(RdAddr_id)
    );
    
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        // Wait 100 ns for global reset to finish
        #10;
        reset = 0;
    end
    parameter PERIOD = 10;
    always begin
        clk = 1'b1;
        #(PERIOD / 2) clk = 1'b0;
        #(PERIOD / 2) ;
    end
endmodule
    

