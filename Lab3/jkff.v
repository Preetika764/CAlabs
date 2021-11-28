module jkff(j,k,clock,q);
input j,k,clock;
output reg q;



always @ (posedge clock)
begin
case({j,k})
	2'b00: q = q;
	2'b11: q = ~q;
	2'b01: q = 1'b0;
	2'b10: q = 1'b1;
endcase
end

initial 
q = 1'b0;

endmodule