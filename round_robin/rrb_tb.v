module tb;
     reg clk, rst;
	 reg r1, r2, r3, r4;
	 reg r1nba, r2nba, r3nba, r4nba;
	 wire [2:0] out;
	 
	 always @* r1nba <= r1;
	 always @* r2nba <= r2;
	 always @* r3nba <= r3;
	 always @* r4nba <= r4;
	 
	 RRB Suresh (clk, rst, r1nba, r2nba, r3nba, r4nba, out);
	 
	 always #5 clk = !clk;
	 
	 initial begin 
	     clk = 0; rst = 1;
	     r1 = 0; r2 = 0; r3 = 0; r4 = 0;
	     r1nba = 0; r2nba = 0; r3nba = 0; r4nba = 0;
		 #2;
		 rst = 0;
		end 
		
	 initial begin
	     @(posedge clk);
         repeat (20) begin 
		     @(posedge clk); {r1, r2, r3, r4} = $random;
		    end 
		 $finish;
		end 
		
	endmodule 