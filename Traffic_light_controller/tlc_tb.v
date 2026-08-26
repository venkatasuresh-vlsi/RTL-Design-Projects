module tb;
reg clk = 0, rst = 1, veh = 0, vehnba = 0;
wire HWr, HWy, HWg, SWr, SWy, SWg;

always @* veh <= vehnba;

TLC DEVARA (clk, rst, veh, HWr, HWy, HWg, SWr, SWy, SWg);

always #5 clk = !clk;

initial begin 
	#2 rst = 0;
	repeat (5) @(posedge clk);
	@(posedge clk); veh = 1;
	@(posedge clk); veh = 0;
	repeat (20) @(posedge clk);
	$finish;
end 

endmodule