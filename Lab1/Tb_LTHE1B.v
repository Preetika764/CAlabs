module stimulus;

	reg[3:0] a,b;
	wire[3:0] sum;
	wire cout;
	reg m = 1'b0;
	full_adder_4bit myadder(a,b,sum,carry,m);
	
	initial 
	begin
	$monitor($time, "a = %b b = %b cout = %b sum = %b", a,b,carry,sum);
	#0 a = 4'd0;	b = 4'd4;
	#5 a = 4'd4;	b = 4'd5;
	#5 a = 4'd10;	b = 4'd5;
	#5 a = 4'd7;	b = 4'd6;
	#5 a = 4'd3;	b = 4'd4;
	#5 a = 4'd7;	b = 4'd8;
	
	end
endmodule