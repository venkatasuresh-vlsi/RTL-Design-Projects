initial begin 
	repeat (10) @(posedge clk);
	fork 
		selpulse;
		relpulse;
		incpulse;
		decpulse;
	join 
	repeat (10) @(posedge clk);
	$finish;
end