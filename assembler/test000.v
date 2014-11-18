module MEMORY(ADDR, DATA);
	input  [5:0] ADDR;
	output [7:0] DATA;

	wire   [7:0] DATA;

	assign DATA =
		ADDR == 6'b000000 ? 8'b10000100 : // MOVC 0x1, R0
		ADDR == 6'b000001 ? 8'b00100000 : // AND R0, R0
		ADDR == 6'b000010 ? 8'b00000000 : // NOP
		ADDR == 6'b000011 ? 8'b11000000 : // JMP START
		ADDR == 6'b000100 ? 8'b10111101 : // MOVC 0xF, R1
		ADDR == 6'b000101 ? 8'b01000100 : // ADD R1, R0
		ADDR == 6'b000110 ? 8'b11000000 : // JMP START
		ADDR == 6'b000111 ? 8'b11000111 : // JMP STOP
		8'b00000000
	;

endmodule
