task incpulse;
begin 
	@(posedge clk);
	inc = 1;
	@(posedge clk);
	inc = 0;
end 
endtask

task decpulse;
begin 
	@(posedge clk);
	dec = 1;
	@(posedge clk);
	dec = 0;
end 
endtask

task selpulse;
begin 
	@(posedge clk);
	sel = 1;
	@(posedge clk);
	sel = 0;
end 
endtask

task relpulse;
begin 
	@(posedge clk);
	rel = 1;
	@(posedge clk);
	rel = 0;
end 
endtask