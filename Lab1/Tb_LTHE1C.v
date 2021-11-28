module stimulus;

	reg[3:0] a,b;
	reg signal;
	wire[3:0] sum;
	wire cout;
	adder_subtractor myadder(a,b,sum,carry,signal);
	
	initial 
	begin
	$monitor($time, "a = %b b = %b signal = %b sum = %b carry = %b", a,b,signal,sum, carry);
	#0 a = 4'd0;	b = 4'd4;	signal = 1'b0;
	#5 a = 4'd4;	b = 4'd5;	signal = 1'b0;
	#5 a = 4'd10;	b = 4'd5;	signal = 1'b1;
	#5 a = 4'd7;	b = 4'd6;	signal = 1'b1;
	#5 a = 4'd3;	b = 4'd4;	signal = 1'b1;
	#5 a = 4'd7;	b = 4'd8;	signal = 1'b1;
	
	end
endmodule