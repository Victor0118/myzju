`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:40 05/12/2015 
// Design Name: 
// Module Name:    ME_WB 
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
module ME_WB(
	clk,rst,stall,
	me_memdata, me_td, me_WREG,
	wb_memdata, wb_td, wb_WREG
    );
	input clk,rst,stall;
	input wire [31:0] me_memdata;
	input wire [4:0] me_td;
	input wire me_WREG;
	output reg [31:0] wb_memdata;
	output reg [4:0] wb_td;
	output reg wb_WREG;

	always @(posedge clk or posedge rst)
	begin
	if(rst)
	begin
		wb_memdata <= 0;
		wb_td <= 0;
		wb_WREG <= 0;
	end
	else if(stall)
	begin
			wb_memdata <= 0;
			wb_td <= 0;
			wb_WREG <= 0;
	end
	else
	begin
		wb_memdata <= me_memdata;
		wb_td <= me_td;
		wb_WREG <= me_WREG;
	end
	end
	
endmodule
