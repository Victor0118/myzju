`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:53 03/24/2015 
// Design Name: 
// Module Name:    se 
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
module se(in,SE,out
    );
	input wire [15:0] in;
	input wire SE;
	output [31:0] out;
	assign out=SE?({16{in[15]}}):({16'b0,in});


endmodule
