module fifo (
input clk, rst, wr, rd,
input [7:0] din,
output reg [7:0] dout,
output reg [3:0] wrptr, rdptr,
output full, empty
);
reg [7:0] box[1:10]; 
wire [3:0] rdptrplus1;
wire [3:0] wrptrplus1;
wire splrd, splwr;
enum {emp, par, ful} state;
assign wrptrplus1 = wrptr == 10 ? 1 : wrptr + 1;
assign rdptrplus1 = rdptr == 10 ? 1 : rdptr + 1;
assign splwr = wr && (wrptrplus1 == rdptr);
assign splrd = rd && (rdptrplus1 == wrptr);
assign full = state == ful;
assign empty = state == emp;

integer i;

always @(posedge clk or posedge rst) begin
	if(rst) for (i = 1; i <= 10; i = i + 1)
				box[i] <= 8'bxxxx_xxxx;
	else begin
		case(state)
			emp, par : if (wr) box[wrptr] <= din;
		endcase
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) state <= emp;
	else begin
		case(state)
			emp : state <= wr ? par : emp;
			par : case(1)
				splwr : state <= ful;
				splrd : state <= emp;
				wr : state <= par;
				rd : state <= par;
				endcase
			ful : state <= rd ? par : ful;
		endcase;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) wrptr <= 1;
	else begin 
		case(state)
			emp, par : wrptr <= wr ? wrptrplus1 : wrptr;
			ful : wrptr <= wrptr;
		endcase
	end 
end

always @(posedge clk or posedge rst) begin
	if (rst) rdptr <= 1;
	else begin
		case(state)
			ful, par : rdptr <= rd ? rdptrplus1 : rdptr;
			emp : rdptr <= rdptr;
		endcase
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) dout <= 8'bxxxx_xxxx;
	else begin
		case(state)
			emp : dout <= dout;
			par, ful : if (rd) dout <= box[rdptr];
						else 
							dout <= dout;									 
		endcase
	end
end	
endmodule 
					