`timescale 1ns / 1ps

module subbedbytesTB;
	reg clk;
    reg [127:0] A;
    wire [127:0] Y;
    integer i;
    
    // Instantiate the ARK module
    subbytes sub (
		.clk(clk),
        .beforeSub(A),
        .afterSub(Y)
    );
	
	initial begin
	clk = 0;
	forever #5 clk = ~clk; // Toggle clock every 5ns
	end
	
    // Test procedure
    initial begin
        $display("Starting test...");
        #10;
		for  (i = 0; i < 10; i = i + 1) begin
		A = { $random, $random, $random, $random};
        // Wait for signals to propagate
        #10;
		$display("A = %h, Y = %h:",A, Y);
		end
	end
endmodule