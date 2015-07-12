`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:08 03/24/2015 
// Design Name: 
// Module Name:    decode3_32 
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
module decode3_32(in1,in2,in3,c1,c2,out
    );
	input [31:0] in1,in2,in3;
	input c1,c2;
	output [31:0] out;
	
	wire [31:0] tmp1,tmp2;
	
	assign out = (c1)?in1:tmp1;
	assign tmp1 = (c2)?in2:tmp2;
	assign tmp2 = in3;

endmodule
