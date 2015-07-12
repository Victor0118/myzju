`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:34 03/17/2015 
// Design Name: 
// Module Name:    pc_plus4 
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
module pc_plus4(i_pc,o_pc
    );
	input [31:0] i_pc;
	output [31:0] o_pc;
	
	assign o_pc[31:0]=i_pc[31:0]+1;

endmodule
