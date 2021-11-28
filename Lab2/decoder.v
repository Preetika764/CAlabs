module decoder(x,y,z,d0,d1,d2,d3,d4,d5,d6,d7);
	input x,y,z;
	output d0,d1,d2,d3,d4,d5,d6,d7;
	wire xn,yn,zn;
	not(xn,x);
	not(yn,y);
	not(zn,z);
	and(d0,xn,yn,zn);
	and(d1,xn,yn,z);
	and(d2,xn,y,zn);
	and(d3,xn,y,z);
	and(d4,x,yn,zn);
	and(d5,x,yn,z);
	and(d6,x,y,zn);
	and(d7,x,y,z);
endmodule