/* ���W�X�^
 * RESET      : �񓯊����Z�b�g 0�Ń��Z�b�g
 * CLOCK      : �N���b�N �����オ��Ń��[�h
 * DATA_IN    : ���[�h����l
 * DATA_WRITE : �N���b�N�����オ�莞0�Ȃ炻�̂܂܁A1�Ȃ烍�[�h
 * DATA_OUT   : �f�[�^�o��
 */
module REGISTER(RESET, CLOCK, DATA_IN, DATA_WRITE, DATA_OUT);
	input        RESET;
	input        CLOCK;
	input  [3:0] DATA_IN;
	input        DATA_WRITE;
	output [3:0] DATA_OUT;

	reg    [3:0] DATA_OUT;

	// �񓯊����Z�b�g
	always @(~RESET) begin
		DATA_OUT <= 4'b0;
	end

	// �f�[�^�X�V
	always @(posedge CLOCK) begin
		if (RESET) begin
			DATA_OUT <= DATA_WRITE ? DATA_IN : DATA_OUT;
		end
	end

endmodule
