`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:35 05/12/2015 
// Design Name: 
// Module Name:    exin 
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
module exin(CCLK,rst,instr,IF
    );
	input CCLK,rst;
	input [31:0] instr;
	output reg [7:0] IF;
	always @(*)
	begin
	if (rst)
		IF=8'd0;
	else
		case(instr[31:26])
		6'b000000:
		begin 
			case(instr[5:0])
			6'b100000:
			begin
				IF=(|instr[15:11])?8'd1:8'h0;//add 01
			end
			6'b100001:IF=8'd2;//addui 02
			6'b100010:IF=8'd3;//sub 03
			6'b100011:IF=8'd4;//subu 04
			6'b100100:IF=8'd5;//and 05
			6'b100101:IF=8'd6;//or 06
			6'b100110:IF=8'd7;//xor 07
			6'b100111:IF=8'd8;//nor 08
			6'b101010:IF=8'd9;//slt 09
			6'b101011:IF=8'd10;//sltu 0a
			6'b000000:IF=8'd11;//sll 0b
			6'b000010:IF=8'd12;//srl 0c
			6'b000011:IF=8'd13;//sra 0d
			6'b000100:IF=8'd14;//sllv 0e
			6'b000110:IF=8'd15;//srlv 0f
			6'b000111:IF=8'd16;//srav 10
			6'b001000:IF=8'd17;//jr 11
			endcase
		end
		6'b001000:IF=8'd18;//addi 12
		6'b001001:IF=8'd19;//addui 13
		6'b001100:IF=8'd20;//andi 14
		6'b001101:IF=8'd20;//ori 15
		6'b001110:IF=8'd22;//xori 16
		6'b001111:IF=8'd23;//lui 17
		6'b100011:IF=8'd24;//lw 18
		6'b101011:IF=8'd25;//sw 19
		6'b000100:IF=8'd26;//beq 1a
		6'b000101:IF=8'd27;//bne 1b
		6'b001010:IF=8'd28;//slti 1c
		6'b001011:IF=8'd29;//sltiu 1d
		6'b000010:IF=8'd30;//j 1e
		6'b000011:IF=8'd31;//jal 1f
		default:IF=8'd0;
		endcase
	end
endmodule

//module exin(CCLK,rst,instr,IF
//    );
//	input CCLK,rst;
//	input [31:0] instr;
//	output reg [7:0] IF;
//	always @(*)
//	begin
//	if (rst)
//		IF=8'd0;
//	else
//		case(instr[31:26])
//		6'b000000:
//		begin 
//			case(instr[5:0])
//			6'b100000:
//			begin
//				IF=(|instr[15:11])?8'd1:8'd0;
//			end
//			6'b100010:IF=8'd2;
//			6'b100100:IF=8'd3;
//			6'b100101:IF=8'd4;
//			6'b000000:IF=8'd5;
//			6'b000010:IF=8'd6;
//			6'b000011:IF=8'd7;
//			endcase
//		end
//		6'b001000:IF=8'd8;
//		6'b001100:IF=8'd9;
//		6'b001101:IF=8'd10;
//		6'b100011:IF=8'd11;
//		6'b101011:IF=8'd12;
//		6'b000100:IF=8'd13;
//		6'b000101:IF=8'd14;
//		6'b000010:IF=8'd15;
//		default:IF=8'd0;
//		endcase
//	end
//endmodule
