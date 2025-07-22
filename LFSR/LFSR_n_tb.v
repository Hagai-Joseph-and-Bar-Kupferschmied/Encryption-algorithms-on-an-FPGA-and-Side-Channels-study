module LFSR_n_tb;
    parameter n = 4;
	reg clk;
    reg rst;
	reg ena;
    wire [n-1:0] out;

    // Instantiate the LFSR module
    LFSR_n #(.n(n)) md( .clk(clk), .rst(rst), .ena(ena), .random(out));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
		ena = 0;

        // Apply reset
        #10 rst = 0;
		#20 ena = 1;

        // Run simulation for a few cycles
        #10000 $stop;
    end

    // Monitor the LFSR output
    initial begin
        $monitor("random number = %b", out);
    end
endmodule
