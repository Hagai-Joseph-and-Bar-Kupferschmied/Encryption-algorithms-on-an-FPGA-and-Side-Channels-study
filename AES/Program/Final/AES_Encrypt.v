module AES_Encrypt#(
						parameter CYPHER_SIZE = 128, //Key length in bits
						parameter Nr = 10,	// Number of rounds
						parameter Nk = 4	// Key Length in words (word = 32 bit)
					)
					(	
						input clk,
						input rst,
						input ena,
						input [127:0] data_in,	// The plain text to be encrypted
						input [CYPHER_SIZE-1:0] key, // The key of the encription
						output [127:0] cypher_out	// The cypher text	
					);
	
	// Signals
		wire [(128*(Nr+1))-1 :0] fullkeys;
		wire [127:0] states [Nr+1:0] ;
		wire [127:0] afterSubBytes;
		wire [127:0] afterShiftRows;


	keyExpansion #(
					.CYPHER_SIZE(CYPHER_SIZE),
					.Nk(Nk),
					.Nr(Nr)
				 )
				 ke
				 (
					.clk(clk),
					.rst(rst),
					.ena(ena),
					.key(key),
					.w(fullkeys)
				 );

	addRoundKey #(
					.CYPHER_SIZE(CYPHER_SIZE)
				)
				addrk1 
				(
					.clk(clk),
					.rst(rst),
					.ena(ena),
					.data(data_in),
					.key(fullkeys[((128*(Nr+1))-1)-:CYPHER_SIZE]),
					.out(states[0]) //First Round (only addRoundKey)
				); 

	genvar i;
	generate
		
		for(i=1; i<Nr ;i=i+1)begin : loop
			encryptRound #(CYPHER_SIZE) er (.clk(clk),.rst(rst),.ena(ena),.in(states[i-1]),.key(fullkeys[(((128*(Nr+1))-1)-128*i)-:128]),.out(states[i]));
		end
		subbytes sb (.clk(clk),.rst(rst),.ena(ena),.beforeSub(states[Nr-1]),.afterSub(afterSubBytes));	//Last round (no mixCollums)
		shiftRows sr (.clk(clk),.rst(rst),.ena(ena),.in(afterSubBytes),.shifted(afterShiftRows));
		addRoundKey #(CYPHER_SIZE) addrk2 (.clk(clk),.rst(rst),.ena(ena),.data(afterShiftRows),.key(fullkeys[CYPHER_SIZE-1:0]),.out(states[Nr]));
		assign cypher_out = states[Nr];
		

	endgenerate
endmodule