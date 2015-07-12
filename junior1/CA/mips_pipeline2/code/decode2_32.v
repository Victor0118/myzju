`timescale 1ns / 1ps

module decode2_32(in1,in2,c,out
    );
	input wire [31:0] in1,in2;
	input wire c;
	output wire [31:0] out;
	
	assign out = c ? in1 : in2;

endmodule
