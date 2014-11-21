module BIT_CALC(IN1,IN2,SEL,OUT,FLG_IN,FLG_OUT);
	input [3:0] IN1;
	input [3:0] IN2;
	input [1:0] SEL;
	output [3:0] OUT;
	input FLG_IN;
	output FLG_OUT;

	assign OUT = SEL[1] ?
		(SEL[0] ? (IN1 ^ IN2) : (IN1 & IN2)) :
		(SEL[0] ? (IN1 | IN2) : IN2);
	assign FLG_OUT = SEL[1] ? ~(OUT[3] | OUT[2] | OUT[1] | OUT[0]) :
		(SEL[0] ? 1'b1 : FLG_OUT);
endmodule
