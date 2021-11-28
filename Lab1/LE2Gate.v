module bits_magnitude_comparator(a,b,less,greater,equal);

	input[3:0] a,b;
	output less,greater,equal;
	wire[3:0] x, aneg, bneg;
	wire[7:0] intermediate;
	not(aneg[3],a[3]);
	not(aneg[2],a[2]);
	not(aneg[1],a[1]);
	not(aneg[0],a[0]);
	not(bneg[3],b[3]);
	not(bneg[2],b[2]);
	not(bneg[1],b[1]);
	not(bneg[0],b[0]);

	and(intermediate[0],aneg[3],b[3]);
	and(intermediate[1],bneg[3],a[3]);
	and(intermediate[2],aneg[2],b[2]);
	and(intermediate[3],bneg[2],a[2]);
	and(intermediate[4],aneg[1],b[1]);
	and(intermediate[5],bneg[1],a[1]);
	and(intermediate[6],aneg[0],b[0]);
	and(intermediate[7],bneg[0],a[0]);

	nor(x[3],intermediate[0],intermediate[1]);
	nor(x[2],intermediate[2],intermediate[3]);
	nor(x[1],intermediate[4],intermediate[5]);
	nor(x[0],intermediate[6],intermediate[7]);

	wire[6:0] intermediate2;
	and(intermediate2[0],x[3],intermediate[2]);
	and(intermediate2[1],x[3],intermediate[3]);
	and(intermediate2[2],x[3],x[2],intermediate[4]);
	and(intermediate2[3],x[3],x[2],intermediate[5]);
	and(intermediate2[4],x[3],x[2],x[1],intermediate[6]);
	and(intermediate2[5],x[3],x[2],x[1],intermediate[7]);
	and(intermediate2[6],x[3],x[2],x[1],x[0]);

	or(less,intermediate[0],intermediate2[0],intermediate2[2],intermediate2[4]);
	or(greater,intermediate[1],intermediate2[1],intermediate2[3],intermediate2[5]);
	buf(equal,intermediate2[6]);

endmodule;
 