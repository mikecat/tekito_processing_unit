/* ‰ÁŒ¸ŽZŠí
 * INPUT1 : ‘«‚³‚ê‚é”/ˆø‚©‚ê‚é”
 * INPUT2 : ‘«‚·”/ˆø‚­”
 * DOSUB  : 0‚È‚ç‘«‚µŽZA1‚È‚çˆø‚«ŽZ
 * OUTPUT : ŒvŽZŒ‹‰Ê
 * CARRY  : ŒvŽZŒ‹‰Ê‚ÌŒ…‚ ‚Ó‚ê
 */
module ADDER(INPUT1, INPUT2, DOSUB, OUTPUT, CARRY);
	input  [3:0] INPUT1;
	input  [3:0] INPUT2;
	input        DOSUB;
	output [3:0] OUTPUT;
	output       CARRY;

	wire   [3:0] OUTPUT;
	wire         CARRY;
	wire   [3:0] INPUT2_BUF;

	assign INPUT2_BUF = DOSUB ? (~INPUT2[3:0]) + 4'b1 : INPUT2[3:0];
	assign {CARRY,OUTPUT[3:0]} = {1'b0,INPUT1[3:0]} + {1'b0,INPUT2_BUF[3:0]};

endmodule
