/* レジスタ書き込みデータ選択器
 * ORDER  : 命令
 * BC     : ビット演算の結果
 * ADD    : 加減算の結果
 * SUBC   : サブ演算の結果
 * EXT    : 外部入力
 * REG    : レジスタの値
 * OUTPUT : 出力
 */
module WRITEDATA_SEL(ORDER, BC, ADD, SUBC, EXT, REG, OUTPUT);
	input  [7:0] ORDER;
	input  [3:0] BC;
	input  [3:0] ADD;
	input  [3:0] SUBC;
	input  [3:0] EXT;
	input  [3:0] REG;
	output [3:0] OUTPUT;

	wire   [3:0] OUTPUT;

	assign OUTPUT = ORDER[7] ? (
		ORDER[6] ? REG : ORDER[5:2]
	) : (
		ORDER[6] ? (
			ORDER[5] ? (
				ORDER[4] ?
					(ORDER[3] ? REG : EXT)
				: SUBC
			) : ADD
		) : BC
	);

endmodule
