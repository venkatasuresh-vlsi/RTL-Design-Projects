module UART_RX (clk, rst, rx, rx_data, rx_valid);
parameter CLK_FEQ = 50000000;
parameter BAUD_RATE = 9600;
parameter BAUD_DIV = CLK_FEQ / BAUD_RATE;

input clk, rst;
input rx;
output reg [7:0] rx_data;
output reg rx_valid;

enum {IDLE, START, DATA, STOP} state;

reg [31:0] baud_cnt;
reg [3:0]  bit_cnt;
reg [7:0] rx_temp;
reg syn_rx;

always @(posedge clk or posedge rst) begin 
	if (rst) syn_rx <= 1;
	else 	 syn_rx <= rx;
end

always @(posedge clk or posedge rst) begin 	
	if (rst) state <= IDLE;
	else 
		case(state)
			IDLE  : state <= rx == 0 ? START : IDLE;
			START : state <= baud_cnt == BAUD_DIV ? DATA : START;
			DATA  : state <= bit_cnt == 7 && baud_cnt == BAUD_DIV ?  STOP : DATA;
			STOP  : state <= baud_cnt == BAUD_DIV ? IDLE : STOP;
		endcase 
end 

always @(posedge clk or posedge rst) begin 
	if (rst) baud_cnt <= 0;
	else 
		if (baud_cnt == 0)
			baud_cnt <= rx == 0 ? 1 : 0;
		else 
			if (baud_cnt == BAUD_DIV)
				baud_cnt <= state == STOP ? 0 : 1;
			else 
				baud_cnt <= baud_cnt + 1;
end

always @(posedge clk or posedge rst) begin 
	if (rst) bit_cnt <= 8;
	else 
		if (bit_cnt == 8) 
			bit_cnt <= state == START && baud_cnt == BAUD_DIV ? 0 : 8;
		else
			bit_cnt <= baud_cnt == BAUD_DIV ? bit_cnt + 1 : bit_cnt;
end


always @(posedge clk or posedge rst) begin 
	if (rst) rx_temp <= 0;
	else 
		case(state)
			DATA : if (baud_cnt == BAUD_DIV) rx_temp[bit_cnt] <= syn_rx;
		endcase 
end 

always @(posedge clk or posedge rst) begin 
	if (rst) rx_data <= 0;
	else 
		case(state)
			STOP : if (baud_cnt == BAUD_DIV) rx_data <= rx_temp;
		endcase 
end 

always @(posedge clk or posedge rst) begin 
	if (rst) rx_valid <= 0;
	else 
		case(state)
			STOP    : if (baud_cnt == BAUD_DIV) rx_valid <= 1;
			default : rx_valid <= 0;
		endcase 
end 

endmodule
