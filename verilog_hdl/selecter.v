/* �Z���N�^
 * INPUT0 : 0�̎��ɏo�͂���f�[�^
 * INPUT1 : 1�̎��ɏo�͂���f�[�^
 * SELECT : �I��
 * OUTPUT : �o��
 */
module SELECTER(INPUT0, INPUT1, SELECT, OUTPUT);
	input  [3:0] INPUT0;
	input  [3:0] INPUT1;
	input        SELECT;
	output [3:0] OUTPUT;

	wire   [3:0] OUTPUT;

	assign OUTPUT = SELECT ? INPUT1 : INPUT0;

endmodule
