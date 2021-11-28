module bits_magnitude_comparator(a,b,less,greater,equal);

	input[3:0] a,b;
	output less,greater,equal;
	
	/*
	wire[3:0] x;
	
	assign x[3] = ~((a[3]&~b[3])|(b[3]&~a[3]));
	assign x[2] = ~((a[2]&~b[2])|(b[2]&~a[2]));
	assign x[3] = ~((a[1]&~b[1])|(b[1]&~a[1]));
	assign x[3] = ~((a[0]&~b[0])|(b[0]&~a[0]));
	
	assign less = (a[3] & ~b[3])|(x[3] & (b[2] & ~a[2]))|(x[3] & x[2] & (b[1] & ~a[1])) | (x[3] & x[2] & x[1] & (b[0] & ~a[0]));
	assign equal = (x[3] & x[2] &x[1] & x[0]);
	assign greater = (a[3]&~b[3])|(x[3]&((a[2]&~b[2])))|(x[3]&x[2]&((a[1]&~b[1])))|(x[3]&x[2]&x[1]&(a[0]&~b[0]));
	
	initial
	begin
	//less = 0; greater = 0; equal=0;
	if (a<b)
		less = 1;
	else if (a>b)
		greater = 1;
	else if (a==b)
		equal = 1;
	end
	*/
	
	assign less = (a<b), greater = (a>b), equal = (a==b);
	
endmodule