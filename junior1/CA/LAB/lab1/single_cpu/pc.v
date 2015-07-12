`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:49 03/17/2015 
// Design Name: 
// Module Name:    pc 
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
module pc(clk,rst,i_pc,o_pc
    );
	input clk;
	input [8:0] i_pc;
	output reg [8:0] o_pc;
	
	initial begin o_pc<=9'b0; end
	always @(posedge clk or negedge rst)
	begin
		if(!rst)
			o_pc<=9'b0;
		else
			o_pc<=i_pc;
	end

endmodule
