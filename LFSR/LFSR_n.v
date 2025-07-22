// Fibonacci Linear Feedback Shift Register with n bits
module LFSR_n#(parameter n = 4)(
	input	wire			clk,	// Clock
	input	wire			rst,	// Reset
	input	wire			ena,	// Enable
	output	reg	 [n-1:0]	random	// The Random number output
	);
	
	// Defining the feedback signal - XOR of specific bits, defiend by polynomial.
	// In order to achieve the largest cycle possible the polynomial needs to be a premitive one.
	wire feedback = random[n-1] ^ random[0];  // x^(n-1) + 1

		
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			random = 1'b1; 							// Initialized to a non-zero value to aboid getting stuck in all-zero state
		else if (ena)
			random = {random[n-2:0],feedback};		// Shifting left and inderting the feedback bit
	end
endmodule