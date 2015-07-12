`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:33 03/24/2015 
// Design Name: 
// Module Name:    equal 
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
module equal(in1,in2,result
    );
	input wire [31:0] in1, in2;
	output wire result;
	assign result = ( in1 == in2 );

endmodule
