`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:14 05/19/2015 
// Design Name: 
// Module Name:    display2 
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
module display2(
	input wire clk,
	input wire rst,
	input wire [31:0] instr,
	input wire [31:0] reg_data,
	input wire [31:0] stage,
	input wire [7:0] clk_cnt,
	input wire [7:0] reg_addr,
	output wire lcd_e,
	output wire lcd_rs,
	output wire lcd_rw,
	output wire [3:0] lcd_dat
    );
	 
	 reg [255:0] strdata = "";
	 wire [95:0] datain = {instr,reg_data,stage};
	 
	 
	 
	 function [7:0] num2str;
		input [3:0] number;
		begin
			if(number < 10)
				num2str = "0" + number;
			else
				num2str = "A" - 10 + number;
		end
	endfunction
	
	//instr
	genvar i;
	generate for (i=0; i<24; i=i+1) begin: NUM2STR
		always @(posedge clk) begin
			strdata[8*i+71-:8] <= num2str(datain[4*i+3-:4]);
		end
	end
	endgenerate
	
	generate for (i=0; i<2; i=i+1) begin: NUM2STR2
		always @(posedge clk) begin
			strdata[8*i+39-:8] <= num2str(clk_cnt[4*i+3-:4]);
		end
	end
	endgenerate
	
	generate for (i=0; i<2; i=i+1) begin: NUM2STR3
		always @(posedge clk) begin
			strdata[8*i+7-:8] <= num2str(reg_addr[4*i+3-:4]);
		end
	end
	endgenerate
	
	reg refresh = 0;
//	reg [7:0] addr_buf;
//	reg [31:0] data_buf;
	
	reg [127:0] datain_buf;
	reg [7:0] clk_cnt_buf;
	reg [7:0] reg_addr_buf;
	
	always @(posedge clk) begin
		datain_buf <= datain;
		clk_cnt_buf <= clk_cnt;
		reg_addr_buf <= reg_addr;
		refresh <= (datain_buf != datain) | (clk_cnt_buf != clk_cnt) | (reg_addr_buf != reg_addr);
	end
	
	displcd DISPLCD (
		.CCLK(clk),
		.reset(rst | refresh),
		.strdata(strdata),
		.rslcd(lcd_rs),
		.rwlcd(lcd_rw),
		.elcd(lcd_e),
		.lcdd(lcd_dat)
		);


endmodule
