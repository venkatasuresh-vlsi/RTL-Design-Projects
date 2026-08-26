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
	write(32'd0, 32'd244, 4'b0001);
	write(32'd2, 32'd243, 4'b0001);
	write(32'd4, 32'd241, 4'b0001);
	write(32'd6, 32'd249, 4'b0001);
	write(32'd8, 32'd247, 4'b0001);
	write(32'd10, 32'd244, 4'b0001);
	write(32'd12, 32'd243, 4'b0001);
	write(32'd14, 32'd241, 4'b0001);
	
	repeat (3) @(posedge PCLK);
	read(32'd0);
	read(32'd2);
	read(32'd4);
	read(32'd6);
	read(32'd8);
	read(32'd10);
	read(32'd12);
	read(32'd14);
	
	repeat (5) @(posedge PCLK);
	$finish;
end 
