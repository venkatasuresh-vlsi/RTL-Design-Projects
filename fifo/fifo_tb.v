module tb;
     reg clk, rst;
	 reg rd, wr, rdnba, wrnba;
	 reg [7:0] din, dinnba;
	 wire [7:0] dout;
	 wire [3:0] wrptr, rdptr;
	 wire full, empty;
	 
	 always @* wrnba <= wr;
	 always @* rdnba <= rd;
	 always @* dinnba <= din;

	 fifo Suresh (clk, rst, wrnba, rdnba, dinnba, dout, wrptr, rdptr, full, empty);
	 
	 always #5 clk = !clk;
	 
	 initial begin 
	     rst = 1; clk = 0; 
		 rd = 0; wr = 0; 
		 din = 8'bxxxx_xxxx;
		 #2;  
		 rst = 0;
		end 
		
	 initial begin 
	     repeat (3) @(posedge clk);
		 wr_stimulus(16);
		 @(posedge clk);
		 rd_stimulus(16);
		 @(posedge clk);
		 $finish;
		end
		
	 task wr_stimulus;
	     input integer n;
		 
		 repeat (n) begin 
		     @(posedge clk); wr = 1; din = $random;
		     @(posedge clk); wr = 0;
			 @(posedge clk);
			end 
		endtask
	 
	 task rd_stimulus;
	     input integer n;
		 
		 repeat (n) begin 
		     @(posedge clk); rd = 1; 
		     @(posedge clk); rd = 0;
			 @(posedge clk);
			end 
		endtask
	endmodule
		
			 