/* セレクタ
 * INPUT0 : 0の時に出力するデータ
 * INPUT1 : 1の時に出力するデータ
 * SELECT : 選択
 * OUTPUT : 出力
 */
module SELECTER(INPUT0, INPUT1, SELECT, OUTPUT);
	input  [3:0] INPUT0;
	input  [3:0] INPUT1;
	input        SELECT;
	output [3:0] OUTPUT;

	wire   [3:0] OUTPUT;

	assign OUTPUT = SELECT ? INPUT1 : INPUT0;

endmodule
