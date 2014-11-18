/* サブ演算器
 * INPUT  : 入力
 * KIND   : 00->ビット反転 01->右シフト 10->インクリメント 11->デクリメント
 * OUTPUT : 出力
 * FLAG   : フラグ出力
 */
module SUBCALC(INPUT, KIND, OUTPUT, FLAG);
	input  [3:0] INPUT;
	input  [1:0] KIND;
	output [3:0] OUTPUT;
	output       FLAG;

	wire   [3:0] OUTPUT;
	wire         FLAG;
	wire   [4:0] ADDED;
	wire   [4:0] TOADD;

	assign TOADD = KIND[0] ? 5'b1111 : 5'b0000;
	assign ADDED = {1'b0,INPUT[3:0]} + TOADD;

	assign OUTPUT = KIND[1] ? ADDED[3:0] :
		(KIND[0] ? {1'b0,INPUT[3:1]} : ~INPUT);
	assign FLAG = KIND[1] ? ADDED[4] :
		(KIND[0] ? INPUT[0] : 1'b1);

endmodule
