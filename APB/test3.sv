task write (input [31:0] addr = 0, input [31:0] wdata = 0, input [3:0] strb = 0);
	repeat (2) @(posedge PCLK);
	PSEL = 1;
	PENABLE = 0;
	PWRITE = 1;
	PADDR = addr;
	PWDATA = wdata;
	PSTRB = strb;
	
	@(posedge PCLK);
	PENABLE = 1;
	
	@(posedge PCLK);
	PSEL = 0;
	PENABLE = 0;
	
	repeat(2) @(posedge PCLK);
endtask

task read (input [31:0] addr = 0);
	repeat (2) @(posedge PCLK);
	PSEL = 1;
	PENABLE = 0;
	PWRITE = 0;
	PADDR = addr;
	PSTRB = 4'b0000;
	
	@(posedge PCLK);
	PENABLE = 1;
	
	@(posedge PCLK);
	PSEL = 0;
	PENABLE = 0;
	
	repeat(2) @(posedge PCLK);
endtask 

initial begin 
	repeat (3) @(posedge PCLK);
	write(32'd1, 32'd234, 4'b0001);
	write(32'd3, 32'd232, 4'b0001);
	write(32'd5, 32'd230, 4'b0001);
	write(32'd7, 32'd238, 4'b0001);
	write(32'd9, 32'd236, 4'b0001);
	write(32'd11, 32'd234, 4'b0001);
	write(32'd13, 32'd232, 4'b0001);
	write(32'd15, 32'd230, 4'b0001);
	
	repeat (3) @(posedge PCLK);
	read(32'd1);
	read(32'd3);
	read(32'd5);
	read(32'd7);
	read(32'd9);
	read(32'd11);
	read(32'd13);
	read(32'd15);
	
	repeat (5) @(posedge PCLK);
	$finish;
end 
