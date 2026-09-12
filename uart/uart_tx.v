module UART_TX (clk, rst, tx_start, tx_data, tx, tx_busy);
parameter CLK_FEQ = 50000000;
parameter BAUD_RATE = 9600;
parameter BAUD_DIV = CLK_FEQ / BAUD_RATE;

input clk, rst;
input tx_start;
input [7:0] tx_data;
output reg tx;
output tx_busy;

enum {IDLE, START, DATA, STOP} state;

reg [31:0] baud_cnt;
reg [3:0] bit_cnt;
reg [7:0] tx_temp;

assign tx_busy = state != IDLE;

always @(posedge clk or posedge rst) begin 
	if (rst) state <= IDLE;
	else 
		case(state)
			IDLE  : state <= tx_start ? START : IDLE;
			START : state <= baud_cnt == BAUD_DIV ? DATA : START;
			DATA  : state <= baud_cnt == BAUD_DIV && bit_cnt == 7 ? STOP : DATA;
			STOP  : state <= baud_cnt == BAUD_DIV ? IDLE : STOP;
		endcase 
end

always @(posedge clk or posedge rst) begin 
	if (rst) baud_cnt <= 0;
	else 
		if (baud_cnt == 0)
			baud_cnt <= tx_start ? 1 : 0;
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
	if (rst) tx_temp <= 0;
	else 
		case(state)
			IDLE : tx_temp <= tx_start ? tx_data : tx_temp;
			default : tx_temp <= tx_temp;
		endcase 
end 

always @* begin
	case(state)
		IDLE  : tx <= 1;
		START : tx <= 0;
		DATA  : tx <= tx_temp[bit_cnt];
		STOP  : tx <= 1;
	endcase 
end 


endmodule