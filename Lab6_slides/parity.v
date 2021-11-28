module evenparity(X,parity);
	input [0:3] X;
	output parity;
	assign parity = X[0]^X[1]^X[2]^X[3];
endmodule