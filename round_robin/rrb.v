module RRB(clk, rst, r1, r2, r3, r4, out);
     input clk, rst;
	 input r1, r2, r3, r4;
	 output reg [2:0] out;
	 
	 enum {N1234, N2341, N3412, N4123, R1, R2, R3, R4} state;
	 
	 always @(posedge clk or posedge rst) begin 
	     if (rst) state <= N1234;
		 else 
		     case(state)
			     N1234 : case(1)
				     r1 : state <= R1;
				     r2 : state <= R2;
				     r3 : state <= R3;
				     r4 : state <= R4;
					 default : state <= N1234;
					endcase 
				 N2341 : case(1)
				     r2 : state <= R2;
				     r3 : state <= R3;
				     r4 : state <= R4;
				     r1 : state <= R1;
					 default : state <= N2341;
					endcase 
				 N3412 : case(1)
				     r3 : state <= R3;
					 r4 : state <= R4;
					 r1 : state <= R1;
					 r2 : state <= R2;
					 default : state <= N3412;
					endcase 
				 N4123 : case(1)
				     r4 : state <= R4;
					 r1 : state <= R1;
					 r2 : state <= R2;
					 r3 : state <= R3;
					 default : state <= N4123;
					endcase
				 R1 : case(1)
				     r1 : state <= R1;
					 r2 : state <= R2;
					 r3 : state <= R3;
					 r4 : state <= R4;
					 default : state <= N2341;
					endcase 
				 R2 : case(1)
				     r2 : state <= R2;
					 r3 : state <= R3;
					 r4 : state <= R4;
					 r1 : state <= R1;
					 default : state <= N3412;
					endcase 
				 R3 : case(1)
				     r3 : state <= R3;
					 r4 : state <= R4;
					 r1 : state <= R1;
					 r2 : state <= R2;
					 default : state <= N4123;
					endcase 
				 R4 : case(1)
				     r4 : state <= R4;
					 r1 : state <= R1;
					 r2 : state <= R2;
					 r3 : state <= R3;
					 default : state <= N1234;
					endcase 
				 default : state <= state;
				endcase 
		end 
	 
	 always @* begin 
	     case(state)
		     N1234, N2341, N3412, N4123 : out = 0;
			 R1 : out = 1;
			 R2 : out = 2;
			 R3 : out = 3;
			 R4 : out = 4;
			 default : out = 0;
			endcase 
		end 
	endmodule
					 