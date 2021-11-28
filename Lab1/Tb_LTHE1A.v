module stimulus;

	reg a,b,cin;
	wire sum,cout;
	full_adder myadder(a,b,cin,sum,cout);
	
	initial 
	begin
	$monitor($time, "a = %b b = %b cin = %b cout = %b sum = %b", a,b,cin,cout,sum);
	#0 cin = 1'b0; a = 1'b0;	b = 1'b0;
	#5 cin = 1'b0; a = 1'b0;	b = 1'b1;
	#5 cin = 1'b0; a = 1'b1;	b = 1'b0;
	#5 cin = 1'b0; a = 1'b1;	b = 1'b1;
	#5 cin = 1'b1; a = 1'b0;	b = 1'b0;
	#5 cin = 1'b1; a = 1'b0;	b = 1'b1;
	#5 cin = 1'b1; a = 1'b1;	b = 1'b0;
	#5 cin = 1'b1; a = 1'b1;	b = 1'b1;
	end
endmodule