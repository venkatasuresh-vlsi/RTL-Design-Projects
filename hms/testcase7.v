initial begin 
	repeat (5) @(posedge clk);
	selpulse;//HB
	repeat (25) begin 
		incpulse;
		repeat (2) @(posedge clk);
	end 
	repeat (25) begin 
		decpulse;
		repeat (2) @(posedge clk);
	end 
	$finish;
end 
