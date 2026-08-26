module hms(clk, rst, sel, inc, dec, rel, hrs, min, sec);
input clk, rst, sel, inc, dec, rel;
output reg [4:0] hrs;
output reg [5:0] min, sec;

enum {REG, HB, MB, SB} state;


always @(posedge clk or posedge rst) begin 
	if (rst) state <= REG;
	else 
		case(state)
			REG : state <= sel ? HB : REG;
			HB  : if (sel) 
					state <= MB;
				  else 
					state <= rel ? REG : HB;
			MB  : if (sel) 
					state <= SB;
				  else 
					state <= rel ? REG : MB;
			SB  : if (sel) 
					state <= HB;
				  else 
					state <= rel ? REG : SB;
		endcase 
end 

always @(posedge clk or posedge rst) begin 
	if (rst) sec <= 0;
	else 
		case(state)
			REG : if (sel) sec <= sec;
				  else sec <= sec == 59 ? 0 : sec + 1;
			HB,	MB  : sec <= sec;
			SB  : 
				 case({inc, dec, sel, rel}) 
					4'b1000 : sec <= sec == 59 ? 0 : sec + 1;
					4'b0100 : sec <= sec == 0 ? 59 : sec - 1;
					default : sec <= sec;
				endcase 
		endcase 
end

always @(posedge clk or posedge rst) begin 
	if (rst) min <= 0;
	else 
		case(state)
			REG : case(1)
					sel : min <= min;
					sec == 59 : min <= min == 59 ? 0 : min + 1;
					default : min <= min;
				endcase 
			HB, SB : min <= min;
			MB : case({inc, dec, sel, rel}) 
					4'b1000 : min <= min == 59 ? 0 : min + 1;
					4'b0100 : min <= min == 0 ? 59 : min - 1;
					default : min <= min;
				endcase 
		endcase 
end

always @(posedge clk or posedge rst) begin 
	if (rst) hrs <= 0;
	else 
		case(state)
			REG : case(1)
					sel : hrs <= hrs;
					{sec, min} == {6'd59,6'd59} : hrs <= hrs == 23 ? 0 : hrs + 1;
					default : hrs <= hrs;
				endcase 
			MB, SB : hrs <= hrs;
			HB : case({inc, dec, sel, rel}) 
					4'b1000 : hrs <= hrs == 23 ? 0 : hrs + 1;
					4'b0100 : hrs <= hrs == 0 ? 23 : hrs - 1;
					default : hrs <= hrs;
				endcase 
		endcase 
end

endmodule