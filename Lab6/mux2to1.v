module bit32_2to1mux(out,sel,in1,in2);
	input[31:0] in1,in2;
	output reg[31:0] out;
	input sel;
	
	always @ (sel)
	begin
		if(!sel)
			out = in1;
		else
			out = in2;
	end

endmodule

module tb_mux;

	reg[31:0] in1,in2;
	wire[31:0] out;
	reg sel;
	bit32_2to1mux mymux(out,sel,in1,in2);
	initial
	begin
	#1 in1 = 32'd5;	in2 = 32'd7; sel = 1'b0;
	#1 sel = 1'b1;
	end
	
	initial
	$monitor(" %b %d %d %d",sel,in1,in2,out);
endmodule
