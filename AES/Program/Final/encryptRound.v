module encryptRound #(
						CYPHER_SIZE = 128
					)
					(
						input clk,
						input rst,
						input ena,
						input [127:0] in,
						input [127:0] key,
						output [127:0] out
					);

	wire [127:0] afterSubBytes;
	wire [127:0] afterShiftRows;
	wire [127:0] afterMixColumns;
	wire [127:0] afterAddroundKey;

	subbytes s (.clk(clk),.rst(rst),.ena(ena),.beforeSub(in),.afterSub(afterSubBytes));
	shiftRows r (.clk(clk),.rst(rst),.ena(ena),.in(afterSubBytes),.shifted(afterShiftRows));
	mixColumns m (.clk(clk),.rst(rst),.ena(ena),.state_in(afterShiftRows),.state_out(afterMixColumns));
	addRoundKey #(CYPHER_SIZE) b (.clk(clk),.rst(rst),.ena(ena),.data(afterMixColumns),.key(key),.out(out));
			
endmodule