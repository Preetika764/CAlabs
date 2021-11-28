module controller (PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSource1,PCSource0,
ALUOp0,ALUOp1,ALUSrcB1,ALUSrcB0,ALUSrcA,RegWrite,RegDst,S,NS,Op);
	input [5:0] Op;
	input [3:0] S;
	output [3:0] NS;
	output reg PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSource1,PCSource0,
	ALUOp0,ALUOp1,ALUSrcB1,ALUSrcB0,ALUSrcA,RegWrite,RegDst;
	
	wire [0:16] imd;
	
	assign imd[0] = (~S[0])&&(~S[1])&&(~S[2])&&(~S[3]);
	assign imd[1] = (S[0])&&(~S[1])&&(~S[2])&&(~S[3]);
	assign imd[2] = (~S[0])&&(S[1])&&(~S[2])&&(~S[3]);
	assign imd[3] = (S[0])&&(S[1])&&(~S[2])&&(~S[3]);
	
	assign imd[4] = (~S[0])&&(~S[1])&&(S[2])&&(~S[3]);
	assign imd[5] = (S[0])&&(~S[1])&&(S[2])&&(~S[3]);
	assign imd[6] = (~S[0])&&(S[1])&&(S[2])&&(~S[3]);
	assign imd[7] = (~S[0])&&(S[1])&&(S[2])&&(~S[3]);
	
	assign imd[8] = (~S[0])&&(~S[1])&&(~S[2])&&(S[3]);
	
	wire Rformat, lw,sw,beq;
	assign Rformat= (~Op[0])&& (~Op[1])&& (~Op[2])&& (~Op[3])&& (~Op[4])&& (~Op[5]);
	assign lw = (Op[0])&& (Op[1])&& (~Op[2])&& (~Op[3])&& (~Op[4])&& (Op[5]);
	assign sw = (Op[0])&& (Op[1])&& (~Op[2])&& (Op[3])&& (~Op[4])&&	(Op[5]);
	assign beq = (~Op[0])&& (~Op[1])&& (Op[2])&& (~Op[3])&& (~Op[4])&& (~Op[5]);
	assign RegDst=Rformat;
	assign ALUSrc = lw || sw;
	assign MemtoReg = lw;
	assign RegWrite = Rformat || lw;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign Branch = beq;
	assign ALUOp1 = Rformat;
	assign ALUOp2 = beq;
	
endmodule