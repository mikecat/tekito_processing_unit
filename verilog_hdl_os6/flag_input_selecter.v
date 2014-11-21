module FLAG_INPUT_SELECTER(IN_MAIN,IN_BIT,IN_ADDER,IN_NEGSHIFT,INST,OUT);
	input  IN_MAIN;
	input  IN_BIT;
	input  IN_ADDER;
	input  IN_NEGSIHFT;
	input  INST;
	output OUT;

	wire   OUT;

	assign OUT = INST[5] ? IN_MAIN : (
		INST[4] ? (
			INST[3] ? (
				INST[1] ? IN_MAIN :
					(INST[0] ? IN_NEGSHIFT : IN_ADDER)
			) : IN_ADDER
		) : IN_BIT
	);
endmodule
