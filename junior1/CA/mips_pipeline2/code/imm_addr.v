`timescale 1ns / 1ps

module imm_addr(imm,pc,out
    );
	input wire [15:0]imm;
	input wire [31:0]pc;
	output wire [31:0] out;
	assign out=pc[31:0]+{14'b0,imm[15:0],2'b0}-8;

endmodule
