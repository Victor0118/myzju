`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:24 03/17/2015 
// Design Name: 
// Module Name:    alu 
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
module alu(a,b,aluc,result
    );
	input wire [31:0] a,b;
	input wire [4:0] aluc;
	output reg [31:0] result;
	
	always @*
	begin
		case(aluc)
			5'd0://0:add
			begin
				result=a+b;
			end
			5'd1://1:sub
			begin
				result=a-b;
			end
			5'd2://2:and
			begin
				result=a&b;
			end
			5'd3://3:or
			begin
				result=a|b;
			end
			5'd6://4:sll
			begin
				result=b<<a;//?
			end
			5'd10://5:srl
			begin
				result=b>>a;//?
			end
			5'd8://6:sra
			begin
				result=(b>>a)|({32{b[31]}}<<(32'd32));//?
			end
			default:
			begin
				result=0;
			end
		endcase
	end

endmodule
