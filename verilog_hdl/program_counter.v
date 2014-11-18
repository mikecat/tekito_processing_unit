/* �v���O�����J�E���^
 * RESET      : �񓯊����Z�b�g 0�Ń��Z�b�g
 * CLOCK      : �N���b�N �����オ��ŃJ�E���g/���[�h
 * ADDR_IN    : ���[�h����l
 * ADDR_WRITE : �N���b�N�����オ�莞0�Ȃ�C���N�������g�A1�Ȃ烍�[�h
 * ADDR_OUT   : �A�h���X�o��
 */
module PROGRAM_COUNTER (RESET, CLOCK, ADDR_IN, ADDR_WRITE, ADDR_OUT);
	input        RESET;
	input        CLOCK;
	input  [5:0] ADDR_IN;
	input        ADDR_WRITE;
	output [5:0] ADDR_OUT;

	reg    [5:0] ADDR_OUT;

	// �񓯊����Z�b�g
	always @(~RESET) begin
		ADDR_OUT <= 6'b0;
	end

	// �J�E���g
	always @(posedge CLOCK) begin
		if (RESET) begin
			ADDR_OUT <= ADDR_WRITE ? ADDR_IN : (ADDR_OUT + 6'b1);
		end
	end

endmodule
