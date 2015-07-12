`timescale 1ns / 1ps

module decode2_5(in1,in2,c,out
    );
	input wire [4:0] in1,in2;
	input wire c;
	output wire [4:0] out;
	
	assign out=c?in1:in2;

endmodule
