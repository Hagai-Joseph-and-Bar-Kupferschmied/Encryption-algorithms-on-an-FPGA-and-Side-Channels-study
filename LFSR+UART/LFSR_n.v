// Fibonacci Linear Feedback Shift Register with n bits
module LFSR_n	#(
					parameter n = 4
				)
				(	input	wire			clk,		// Clock
					input	wire			rst,		// Reset
					input	wire			ena,		// Enable
					input	wire [n-1:0]	feedfunc,	// The feedback function
					output	reg	 [n-1:0]	random		// The Random number output
				);
	
	// Defining the feedback signal - XOR of specific bits, defiend by polynomial.
	reg feedback;

	integer i;
	// In order to achieve the largest cycle possible the polynomial needs to be a premitive one.
	always @ (random)	begin
		feedback = 1'b0;
		for (i = 0; i < n; i = i + 1) begin
			if (feedfunc[i])
				feedback = feedback ^ random[i];
		end
	end
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			random = 1; 							// Initialized to a non-zero value to aboid getting stuck in all-zero state
		else if (ena)
			random = {random[n-2:0],feedback};		// Shifting left and inderting the feedback bit
	end
endmodule