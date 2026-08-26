initial begin 
	repeat (10) @(posedge clk);
	selpulse;
	repeat (5) @(posedge clk);
	$finish;
end 
