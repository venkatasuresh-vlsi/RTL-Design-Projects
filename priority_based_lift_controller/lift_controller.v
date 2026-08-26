module lift_controller(clk, rst, g, a, b, c, d, e, lift);
     input clk, rst, g, a, b, c, d, e;
	 output reg [2:0] lift;
	 
	 enum {G, AU, BU, CU, DU, EU, AD, BD, CD, DD, ED} state;
	     
	 always @(posedge clk or posedge rst) begin 
	     if (rst) state <= G;
		 else 
		     case(state) 
			     G : case(1) 
				     g : state <= G;
					 a : state <= AU;
					 b : state <= BU;
					 c : state <= CU;
					 d : state <= DU;
					 e : state <= EU;
					 default : state <= state;
					endcase 
				 AU : case(1)
				     a : state <= AU;
				     b : state <= BU;
					 c : state <= CU;
					 d : state <= DU;
					 e : state <= EU;
					 g : state <= G;
					 default : state <= state;
					endcase 
				 BU : case(1)
				     b : state <= BU;
					 c : state <= CU;
					 d : state <= DU;
					 e : state <= EU;
					 a : state <= AD;
					 g : state <= G;
					 default : state <= state;
					endcase 
				 CU : case(1)
				     c : state <= CU;
					 d : state <= DU;
					 e : state <= EU;
					 b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 default : state <= state;
					endcase 
				 DU : case(1)
				     d : state <= DU;
					 e : state <= EU;
					 c : state <= CD;
					 b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 default : state <= state;
					endcase 
				 EU : case(1)
				     e : state <= EU;
					 d : state <= DD;
					 c : state <= CD;
					 b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 default : state <= state;
					endcase 
				 AD : case(1) 
				     a : state <= AD;
					 g : state <= G;
					 b : state <= BU;
					 c : state <= CU;
					 d : state <= DU;
					 e : state <= EU;
					 default : state <= state;
					endcase 
				 BD : case(1) 
				     b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 c : state <= CU;
					 d : state <= DU;
					 e : state <= EU;
					 default : state <= state;
					endcase
				 CD : case(1)
				     c : state <= CD;
					 b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 d : state <= DU;
					 e : state <= EU;
					 default : state <= state;
					endcase 
				 DD : case(1) 
				     d : state <= DD;
					 c : state <= CD;
					 b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 e : state <= EU;
					 default : state <= state;
					endcase 
				 ED : case(1) 
				     e : state <= ED;
					 d : state <= DD;
					 c : state <= CU;
					 b : state <= BD;
					 a : state <= AD;
					 g : state <= G;
					 default : state <= state;
					endcase 
				 default : state <= state;
				endcase 
		end 
	 always_comb begin 
	     case(state) 
		     G : lift = 0;
			 AD, AU : lift = 1;
			 BD, BU : lift = 2;
			 CD, CU : lift = 3;
			 DD, DU : lift = 4;
			 ED, EU : lift = 5;
			 default : lift = 0;
			endcase 
		end 
		
	endmodule
				