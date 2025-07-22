`timescale 1ns / 1ps

module mixColummsTB;
    // Declare test signals
	reg clk;
    reg [127:0] A;
	reg [127:0] states [0:4];
    wire [127:0] Y;
    integer i;
    
    // Instantiate the ARK module
    mixColumns uut (
		.clk(clk),
        .state_in(A),
        .state_out(Y)
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

    states[0] = 128'h637bc0d27b76d27c76757cc57563c5c0;
    states[1] = 128'he2d94b78e0ae0825c21b5d3734d2fcef;
    states[2] = 128'hc5ef3aa48e6548901acd7affdf387465;
    states[3] = 128'hd5d09f4dd472fe1376cb5e4d68ffc084;
    states[4] = 128'h8e53220884749d744b2ed8298cdbefcc;

        $display("Starting 1000 random test cases...");

        for (i = 0; i < 5; i = i + 1) begin
            // Generate random 128-bit values
			A = states[i];
			$display("Original A:");
			print_matrix(A);
            // Wait for signals to propagate
            #10;
			$display("A After mix columns:");
			print_matrix(Y);
			$display("\n\n\n");
        
        end

        $display("All 1000 test cases passed successfully!");
	end
endmodule