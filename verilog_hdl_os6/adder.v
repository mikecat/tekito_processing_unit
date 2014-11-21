module ADDER(IN1,IN2,SEL,OUT,FLG);
	input  [3:0] IN1:
	input  [3:0] IN2;
	input  [1:0] SEL; // M[5:4]
	output [3:0] OUT;
	output       FLG;

	wire   [3:0] OUT;
	wire         FLG;

	wire   [3:0] ADDER_INPUT2;
	wire   [4:0] ADDER_OUTPUT;

	assign ADDER_INPUT2 = (SEL[1] ? 4'b0000 : IN1) ^
		{SEL[0],SEL[0],SEL[0],SEL[0]};
	assign ADDER_OUTPUT = {1'b0,IN1} + {1'b0,ADDER_INPUT2} + {4'b0,SEL[0]};
	assign OUT = ADDER_OUTPUT[3:0];
	assign FLG = ADDER_OUTPUT[4] ^ SEL[0];
endmodule
