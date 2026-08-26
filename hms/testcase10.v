initial begin 
	repeat (60*60-2) @(posedge clk);
	selpulse;
	repeat (5) @(posedge clk);
	$finish;
end 
