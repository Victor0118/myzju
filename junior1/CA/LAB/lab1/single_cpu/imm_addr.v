`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:12 03/24/2015 
// Design Name: 
// Module Name:    imm_addr 
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
module imm_addr(imm,pc,out
    );
	input wire [15:0]imm;
	input wire [31:0]pc;
	output wire out={pc[31:16],imm[15:2],2'b0};

endmodule
