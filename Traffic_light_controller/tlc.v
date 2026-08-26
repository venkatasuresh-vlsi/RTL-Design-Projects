module TLC (clk, rst, veh, HWr, HWy, HWg, SWr, SWy, SWg);
input clk, rst, veh;
output reg HWr, HWy, HWg, SWr, SWy, SWg;

enum {HWgSWr, HWySWr, HWrSWg, HWrSWy} state;

reg [3:0] cnt;

always @(posedge clk or posedge rst) begin 
	if (rst) state <= HWgSWr;
	else 
		case(state)
			HWgSWr : state <= veh ? HWySWr : HWgSWr;
			HWySWr : state <= cnt == 4 ? HWrSWg : HWySWr;
			HWrSWg : state <= cnt == 10 ? HWrSWy : HWrSWg;
			HWrSWy : state <= cnt == 4 ? HWgSWr : HWrSWy;
		endcase 
end

always @(posedge clk or posedge rst) begin
	if (rst) cnt <= 0;
	else  
		case(state)
			HWgSWr : cnt <= veh ? 1 : 0;
			HWySWr : cnt <= cnt == 4 ? 1 : cnt + 1;
			HWrSWg : cnt <= cnt == 10 ? 1 : cnt + 1;
			HWrSWy : cnt <= cnt == 4 ? 0 : cnt + 1;
		endcase 
end 

always_comb begin 
	case(state)
		HWgSWr : {HWr, HWy, HWg, SWr, SWy, SWg} = 6'b001_100;
		HWySWr : {HWr, HWy, HWg, SWr, SWy, SWg} = 6'b010_100;
		HWrSWg : {HWr, HWy, HWg, SWr, SWy, SWg} = 6'b100_001;
		HWrSWy : {HWr, HWy, HWg, SWr, SWy, SWg} = 6'b100_010;
	endcase 
end 

endmodule