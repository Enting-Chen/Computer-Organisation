`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 15:22:28
// Design Name: 
// Module Name: IM_Unit
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
module IM_Unit(input [7:0] Addr,
               output [31:0] instruction);
    //寄存器地址都是 4 位二进制数，因为寄存器只有 16 个，4 位就能表示所有寄存器
    reg [31:0] regs [0:255]; // 寄存器组
	initial begin	//此处为绝对地址，注意斜杠方向
		$readmemh("D:/Vivado/Pipeline_CPU/Pipeline_CPU.srcs/sources_1/pipeline_cpu.dat", regs);
	end
        
    assign instruction = regs[Addr] ; //  取指令

endmodule

