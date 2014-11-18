`include "selecter.v"

/* 4���̓Z���N�^
 * INPUT0 : ����0
 * INPUT1 : ����1
 * INPUT2 : ����2
 * INPUT3 : ����3
 * SELECT : �I��
 * OUTPUT : �o��
 */
module SELECTER4(INPUT0, INPUT1, INPUT2, INPUT3, SELECT, OUTPUT);
	input  [3:0] INPUT0;
	input  [3:0] INPUT1;
	input  [3:0] INPUT2;
	input  [3:0] INPUT3;
	input  [1:0] SELECT;
	output [3:0] OUTPUT;

	wire   [3:0] SEL0_OUTPUT;
	wire   [3:0] SEL1_OUTPUT;
	wire   [3:0] OUTPUT;

	SELECTER SEL0 (
		.INPUT0(INPUT0),
		.INPUT1(INPUT1),
		.SELECT(SELECT[0]),
		.OUTPUT(SEL0_OUTPUT)
	);

	SELECTER SEL1 (
		.INPUT0(INPUT2),
		.INPUT1(INPUT3),
		.SELECT(SELECT[0]),
		.OUTPUT(SEL1_OUTPUT)
	);

	SELECTER SEL (
		.INPUT0(SEL0_OUTPUT),
		.INPUT1(SEL1_OUTPUT),
		.SELECT(SELECT[1]),
		.OUTPUT(OUTPUT)
	);

endmodule
