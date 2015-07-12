`timescale 1ns / 1ps

module pc(clk,rst,stall,
	i_pc,o_pc
    );
	input clk,rst,stall;
	input [31:0] i_pc;
	output wire [31:0] o_pc;
	reg [31:0] tmp;
	
	initial begin tmp<=31'b0; end
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			tmp<=31'b0;
		else if (stall)
			tmp<=i_pc-4;
		else
			tmp<=i_pc;
	end
	assign o_pc = (stall)?(tmp-4):tmp;

endmodule
//module pc(clk,rst,i_pc,o_pc
//    );
//	input clk,rst;
//	input [31:0] i_pc;
//	output reg [31:0] o_pc;
//	
//	initial begin o_pc<=31'b0; end
//	always @(posedge clk or posedge rst)
//	begin
//		if(rst)
//			o_pc<=31'b0;
//		else
//			o_pc<=i_pc;
//	end
//
//endmodule
