/* 加減算器
 * INPUT1 : 足される数/引かれる数
 * INPUT2 : 足す数/引く数
 * DOSUB  : 0なら足し算、1なら引き算
 * OUTPUT : 計算結果
 * CARRY  : 計算結果の桁あふれ
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
