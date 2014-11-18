/* レジスタ書き込み制御器
 * POS   : 書き込み位置データ入力
 * WRITE : 書き込み位置出力
 */
module REGWRITE_CONTROLLER(POS, WRITE);
	input  [1:0] POS;
	output [3:0] WRITE;

	wire   [3:0] WRITE;

	assign WRITE[0] = (POS[1:0] == 2'b00);
	assign WRITE[1] = (POS[1:0] == 2'b01);
	assign WRITE[2] = (POS[1:0] == 2'b10);
	assign WRITE[3] = (POS[1:0] == 2'b11);

endmodule
