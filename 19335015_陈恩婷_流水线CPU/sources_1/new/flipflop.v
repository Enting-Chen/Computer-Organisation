`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 14:51:49
// Design Name: 
// Module Name: flipflop
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


//级间寄存器
module flipflop(clk,reset,in,out);

parameter WIDTH=5;//根据需要改宽度
input clk;//
input reset;
input [WIDTH-1:0] in;
reg [WIDTH-1:0] out_reg;//
output wire [WIDTH-1:0] out;

always@(posedge clk)
    if(reset)
        out_reg<={WIDTH{1'b0}};
    else 
        out_reg<=in;

assign out = out_reg;

endmodule

