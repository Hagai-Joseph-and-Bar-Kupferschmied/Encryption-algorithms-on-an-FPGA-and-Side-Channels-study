	`timescale 1ns / 1ps

module encryptRoundTB;
	// Declare test signals
	reg clk;
	reg [127:0] Key;
	reg [127:0] data;
	wire [127:0] TBOut;
	wire [127:0] Y;
	wire [127:0] afterSubBytes;
	wire [127:0] afterShiftRows;
	wire [127:0] afterMixColumns;
	wire [127:0] afterAddroundKey;
	integer i;
		
	// Instantiate the ARK module
	encryptRound uut (
		.clk(clk),
		.key(Key),
		.in(data),
		.out(TBOut)
	); 
		
	subbytes sub (
		.clk(clk),
        .beforeSub(data),
        .afterSub(afterSubBytes)
    );
		
		shiftRows shift (
		.clk(clk),
        .in(afterSubBytes),
        .shifted(afterShiftRows)
    );
		
		mixColumns mix (
		.clk(clk),
        .state_in(afterShiftRows),
        .state_out(afterMixColumns)
    );
	
	addRoundKey add (
		.clk(clk),
        .data(afterMixColumns),
        .key(Key),
        .out(afterAddroundKey)
    );
	
	
	initial begin
	clk = 0;
	forever #5 clk = ~clk; // Toggle clock every 5ns
	end

		 

	// Test procedure
	initial begin

		Key = 128'hb692cf0b643dbdf1be9bc5006830b3fe;
		data = 128'hdf43a1dff0010b71c9dc77730af1d963;
		

		$display("Key: %h", Key);
		$display("data: %h", data);
		#40;
		$display("data after round: %h", TBOut);
		/*$display("after sbox: %h", afterSubBytes);
		$display("after shiftRows: %h", afterShiftRows);
		$display("after mix columns: %h", afterMixColumns);
		$display("should be out %h", afterAddroundKey); */
		
	end
endmodule