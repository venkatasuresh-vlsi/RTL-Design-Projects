module tb;
parameter CLK_FEQ = 50000000;
parameter BAUD_RATE = 9600;

reg clk, rst;
reg tx_start;
reg tx_startNBA;
reg [7:0] tx_data;
reg [7:0] tx_dataNBA;
wire [7:0] rx_data;
wire rx_valid;
wire tx;
wire tx_busy;

always @* tx_startNBA <= tx_start;
always @* tx_dataNBA <= tx_data;

UART_TX #(.CLK_FEQ(CLK_FEQ), .BAUD_RATE(BAUD_RATE)) TX (clk, rst, tx_startNBA, tx_dataNBA, tx, tx_busy);
UART_RX #(.CLK_FEQ(CLK_FEQ), .BAUD_RATE(BAUD_RATE)) RX (clk, rst, tx, rx_data, rx_valid);

always #5 clk = !clk;
initial clk = 0;

initial begin 
	rst = 1; tx_startNBA = 0; tx_start = 0;
	tx_data = 0; tx_dataNBA = 0;
	#2;
	rst = 0;
end 

initial begin 
	repeat(2) @(posedge clk);
	@(posedge clk); tx_start = 1; tx_data = 8'b1x1z0z0x;
	@(posedge clk); tx_start = 0;
	@(posedge clk);
	wait(rx_valid == 1);
	repeat(5) @(posedge clk);
	$finish;
end 

endmodule