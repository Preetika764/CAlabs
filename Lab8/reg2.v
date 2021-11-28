module reg2(X,clock,out);
	
	input clock;
	input [0:3] X;
	output reg [0:3] out;
	
	always @ (negedge clock)
	begin
	out = X;
	end
endmodule