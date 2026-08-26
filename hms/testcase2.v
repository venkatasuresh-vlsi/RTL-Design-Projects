initial begin 
	repeat (5) @(posedge clk);
	selpulse;//HB
	selpulse;//MB
	selpulse;//SB
	repeat (5) @(posedge clk);
fork
	selpulse;
	relpulse;
	incpulse;
	decpulse;
join
	repeat (5) @(posedge clk);
	$finish;
end 
