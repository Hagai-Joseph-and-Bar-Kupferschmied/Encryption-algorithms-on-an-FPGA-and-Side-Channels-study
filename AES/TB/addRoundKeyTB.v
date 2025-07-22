`timescale 1ns / 1ps

module XOR_128bit_Testbench;
    // Declare test signals
    reg [127:0] A, B;
    wire [127:0] Y;
    integer i;
	reg clk;
    
    // Instantiate the ARK module
    addRoundKey uut (
		.clk(clk),
        .data(A),
        .key(B),
        .out(Y)
    );
	
	
	initial begin
	clk = 0;
	forever #5 clk = ~clk; // Toggle clock every 5ns
	end

    // Test procedure
    initial begin
        $display("Starting 1000 random test cases...");

        for (i = 0; i < 1000; i = i + 1) begin
            // Generate random 128-bit values
            A = {$random, $random, $random, $random};
			$display("A = %b", A);
            B = {$random, $random, $random, $random};
			$display("B = %b", B);
            
            // Wait for signals to propagate
            #10;
			$display("Y = %b:", Y);
            // Check correctness
            if (Y !== (A ^ B)) begin
                $display("Test failed at iteration %d", i);
                $display("A = %h", A);
                $display("B = %h", B);
                $display("Y = %h (Expected: %h)", Y, A ^ B);
                $stop;  // Halt simulation on failure
            end
			else begin 
				$display("Test passed iteration %d:", i);
			end
        end

        $display("All 1000 test cases passed successfully!");
	end
endmodule