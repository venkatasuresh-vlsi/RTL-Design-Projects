initial begin 
	repeat (5) @(posedge clk);
	selpulse;//HB
	selpulse;//MB
	repeat (62) begin 
		incpulse;
		repeat (2) @(posedge clk);
	end 
	repeat (60) begin 
		decpulse;
		repeat (2) @(posedge clk);
	end 
	$finish;
end 
