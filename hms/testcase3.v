initial begin 
	repeat (5) @(posedge clk);
	selpulse;//HB
	selpulse;//MB
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
