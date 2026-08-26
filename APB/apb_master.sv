module apb_master(PCLK, PRESETn, start, rw, addr, wdata, strb, PSEL, PENABLE, PADDR, PWRITE, PWDATA, PSTRB, PRDATA, PREADY, rdata, done);
//inputs of apb module 
input PCLK;
input PRESETn; 
input start;
input rw; // 1 = write 0 = read
input [31:0] addr; 
input [31:0] wdata;
input [3:0] strb;

//inputs to apb slave from apb master 
output reg PSEL;
output reg PWRITE; 
output reg PENABLE;
output reg [31:0] PADDR;
output reg [31:0] PWDATA; 
output reg [3:0] PSTRB;

//inputs to master came from apb slave
input [31:0] PRDATA;
input PREADY;

//outputs of apb module 
output reg [31:0] rdata;
output reg done;

enum {IDLE, SETUP, ACCESS} state;

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) state <= IDLE;
	else 
		case(state) 
			IDLE   : state <= start ? SETUP : IDLE;
			SETUP  : state <= ACCESS;
			ACCESS : state <= PREADY ? IDLE : ACCESS;
			default : state <= IDLE;
		endcase
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PSEL <= 0;
	else 
		case(state)
			SETUP, ACCESS  : PSEL <= 1;
			default : PSEL <= 0;
		endcase 
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PENABLE <= 0;
	else
		case(state) 
			ACCESS : PENABLE <= 1;
			default : PENABLE <= 0;
		endcase 
end 
//assign PENABLE = state == ACCESS;

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PWRITE <= 0;
	else 
		case(state)
			SETUP : PWRITE <= rw;			
		endcase 
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PADDR <= 0;
	else 
		case(state)
			SETUP   : PADDR <= addr;			
		endcase 
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PWDATA <= 0;
	else 
		case(state)
			SETUP : PWDATA <= wdata;
		endcase
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) PSTRB <= 0;
	else 
		case(state)
			SETUP : if (rw) PSTRB <= strb;		
		endcase 
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) rdata <= 0;
	else  
		case(state) 
			ACCESS : if (PREADY) 
						if (!PWRITE) 
							rdata <= PRDATA;
		endcase 
end 

always @(posedge PCLK or negedge PRESETn) begin 
	if(!PRESETn) done <= 0;
	else 
		case(state) 
			ACCESS : if (PREADY) 
						done <= 1;
			default : done <= 0;
		endcase 
end 

endmodule