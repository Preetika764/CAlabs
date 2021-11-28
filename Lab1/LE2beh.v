module bits_magnitude_comparator(a,b,less,greater,equal);

	input[3:0] a,b;
	output reg less,greater,equal;
	
	always @(a or b)
		
		if(a<b)
			begin
			less = 1'b1;
			equal = 1'b0;
			greater = 1'b0;
			end
		else if(a==b)
			begin
			equal = 1'b1;
			greater = 1'b0;
			less = 1'b0;
			end
		else if (a>b)
			begin
			greater = 1'b1;
			less = 1'b0;
			equal = 1'b0;
			end
	
endmodule