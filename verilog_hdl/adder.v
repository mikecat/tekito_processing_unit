/* �����Z��
 * INPUT1 : ������鐔/������鐔
 * INPUT2 : ������/������
 * DOSUB  : 0�Ȃ瑫���Z�A1�Ȃ�����Z
 * OUTPUT : �v�Z����
 * CARRY  : �v�Z���ʂ̌����ӂ�
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
