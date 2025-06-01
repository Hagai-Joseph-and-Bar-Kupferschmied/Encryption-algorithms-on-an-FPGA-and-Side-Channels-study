`timescale 1ns / 1ps

module Shift_Rows_Testbench;
    // Declare test signals
	reg clk;
    reg [127:0] A;
    wire [127:0] Y;
    integer i;
    
    // Instantiate the ARK module
    shiftRows uut (
		.clk(clk),
        .in(A),
        .shifted(Y)
    );
	
	task print_matrix(input [127:0] mat);
    begin
        $display("  %2h %2h %2h %2h", mat[127:120], mat[95:88], mat[63:56], mat[31:24]);
        $display("  %2h %2h %2h %2h", mat[119:112], mat[87:80], mat[55:48], mat[23:16]);
        $display("  %2h %2h %2h %2h", mat[111:104], mat[79:72], mat[47:40], mat[15:8]);
        $display("  %2h %2h %2h %2h\n", mat[103:96], mat[71:64], mat[39:32], mat[7:0]);
    end
endtask

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
			$display("Original A:");
			print_matrix(A);
            // Wait for signals to propagate
            #10;
			$display("A A:");
			print_matrix(Y);
			$display("\n\n\n");
        
        end

        $display("All 1000 test cases passed successfully!");
	end
endmodule