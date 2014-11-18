/* �r�b�g���Z��
 * INPUT1  : ����1
 * INPUT2  : ����2
 * KIND    : 00->INPUT1 01->OR 10->AND 11->XOR
 * OUTPUT  : �o��
 * IS_ZERO : �o�͂̃r�b�g���S��0��
 */
module BITCALC(INPUT1, INPUT2, KIND, OUTPUT, IS_ZERO);
	input  [3:0] INPUT1;
	input  [3:0] INPUT2;
	input  [1:0] KIND;
	output [3:0] OUTPUT;
	output       IS_ZERO;

	wire   [3:0] OUTPUT;
	wire         IS_ZERO;

	assign OUTPUT = KIND[1] ?
		(KIND[0] ? INPUT1 ^ INPUT2 : INPUT1 & INPUT2) :
		(KIND[0] ? INPUT1 | INPUT2 : INPUT1);
	assign IS_ZERO = ~(OUTPUT[0] | OUTPUT[1] | OUTPUT[2] | OUTPUT[3]);

endmodule
