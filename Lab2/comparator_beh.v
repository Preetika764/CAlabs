module comparator(a,b,altb,aeqb,agtb);
	input signed[0:3] a,b;
	output reg altb,agtb,aeqb;
	
	always @(a or b)
		if (a<b)
			begin
			altb = 1'b1;
			aeqb = 1'b0;
			agtb = 1'b0;
			end
		else if(a>b)
			begin
			altb = 1'b0;
			aeqb = 1'b0;
			agtb = 1'b1;
			end
		else if(a==b)
			begin
			altb = 1'b0;
			aeqb = 1'b1;
			agtb = 1'b0;
			end
	
endmodule