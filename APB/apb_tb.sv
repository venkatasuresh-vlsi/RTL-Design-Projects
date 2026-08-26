module tb;
reg PCLK = 0;
reg PRESETn = 0; 
reg start = 0, startNBA = 0;
reg rw = 0, rwNBA = 0; // 1 = write 0 = read
reg [31:0] addr = 0, addrNBA = 0; 
reg [31:0] wdata = 0, wdataNBA = 0;
reg [3:0] strb = 0, strbNBA = 0;
wire  [31:0] rdata;
wire  done;

always @* begin 
	startNBA <= start;
	rwNBA    <= rw;
	addrNBA  <= addr;
	wdataNBA <= wdata;
	strbNBA  <= strb;
end 

apb_top DEVARA (PCLK, PRESETn, startNBA, rwNBA, addrNBA, wdataNBA, strbNBA, rdata, done);

always #5 PCLK = !PCLK;

initial #2 PRESETn = 1;

task write(input [31:0] aaddr, input [31:0] wwdata, input [3:0] sstrb);
	@(posedge PCLK); 
	start = 1;
	@(posedge PCLK); 
	start = 0;
	rw = 1; 
	addr = aaddr;
	wdata = wwdata;
	strb = sstrb;
	
	repeat (10) @(posedge PCLK);
endtask 

task read(input [31:0] aaddr);
	@(posedge PCLK); 
	start = 1;
	@(posedge PCLK); 
	start = 0;
	rw = 0; 
	addr = aaddr;
	strb = 4'b0000;
	
	repeat (10) @(posedge PCLK);
endtask 

initial begin 
	repeat (4) @(posedge PCLK);
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
	
	repeat (5) @(posedge PCLK);
	$finish;
end 

endmodule