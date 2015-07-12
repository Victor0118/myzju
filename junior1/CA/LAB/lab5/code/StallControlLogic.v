`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:06 05/19/2015 
// Design Name: 
// Module Name:    StallControlLogic 
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
module StallControlLogic(
	rs,rt,op,func,
	id_td, id_LW,
	stall
    );
	input wire [4:0] rs, rt;
	input wire [5:0] op, func;
	input wire [4:0] id_td;
	input wire id_LW;
	output wire stall;
	
	wire rs_cnt, rt_cnt;

	wire r_type, s_type, i_sll, i_srl, i_sra;	// i_jr,i_mfhi,i_mflo,i_mthi,i_mtlo;
	wire i_addi,i_andi,i_ori,i_xori,i_slti,i_type,i_lw,i_sw;//i_lh,i_sh,i_mul,i_div,,i_j,i_jal
	wire i_beq,i_bgez,i_bgtz,i_blez,i_bltz,i_bne;
	
	/* R_type */
	and(r_type,~op[5],~op[4],~op[3],~op[2],~op[1],~op[0]);
//	and(i_jr, r_type, ~func[5], ~func[4], func[3], ~func[2], ~func[1], ~func[0]);	//func:001000
	/* S_type */
	or(s_type,i_sll, i_srl, i_sra);
	and(i_sll, r_type, ~func[5], ~func[4], ~func[3], ~func[2], ~func[1], ~func[0]);	//func:000000
	and(i_srl, r_type, ~func[5], ~func[4], ~func[3], ~func[2], func[1], ~func[0]);	//func:000010
	and(i_sra, r_type, ~func[5], ~func[4], ~func[3], ~func[2], func[1], func[0]);	//func:000011
	

	/* I_type */
	or(i_type, i_addi, i_andi, i_ori, i_xori, i_slti, b_type, i_lw, i_sw );
	and(i_addi,~op[5],~op[4], op[3],~op[2],~op[1],~op[0]);	//001000
	and(i_andi,~op[5],~op[4], op[3], op[2],~op[1],~op[0]);	//001100
	and(i_ori, ~op[5],~op[4], op[3], op[2],~op[1], op[0]);
	and(i_xori,~op[5],~op[4], op[3], op[2], op[1],~op[0]);
	and(i_slti,~op[5],~op[4], op[3], ~op[2], op[1],~op[0]);
	and(i_lw, op[5],~op[4],~op[3],~op[2], op[1], op[0]);
	and(i_sw, op[5],~op[4], op[3],~op[2], op[1], op[0]);
	/* I_type(B) */
	or(b_type, i_beq, i_bgez, i_bgtz, i_blez, i_bltz, i_bne);
	and(i_beq, ~op[5],~op[4],~op[3], op[2],~op[1],~op[0]);	//000100
	and(i_bgez,~op[5],~op[4],~op[3], ~op[2],~op[1],op[0]);	//000001
	and(i_bgtz,~op[5],~op[4],~op[3], op[2],op[1],op[0]);	//000111
	and(i_blez,~op[5],~op[4],~op[3], op[2],op[1],~op[0]);	//000110
	and(i_bltz,~op[5],~op[4],op[3], ~op[2],~op[1],op[0]);	//001001
	and(i_bne, ~op[5],~op[4],~op[3], op[2],~op[1], op[0]);	//000101
	
	/* J_type */
//	and(i_j, ~op[5],~op[4],~op[3],~op[2], op[1],~op[0]);
//	and(i_jal, ~op[5],~op[4],~op[3],~op[2], op[1], op[0]);
	
	wire sw_lw;
	assign rs_cnt = (r_type & ~s_type) | i_type;
	assign rt_cnt = r_type | i_sw | b_type;
	assign sw_lw = id_LW & i_sw & (rt == id_td);
	assign stall = (id_LW & (((rs==id_td) & rs_cnt) | ((rt==id_td) & rt_cnt)))& ~sw_lw ;

endmodule
