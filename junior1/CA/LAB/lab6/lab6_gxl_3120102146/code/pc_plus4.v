`timescale 1ns / 1ps

module pc_plus4(i_pc,o_pc
    );
	input [31:0] i_pc;
	output [31:0] o_pc;
	
	assign o_pc[31:0]=i_pc[31:0]+8;

endmodule
