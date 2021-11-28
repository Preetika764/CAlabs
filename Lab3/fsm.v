module fsm(input reset, input value, input clock,output out);
	reg[2:0] state;
	reg out;
	initial 
		begin
		state <= 3'b000;
		out <= 1'b0;
		end
	
	always @ (posedge clock or posedge reset)
		begin
			if(reset)
				begin
				state <= 3'b000;
				out <= 1'b0;
				end
			else
				case(state)
				3'b000:
				begin
				if(value)
					begin
						state <= 3'b001;
						out <= 1'b0;
					end
				else
					begin
						state <= 3'b000;
						out <= 1'b0;
					end
				end
				
				3'b001:
				begin
				if(value)
					begin
						state <= 3'b001;
						out <= 1'b1;
					end
				else
					begin
						state <= 3'b010;
						out <= 1'b0;
					end
				end
				
				3'b010:
				begin
				if(value)
					begin
						state <= 3'b011;
						out <= 1'b0;
					end
				else
					begin
						state <= 3'b000;
						out <= 1'b0;
					end
				end
				
				3'b011:
				begin
				if(value)
					begin
						state <= 3'b100;
						out <= 1'b0;
					end
				else
					begin
						state <= 3'b010;
						out <= 1'b0;
					end
				end
				
				3'b100:
				begin
				if(value)
					begin
						state <= 3'b001;
						out <= 1'b0;
					end
				else
					begin
						state <= 3'b010;
						out <= 1'b1;
					end
				end
				endcase
		end
endmodule	