module PROGRAM_COUNTER(IN,IN_ENABLE,RESET,CLK,OUT);
	input  [5:0] IN;
	input        IN_ENABLE;
	input        RESET;
	input        CLK;
	output [5:0] OUT;

	reg    [5:0] OUT;

	always @(~RESET) begin
		OUT <= 6'b0;
	end

	always @(posedge CLK) begin
		OUT <= RESET ? (IN_ENABLE ? IN : (OUT + 6'b1)) : 6'b0;
	end
endmodule
