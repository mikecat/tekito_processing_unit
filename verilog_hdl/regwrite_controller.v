/* ���W�X�^�������ݐ����
 * POS   : �������݈ʒu�f�[�^����
 * WRITE : �������݈ʒu�o��
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
