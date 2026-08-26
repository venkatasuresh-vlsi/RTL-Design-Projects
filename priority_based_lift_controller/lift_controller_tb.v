module tb; 
     reg clk, rst, g, a, b, c, d, e;
	 reg gnba, anba, bnba, cnba, dnba, enba;
	 wire [2:0] lift;
	 
	 always @* gnba <= g;
	 always @* anba <= a;
	 always @* bnba <= b;
	 always @* cnba <= c;
	 always @* dnba <= d;
	 always @* enba <= e;
	 
	 lift_controller Dut (clk, rst, gnba, anba, bnba, cnba, dnba, enba, lift);
	 
	 always #5 clk = !clk;
	 
	 initial begin 
	     clk = 0; rst = 1;
		 g = 0; a = 0; b = 0; c = 0; d = 0; e = 0;
		 gnba =  0; anba =  0; bnba =  0; cnba =  0; dnba =  0; enba =  0;
		 #2;
		 rst = 0;
		end 
	 initial begin 
	     @(posedge clk);
	     repeat (20) begin 
		     @(posedge clk); 
			 {g, a, b, c, d, e} = $random;
			end 
		 $stop;
		end 
	endmodule
			 
			 
		 