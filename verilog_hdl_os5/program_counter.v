/* プログラムカウンタ
 * RESET      : 非同期リセット 0でリセット
 * CLOCK      : クロック 立ち上がりでカウント/ロード
 * ADDR_IN    : ロードする値
 * ADDR_WRITE : クロック立ち上がり時0ならインクリメント、1ならロード
 * ADDR_OUT   : アドレス出力
 */
module PROGRAM_COUNTER (RESET, CLOCK, ADDR_IN, ADDR_WRITE, ADDR_OUT);
	input        RESET;
	input        CLOCK;
	input  [5:0] ADDR_IN;
	input        ADDR_WRITE;
	output [5:0] ADDR_OUT;

	reg    [5:0] ADDR_OUT;

	// 非同期リセット
	always @(~RESET) begin
		ADDR_OUT <= 6'b0;
	end

	// カウント
	always @(posedge CLOCK) begin
		if (RESET) begin
			ADDR_OUT <= ADDR_WRITE ? ADDR_IN : (ADDR_OUT + 6'b1);
		end
	end

endmodule
