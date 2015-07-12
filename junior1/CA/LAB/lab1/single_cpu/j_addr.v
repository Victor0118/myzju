`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:56 03/24/2015 
// Design Name: 
// Module Name:    j_addr 
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
module j_addr(addr,pc,out
    );
	input wire [25:0] addr;
	input wire [31:0] pc;
	output wire [31:0] out={pc[31:26],addr[25:0]};

endmodule
