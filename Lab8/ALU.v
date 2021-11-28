module ALU(A,B,ctrl,ALUout);
	input [0:3] A,B;
	input [0:2] ctrl;
	output [0:3] ALUout;
	wire [0:3] add_, sub_, xor_, or_, and_, nor_, nand_, xnor_;
	wire carry, borrow;
	assign {carry,add_} = A+B;
	assign {borrow,sub_} = A-B;
	assign xor_ = A^B;
	assign or_ = A|B;
	assign and_ = A&B;
	assign nor_ = ~(A|B);
	assign nand_ = ~(A&B);
	assign xnor_ = ~(A^B);
	
	decoder3_8 mydecoder(ctrl,add_,sub_,xor_,or_,and_,nor_,nand_,xnor_,ALUout);
endmodule;

module decoder3_8(ctrl, add_,sub_,xor_,or_,and_,nor_,nand_,xnor_,ALUout);

	input [0:2] ctrl;
	output reg [0:3] ALUout;
	input [0:3] add_, sub_, xor_, or_, and_, nor_, nand_, xnor_;
	
	always @ (ctrl)
	begin
	case (ctrl)
	3'b000 : ALUout = add_;
	3'b001 : ALUout = sub_;
	3'b010 : ALUout = xor_;
	3'b011 : ALUout = or_;
	3'b100 : ALUout = and_;
	3'b101 : ALUout = nor_;
	3'b110 : ALUout = nand_;
	3'b111 : ALUout = xnor_;
	endcase
	end 
endmodule

/*
module tb_ALU;
	reg [0:3] A,B;
	reg [0:2] ctrl;
	wire [0:3] ALUout;
	
	ALU myALU(A,B,ctrl,ALUout);
	
	initial 
	begin
	#1 A = 4'b1111;	B = 4'b0011;	ctrl = 3'b010;
	#4 $display("%b %b %b %b",A,B,ctrl,ALUout);
	#5 $finish;
	end
endmodule
*/