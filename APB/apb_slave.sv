module apb_slave(PCLK, PRESETn, PSEL, PENABLE, PWRITE, PADDR, PWDATA, PSTRB, PRDATA, PREADY);
//input of apb slave come from apb module
input PCLK, PRESETn;

//input of apb slave come from apb master
input PSEL, PENABLE, PWRITE;
input [31:0] PADDR;
input [31:0] PWDATA;
input [3:0] PSTRB;

//outputs of apb slave and inputs of apb master
output reg [31:0] PRDATA;
output reg PREADY;

enum {IDLE, SETUP, ACCESS} state;

reg [31:0] mem[0:15];


always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) state <= IDLE;
	else 
		case(state)
			IDLE : state <= PSEL ? SETUP : IDLE;
			SETUP : casex({PSEL, PENABLE})
						2'b11 : state <= ACCESS;
						2'b0x : state <= IDLE;
						default : state <= SETUP;
					endcase
			ACCESS : case({PSEL, PENABLE})
						2'b00, 2'b01 : state <= IDLE;
						2'b11 : state <= ACCESS;
						2'b10 : state <= SETUP;
					endcase 
		endcase 
end 


always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) for (int i = 0; i < 16; i++)
						mem[i] <= 32'b0;
	else 
		case(state)
			ACCESS : if (PWRITE) begin 
						if (PSTRB[0])
							mem[PADDR][7:0]   <= PWDATA[7:0];
						if (PSTRB[1])
							mem[PADDR][15:8]  <= PWDATA[15:8];
						if (PSTRB[2])
							mem[PADDR][23:16] <= PWDATA[23:16];
						if (PSTRB[3])
							mem[PADDR][31:24] <= PWDATA[31:24];
					end
					
		endcase 
end 
	
always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PRDATA <= 0;
	else 
		case(state)
			ACCESS : if(!PWRITE) 
							PRDATA <= mem[PADDR];
		endcase			
end 


always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PREADY <= 0;
	else 
		case(state)
			ACCESS : PREADY <= 1;
			default : PREADY <= 0;
		endcase 
end 

//assign PREADY = state <= ACCESS;
endmodule