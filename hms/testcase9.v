initial begin 
	repeat (58) @(posedge clk);
	selpulse;
	repeat (5) @(posedge clk);
	$finish;
end 
