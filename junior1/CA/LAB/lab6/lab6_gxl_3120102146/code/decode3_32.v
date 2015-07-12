`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:28 06/23/2015 
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
	input wire [31:0] in1,in2,in3;
	input wire c1,c2;
	output wire [31:0] out;
	
	wire [31:0] tmp;
	
	assign out = c1?in1:tmp;
	assign tmp = c2?in2:in3;

endmodule
