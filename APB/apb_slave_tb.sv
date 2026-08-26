module tb;
reg PCLK = 0, PRESETn = 0, PSEL = 0, PENABLE = 0, PWRITE = 0;
reg PCLKNBA = 0, PRESETnNBA = 0, PSELNBA = 0, PENABLENBA = 0, PWRITENBA = 0;
reg [31:0] PADDR = 0;
reg [31:0] PADDRNBA = 0;
reg [31:0] PWDATA = 0;
reg [31:0] PWDATANBA = 0;
reg [3:0] PSTRB = 0;
reg [3:0] PSTRBNBA = 0;
wire [31:0] PRDATA;
wire PREADY;

always @* begin 
	PSELNBA    <= PSEL;
	PENABLENBA <= PENABLE;
	PWRITENBA  <= PWRITE;
	PADDRNBA   <= PADDR;
	PWDATANBA  <= PWDATA;
	PSTRBNBA   <= PSTRB;
end

apb_slave DEVARA (PCLK, PRESETn, PSELNBA, PENABLENBA, PWRITENBA, PADDRNBA, PWDATANBA, PSTRBNBA, PRDATA, PREADY);

always #5 PCLK = !PCLK;

initial #2 PRESETn = 1;

//`include "test1.sv"
//`include "test2.sv"
`include "test3.sv"
//`include "test4.sv"
endmodule