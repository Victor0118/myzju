`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:12 05/19/2015
// Design Name:   top
// Module Name:   E:/mips_pipeline/code/test_top.v
// Project Name:  mips_pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg CCLK;
	reg [3:0] SW;
	reg BTNN;
	reg BTNE;
	reg BTNS;
	reg BTNW;

	// Outputs
	wire [7:0] LED;
	wire LCDE;
	wire LCDRS;
	wire LCDRW;
	wire [3:0] LCDDAT;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.CCLK(CCLK), 
		.SW(SW), 
		.BTNN(BTNN), 
		.BTNE(BTNE), 
		.BTNS(BTNS), 
		.BTNW(BTNW), 
		.LED(LED), 
		.LCDE(LCDE), 
		.LCDRS(LCDRS), 
		.LCDRW(LCDRW), 
		.LCDDAT(LCDDAT)
	);

	initial begin
		// Initialize Inputs
		CCLK = 0;
		SW = 0;
		BTNN = 0;
		BTNE = 0;
		BTNS = 0;
		BTNW = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#5 BTNE = 1; #5 BTNE = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;

		#5 BTNN = 1; #5 BTNN = 0; SW[3]=1;#5 BTNN = 1 ;SW[3]=0;#5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
		#5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0; #5 BTNN = 1; #5 BTNN = 0;
	end
   
	always #1 CCLK=~CCLK;
endmodule

