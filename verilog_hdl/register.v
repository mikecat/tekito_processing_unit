/* レジスタ
 * RESET      : 非同期リセット 0でリセット
 * CLOCK      : クロック 立ち上がりでロード
 * DATA_IN    : ロードする値
 * DATA_WRITE : クロック立ち上がり時0ならそのまま、1ならロード
 * DATA_OUT   : データ出力
 */
module REGISTER(RESET, CLOCK, DATA_IN, DATA_WRITE, DATA_OUT);
	input        RESET;
	input        CLOCK;
	input  [3:0] DATA_IN;
	input        DATA_WRITE;
	output [3:0] DATA_OUT;

	reg    [3:0] DATA_OUT;

	// 非同期リセット
	always @(~RESET) begin
		DATA_OUT <= 4'b0;
	end

	// データ更新
	always @(posedge CLOCK) begin
		if (RESET) begin
			DATA_OUT <= DATA_WRITE ? DATA_IN : DATA_OUT;
		end
	end

endmodule
