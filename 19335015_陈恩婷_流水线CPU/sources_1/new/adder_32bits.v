`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/12/25 15:15:09
// Design Name:
// Module Name: adder_32bits
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


module adder_32bits(input[31:0] a,
                    input[31:0] b,
                    output[31:0] c);
    
    assign c = a + b;
endmodule
    
