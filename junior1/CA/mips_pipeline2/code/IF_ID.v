`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:33 05/12/2015 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(clk,rst,if_pcplus4, stall, BJ,
	if_instr,id_pcplus4, id_instr
    );
	input clk,rst,stall, BJ;
	input wire [31:0] if_pcplus4,if_instr;
	output reg [31:0] id_pcplus4,id_instr;

	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			id_pcplus4 <= 4;
			id_instr <= 32'b100000;
		end
		else if(stall | BJ)
		begin
			id_pcplus4 <= if_pcplus4;
			id_instr <= 32'b100000;
		end
		else
		begin
			id_pcplus4 <= if_pcplus4;
			id_instr <= if_instr;
		end
	end
endmodule
//module IF_ID(clk,rst,stall,if_pcplus4, if_instr,id_pcplus4, id_instr
//    );
//	input clk,rst, stall;
//	input wire [31:0] if_pcplus4,if_instr;
//	output reg [31:0] id_pcplus4,id_instr;
//
//	always @(posedge clk or posedge rst)
//	begin
//		if(rst)
//		begin
//			id_pcplus4 <= 4;
//			id_instr <= 32'b100000;
//		end
//		else if(stall)
//		begin
//			id_pcplus4 <= if_pcplus4-4;
//			id_instr <= 32'b100000;
//		end
//		else
//		begin
//			id_pcplus4 <= if_pcplus4;
//			id_instr <= if_instr;
//		end
//	end
//endmodule

