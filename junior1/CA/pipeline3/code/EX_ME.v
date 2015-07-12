`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:42 05/12/2015 
// Design Name: 
// Module Name:    EX_ME 
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
module EX_ME(
	clk,rst,
	ex_aluresult, ex_td, ex_d2, ex_WREG, ex_WMEM, ex_LW,ex_instr,
	me_aluresult, me_td, me_d2, me_WREG, me_WMEM, me_LW,me_instr
    );
	input clk,rst;
	input wire [31:0] ex_aluresult,ex_d2,ex_instr;
	input wire [4:0] ex_td;
	input wire ex_WREG,ex_WMEM,ex_LW;
	output reg [31:0] me_aluresult,me_d2,me_instr;
	output reg [4:0] me_td;
	output reg me_WREG,me_WMEM,me_LW;

	always @(posedge clk or posedge rst)
	begin
	if(rst)
	begin
		me_aluresult <= 0;
		me_d2 <= 0;
		me_td <= 0;
		me_WREG <= 0;
		me_WMEM <= 0;
		me_LW <= 0;
		me_instr<=32'b100000;
	end
	else
	begin
		me_aluresult <= ex_aluresult;
		me_d2 <= ex_d2;
		me_td <= ex_td;
		me_WREG <= ex_WREG;
		me_WMEM <= ex_WMEM;
		me_LW <= ex_LW;
		me_instr<=ex_instr;
	end
	end

endmodule
