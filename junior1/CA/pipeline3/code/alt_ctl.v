`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:17 03/17/2015 
// Design Name: 
// Module Name:    alt_ctl 
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
module alt_ctl(op,func,aluc
    );
	input [5:0] op,func;
	output reg [4:0] aluc;
	always @* 
	begin
		case(op)
			6'b000000 : begin //R type
				case(func)//Same op, distinguished by function code. 17 instructions
					6'b100000 : aluc =  0;	//add
					6'b100001 : aluc =  1;	//addu
					6'b100010 : aluc =  2;	//sub
					6'b100011 : aluc =  3;	//subu
					6'b100100 : aluc =  4;	//and
					6'b100101 : aluc =  5;	//or
					6'b100110 : aluc =  6;	//xor
					6'b100111 : aluc =  7; //nor
					6'b101010 : aluc =  8;	//slt
					6'b101011 : aluc =  9;	//sltu
					6'b000000 : aluc = 10;	//sll
					6'b000010 : aluc = 11;	//srl
					6'b000011 : aluc = 12;	//sra
					6'b000100 : aluc = 10;	//sllv
					6'b000110 : aluc = 11;	//srlv
					6'b000111 : aluc = 12;	//srav
					6'b000001 : aluc = 13;	//slc?
					6'b000010 : aluc = 13;	//slcv?

					default   : aluc =  0;
				endcase
			end // I type
			6'b001000 : aluc =  0;	//addi
			6'b001001 : aluc =  1;	//addiu
			6'b001100 : aluc =  4;	//andi
			6'b001101 : aluc =  5;	//ori
			6'b001101 : aluc =  6;	//xori
			6'b001010 : aluc =  8;	//slti
			6'b001101 : aluc =  9;	//sltiu
			6'b001111 : aluc =  14;//lui
			default : aluc = 0;
		endcase
	end
	
endmodule
