module stimulus;

	reg [3:0] a,b;
	wire less,greater,equal;
	
	bits_magnitude_comparator mycomparator(a,b,less,greater,equal);
	
	initial 
	begin
	$monitor($time, "a = %b, b = %b, less = %b, greater = %b, equal =%b",a,b,less,greater,equal);
	#0 a = 4'd0; b = 4'd6;
	#5 a = 4'd9; b = 4'd9;
	#10 a = 4'd7; b = 4'd3;
	end
	
endmodule
		