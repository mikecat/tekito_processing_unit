module REG_INPUT_SELECTER(IN_MAIN,IN_BIT,IN_ADDER,IN_EXT,IN_NEGSHIFT,INST,OUT);
	input  [3:0] IN_MAIN;
	input  [3:0] IN_BIT;
	input  [3:0] IN_ADDER;
	input  [3:0] IN_EXT;
	input  [3:0] IN_NEGSIHFT;
	input  [5:0] INST;
	output [3:0] OUT;

	wire   [3:0] OUT;

	assign OUT = INST[5] ?
		(INST[4] ? IN_MAIN : INST[3:0]) : (
			INST[4] ? (
				INST[3] ? (
					INST[1] ?
						(INST[0] ? IN_MAIN : IN_EXT) :
						(INST[0] ? IN_NEGSHIFT : IN_ADDER)
				) : IN_ADDER
			) : IN_BIT
		);
endmodule
