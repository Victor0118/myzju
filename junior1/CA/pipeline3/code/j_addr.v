`timescale 1ns / 1ps

module j_addr(addr,pc,out
    );
	input wire [25:0] addr;
	input wire [31:0] pc;
	output wire [31:0] out;
	assign out = {pc[31:28],addr[25:0],2'b0};

endmodule
