module apb_top(PCLK, PRESETn, start, rw, addr, wdata, strb, rdata, done);
input 		  PCLK;
input 		  PRESETn; 
input 		  start;
input 		  rw; // 1 = write 0 = read
input [31:0]  addr; 
input [31:0]  wdata;
input [3:0]   strb;
output [31:0] rdata;
output  	  done;

wire  		 PSEL;
wire  		 PWRITE; 
wire 		 PENABLE;
wire  [31:0] PADDR;
wire  [31:0] PWDATA; 
wire  [3:0]  PSTRB;
wire  [31:0] PRDATA;
wire         PREADY;

apb_master DRAGON (
					PCLK, 
					PRESETn,
					start, 
					rw,
					addr,
					wdata, 
					strb, 
					PSEL, 
					PENABLE, 
					PADDR,
					PWRITE, 
					PWDATA,
					PSTRB, 
					PRDATA, 
					PREADY, 
					rdata, 
					done
				);
				
apb_slave DEVARA (
					PCLK,
					PRESETn, 
					PSEL,
					PENABLE,
					PWRITE, 
					PADDR,
					PWDATA, 
					PSTRB, 
					PRDATA,
					PREADY
				);

endmodule