`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 15:30:24
// Design Name: 
// Module Name: DM_unit
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


module DM_unit(input Wr,
               input [31:0] DMAdr,
               input [31:0] wd,
               output [31:0] rd);
    reg [31:0] RAM[23:0];
    initial begin	//此处为绝对地址，注意斜杠方向
		$readmemh("D:/Vivado/Pipeline_CPU/Pipeline_CPU.srcs/sources_1/dm_unit.dat", RAM);
	end
    //read
    assign rd = RAM[DMAdr>>2];
    //write
    always @(Wr)
    if (Wr) begin
            RAM[DMAdr>>2] = wd;
    end
endmodule