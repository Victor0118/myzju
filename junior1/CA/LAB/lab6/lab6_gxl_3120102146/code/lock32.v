`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:16 07/01/2015 
// Design Name: 
// Module Name:    lock32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lock32(clk,rst,in,out
    );
	 input clk,rst;
	 input [31:0] in;
	 output reg [31:0] out;
	 
	 always @(posedge clk or posedge rst)
	 begin
		if(rst)
			out<=32'b0;
		else
			out<=in;
	 end
	 
endmodule
