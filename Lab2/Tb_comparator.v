module testbench;

	reg signed[0:3] a,b;
	wire altb,aeqb,agtb;
	comparator	mycomparator(a,b,altb,aeqb,agtb);
	
	initial
		begin
			$monitor($time, "a = %b, b = %b, altb = %b, agtb = %b, aeqb = %b",a,b,altb,agtb,aeqb);
			#0 a = 4'sb0000;	b = 4'sb1001;
			#4 a = 4'sb0001; b = 4'sb1010;
			#4 a = 4'sb0010; b = 4'sb1110;
			#4 a = 4'sb0011; b = 4'sb0011;
			#4 a = 4'sb0100; b = 4'sb0100;
			#4 a = 4'sb0101; b = 4'sb1000;
			#4 a = 4'sb0111; b = 4'sb1000;
			#4 a = 4'sb1111; b = 4'sb0000;
		end
endmodule
			