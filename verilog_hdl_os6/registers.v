module REGISTER(IN,MAIN_SEL,SUB_SEL,RESET,CLK,MAIN_OUT,SUB_OUT);
	input  [3:0] IN;
	input  [1:0] MAIN_SEL;
	input  [1:0] SUB_SEL;
	input        RESET;
	input        CLK;
	output [3:0] MAIN_OUT;
	output [3:0] SUB_OUT;

	wire   [3:0] MAIN_OUT;
	wire   [3;0] SUB_OUT;

	reg    [3:0] data0;
	reg    [3:0] data1;
	reg    [3:0] data2;
	reg    [3:0] data3;

	assign MAIN_OUT = MAIN_SEL[1] ?
		(MAIN_SEL[0] ? data3 : data2) :
		(MAIN_SEL[0] ? data1 : data0);
	assign SUB_OUT = SUB_SEL[1] ?
		(SUB_SEL[0] ? data3 : data2) :
		(SUB_SEL[0] ? data1 : data0);

	always @(~RESET) begin
		data0 <= 4'b0;
		data1 <= 4'b0;
		data2 <= 4'b0;
		data3 <= 4'b0;
	end
	always @(posedge CLK) begin
		data0 <= RESET ? (MAIN_SEL == 2'b00 ? IN : data0) : 4'b0;
		data1 <= RESET ? (MAIN_SEL == 2'b01 ? IN : data1) : 4'b0;
		data2 <= RESET ? (MAIN_SEL == 2'b10 ? IN : data2) : 4'b0;
		data3 <= RESET ? (MAIN_SEL == 2'b11 ? IN : data3) : 4'b0;
	end
endmodule
