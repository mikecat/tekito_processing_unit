`timescale 1ps/1ps
`include "tekito_processing_unit.v"

/*
module TEKITO_PROCESSING_UNIT(
RESET, CLOCK, MEMORY_ADDR, MEMORY_DATA, INPUT0, INPUT1, OUTPUT0, OUTPUT1);
	input        RESET;
	input        CLOCK;
	output [5:0] MEMORY_ADDR;
	input  [7:0] MEMORY_DATA;
	input  [3:0] INPUT0;
	input  [3:0] INPUT1;
	output [3:0] OUTPUT0;
	output [3:0] OUTPUT1;

	wire [5:0] MEMORY_ADDR;
	wire [3:0] OUTPUT0;
	wire [3:0] OUTPUT1;

	assign MEMORY_ADDR = 6'b0;
	assign OUTPUT0 = 4'b0;
	assign OUTPUT1 = 4'b0;
endmodule
*/

module TEKITO_PROCESSING_UNIT_SIM;
	reg [2:0] RESET_CNT;
	wire RESET;
	reg CLOCK;
	reg OSC;

	wire [5:0] MEMORY_ADDR;
	wire [7:0] MEMORY_DATA;
	reg [3:0] INPUT0;
	reg [3:0] INPUT1;
	wire [3:0] OUTPUT0;
	wire [3:0] OUTPUT1;

	TEKITO_PROCESSING_UNIT TPU(
		.RESET(RESET),
		.CLOCK(CLOCK),
		.MEMORY_ADDR(MEMORY_ADDR),
		.MEMORY_DATA(MEMORY_DATA),
		.INPUT0(INPUT0),
		.INPUT1(INPUT1),
		.OUTPUT0(OUTPUT0),
		.OUTPUT1(OUTPUT1)
	);

	MEMORY MEM(
		.ADDR(MEMORY_ADDR),
		.DATA(MEMORY_DATA)
	);

	parameter OSC_INTERVAL = 20000;

	initial begin
		OSC = 1'b0;
	end

	always #(OSC_INTERVAL/2) begin
		OSC <= ~OSC;
	end

	initial begin
		CLOCK <= 1'b0;
		RESET_CNT <= 3'b0;
		INPUT0 <=4'b0;
		INPUT1 <=4'b0;
	end

	assign RESET = RESET_CNT[2];

	always @(posedge OSC) begin
		if (~RESET_CNT[2]) begin
			RESET_CNT <= RESET_CNT + 3'b1;
		end else begin
			CLOCK <= ~CLOCK;
		end
	end

	initial begin
		$dumpfile("tekito_processing_unit_sim.vcd");
//		$dumpvars(0,TEKITO_PROCESSING_UNIT_SIM);
//		$dumpvars(0,TPU);
//		$monitor("%t: RESET = %b, CLOCK = %b, MEMORY_ADDR = %x, MEMORY_DATA = %x, INPUT0 = %x, INPUT1 = %x, OUTPUT0 = %x, OUTPUT1 = %x, FLAG = %b, R0 = %x, R1 = %x, R2 = %x, R3 = %x",
//			$time, RESET, CLOCK, MEMORY_ADDR, MEMORY_DATA, INPUT0, INPUT1, OUTPUT0, OUTPUT1, TPU.FLAG, TPU.R0_OUT, TPU.R1_OUT, TPU.R2_OUT, TPU.R3_OUT);

		repeat (100) @(negedge OSC);
		$finish;
	end

endmodule
