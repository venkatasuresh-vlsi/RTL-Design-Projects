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
	repeat (2) @(posedge PCLK);
	write(0, 32'hAAAAAAAA, 4'b1111);
	write(1, 32'hBBBBBBBB, 4'b1111);
	write(2, 32'hCCCCCCCC, 4'b1111);
	write(3, 32'hDDDDDDDD, 4'b1111);
	write(4, 32'hEEEEEEEE, 4'b1111);
	write(5, 32'hFFFFFFFF, 4'b1111);
	write(6, 32'h11111111, 4'b1111);
	write(7, 32'h22222222, 4'b1111);
	write(8, 32'h33333333, 4'b1111);
	write(9, 32'h44444444, 4'b1111);
	write(10, 32'h55555555, 4'b1111);
	write(11, 32'h66666666, 4'b1111);
	write(12, 32'h77777777, 4'b1111);
	write(13, 32'h88888888, 4'b1111);
	write(14, 32'h99999999, 4'b1111);
	write(15, 32'hAAAAAAAA, 4'b1111);
	
	repeat(3) @(posedge PCLK);
	read(0);
	read(1);
	read(2);
	read(3);
	read(4);
	read(5);
	read(6);
	read(7);
	read(8);
	read(9);
	read(10);
	read(11);
	read(12);
	read(13);
	read(14);
	read(15);
	
	repeat (4) @(posedge PCLK);
	
	$finish;
end