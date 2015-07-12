`timescale 1ns / 1ps

module isequal(in1,in2,result
    );
	input wire [31:0] in1, in2;
	output wire result;
	assign result = ( in1 == in2 );

endmodule
