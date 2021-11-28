module DFF(q,d,clk,reset);
	input d,clk,reset;
	output reg q;
	always @(posedge clk)
	begin
		if(!reset)
			q <= 1'b0;
		else
			q <= d;
	end
endmodule

module tb_dff;
	
	reg d,clk,reset;
	
	wire q;
	DFF dff(q,d,clk,reset);
	initial
	begin
	clk = 0;
	#3 d = 0;
	#6 d = 1'b1;
	#3 d = 1'b0;
	#20 $finish;
	end
	
	always
	#15 clk = ~clk;
	
	initial
	$monitor($time, " %b %b %b", clk, d,q);
endmodule
	