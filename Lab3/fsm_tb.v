`include "fsm.v"

module fsm_tb();
	reg reset,value,clock;
	wire out;
	integer i;
	fsm myfsm(reset,value,clock,out);
	reg [15:0] sequence;
	initial
    begin
      #0  clock = 1'b0; reset = 1'b1; sequence = 16'b0101101101110010;
      #5  reset = 1'b0;
      for(i=0; i<=15; i=i+1)
        begin
          value = sequence[i];
          #2  clock = 1'b1;
          #2  clock = 1'b0;
          $display("State = ", myfsm.state, ": Input = ", value, ", Output = ", out);
        end
    end
endmodule
	