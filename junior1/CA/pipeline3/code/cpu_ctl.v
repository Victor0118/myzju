`timescale 1ns / 1ps

module cpu_ctl(op,func,equal_result,JR,J,JAL,LW,WREG,WMEM,RDorRT,SE,SA,IorR,BJ,Aluc
    );
	input wire [5:0] op, func;
	input wire equal_result;
	output wire JR,J,JAL,LW,WREG,WMEM,RDorRT,SE,SA,IorR,BJ;
	output wire [4:0] Aluc;
	
	wire r_type, i_jr, i_sll, i_srl, i_sra;	//i_mfhi,i_mflo,i_mthi,i_mtlo;
	wire i_type, i_addi, i_addiu, i_andi, i_ori, i_xori, i_lui, i_lw, i_sw, i_slti, i_sltiu;//i_lh,i_sh,i_mul,i_div,
	wire b_type, i_beq, i_bne;
	wire i_j, i_jal;
	
	/* R_type */
	and(r_type,~op[5],~op[4],~op[3],~op[2],~op[1],~op[0]);
	and(i_jr, r_type, ~func[5], ~func[4], func[3], ~func[2], ~func[1], ~func[0]);	//func:001000
	and(i_sll, r_type, ~func[5], ~func[4], ~func[3], ~func[2], ~func[1], ~func[0]);	//func:000000
	and(i_srl, r_type, ~func[5], ~func[4], ~func[3], ~func[2], func[1], ~func[0]);	//func:000010
	and(i_sra, r_type, ~func[5], ~func[4], ~func[3], ~func[2], func[1], func[0]);	//func:000011
//	and(i_sllv, r_type, ~func[5], ~func[4], ~func[3], func[2], ~func[1], ~func[0]);	//func:000100
//	and(i_srlv, r_type, ~func[5], ~func[4], ~func[3], func[2], func[1], ~func[0]);	//func:000110
//	and(i_srav, r_type, ~func[5], ~func[4], ~func[3], func[2], func[1], func[0]);	//func:000111
	

	/* I_type */
	or(i_type, i_addi, i_andi, i_ori, i_xori, i_slti, b_type, i_lw, i_sw );
	and(i_addi,  ~op[5],~op[4], op[3],~op[2],~op[1],~op[0]);	//001000
	and(i_addiu, ~op[5],~op[4], op[3],~op[2],~op[1], op[0]);	//001001
	and(i_andi,  ~op[5],~op[4], op[3], op[2],~op[1],~op[0]);	//001100
	and(i_ori,   ~op[5],~op[4], op[3], op[2],~op[1], op[0]);	//001101
	and(i_xori,  ~op[5],~op[4], op[3], op[2], op[1],~op[0]);	//001110
	and(i_lui,   ~op[5],~op[4], op[3], op[2], op[1], op[0]);	//001111
	and(i_lw,     op[5],~op[4],~op[3],~op[2], op[1], op[0]);	//100011
	and(i_sw,     op[5],~op[4], op[3],~op[2], op[1], op[0]);	//101011
	and(i_slti,  ~op[5],~op[4], op[3],~op[2], op[1],~op[0]);	//001010
	and(i_sltiu, ~op[5],~op[4], op[3],~op[2], op[1], op[0]);	//001011

	/* I_type(B) */
	or(b_type, i_beq, i_bgez, i_bgtz, i_blez, i_bltz, i_bne);
	and(i_beq, ~op[5],~op[4],~op[3], op[2],~op[1],~op[0]);	//000100
	and(i_bne, ~op[5],~op[4],~op[3], op[2],~op[1], op[0]);	//000101
	
	/* J_type */
	and(i_j, ~op[5],~op[4],~op[3],~op[2], op[1],~op[0]);
	and(i_jal, ~op[5],~op[4],~op[3],~op[2], op[1], op[0]);

	/* JR,J,JAL,LW,WREG,WMEM,RDorRT,SE,SA,IorR,AluCtl£¬BJ */
	assign JR = i_jr;
	assign J = i_j;
	assign JAL = i_jal;
	assign LW = i_lw;
	assign WREG = i_jal | (IorR & ~i_sw) | (r_type & ~i_jr);
	assign WMEM = i_sw;
	assign RDorRT = r_type & ~i_jr;
	assign SE = i_addi | i_addiu | i_lw |i_sw | i_slti;//i_andi i_ori zero_extend
	assign SA = i_sll | i_srl | i_sra;
//	assign IR =( r_type | i_type ) & ~i_jr & ~b_type & ~i_lw & ~i_sw;
	assign IorR = i_type & ~b_type;
	alt_ctl AC(.op(op),.func(func),.aluc(Aluc));
	assign BJ = ( i_beq & equal_result ) | ( i_bne & ~equal_result );

endmodule
