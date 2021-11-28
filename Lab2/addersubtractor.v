module addersubtractor(a,b,sum,cout,overflow,signal);

	input [3:0] a,b;
	input signal;
	output [3:0] sum;
	
	output cout,overflow;
	reg [3:0] b1;
	initial
	begin
		b1 = b^signal;
		
	end
	fulladder myadder(a,b1,sum,cout,overflow,signal);
	
		
endmodule
			