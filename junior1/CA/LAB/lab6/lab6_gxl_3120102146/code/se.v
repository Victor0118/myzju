`timescale 1ns / 1ps

module se(in,SE,out
    );
	input wire [15:0] in;
	input wire SE;
	output [31:0] out;
	assign out=SE?({{16{in[15]}},in}):({16'b0,in});
endmodule
