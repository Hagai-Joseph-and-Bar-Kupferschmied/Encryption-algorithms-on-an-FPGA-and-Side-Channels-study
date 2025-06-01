`timescale 1ns / 1ps

module KeyExpansionTB;
    // Declare test signals
	reg clk;
    reg [127:0] Key;
    wire [1407:0] ExpandedKey;
	reg [31:0] test [0:43];
    integer i;
    
    // Instantiate the ARK module
    keyExpansion uut (
		.clk(clk),
        .key(Key),
        .w(ExpandedKey)
    );
	
/*	task print_matrix(input [127:0] mat);
    begin
        $display("  %2h %2h %2h %2h", mat[127:120], mat[95:88], mat[63:56], mat[31:24]);
        $display("  %2h %2h %2h %2h", mat[119:112], mat[87:80], mat[55:48], mat[23:16]);
        $display("  %2h %2h %2h %2h", mat[111:104], mat[79:72], mat[47:40], mat[15:8]);
        $display("  %2h %2h %2h %2h\n", mat[103:96], mat[71:64], mat[39:32], mat[7:0]);
    end
endtask */

	initial begin
	clk = 0;
	forever #5 clk = ~clk; // Toggle clock every 5ns
	end

    // Test procedure
    initial begin

    Key = 128'h5468617473206D79204B756E67204675;
	test[0] = 32'h54686174; // "That"
    test[1] = 32'h73206d79; // "s my"
    test[2] = 32'h204b756e; // " Kung"
    test[3] = 32'h67204675; // "gFu"

    // Round 1
    test[4] = 32'he232fcf1; // "A1e"
    test[5] = 32'h91129188; // "5e1"
    test[6] = 32'hb159e4e6; // "e4E6"
    test[7] = 32'hd679a293; // "d79a"
    
    // Round 2
    test[8] = 32'h56082007; // "56 08"
    test[9] = 32'hc71ab18f; // "C7 1A"
    test[10] = 32'h76435569; // "76 43"
    test[11] = 32'ha03af7fa; // "A0 3A"
    
    // Round 3
    test[12] = 32'hd2600de7; // "D2 60"
    test[13] = 32'h157abc68; // "15 7A"
    test[14] = 32'h6339e901; // "63 39"
    test[15] = 32'hc3031efb; // "C3 03"

    // Round 4
    test[16] = 32'ha11202c9; // "A1 12"
    test[17] = 32'hb468bea1; // "B4 68"
    test[18] = 32'hd75157a0; // "D7 51"
    test[19] = 32'h1452495b; // "A0 14"

    // Round 5
    test[20] = 32'hb1293b33; // "B1 29"
    test[21] = 32'h05418592; // "05 41"
    test[22] = 32'hd210d232; // "D2 10"
    test[23] = 32'hc6429b69; // "C6 42"
    
    // Round 6
    test[24] = 32'hbd3dc287; // "BD 3D"
    test[25] = 32'hb87c4715; // "B8 7C"
    test[26] = 32'h6a6c9527; // "6A 6C"
    test[27] = 32'hac2e0e4e; // "AC 2E"
    
    // Round 7
    test[28] = 32'hcc96ed16; // "CC 96"
    test[29] = 32'h74eaaa03; // "74 EA"
    test[30] = 32'h1e863f24; // "1E 86"
    test[31] = 32'hb2a8316a; // "B2 A8"
    
    // Round 8
    test[32] = 32'h8e51ef21; // "8E 51"
    test[33] = 32'hfabb4522; // "FA BB"
    test[34] = 32'he43d7a06; // "E4 3D"
    test[35] = 32'h56954b6c; // "56 95"
    
    // Round 9
    test[36] = 32'hbfe2bf90; // "BF E2"
    test[37] = 32'h4559fab2; // "45 59"
    test[38] = 32'ha16480b4; // "A1 64"
    test[39] = 32'hf7f1cbd8; // "F7 F1"
    
    // Round 10
    test[40] = 32'h28fddef8; // "28 FD"
    test[41] = 32'h6da4244a; // "6D A4"
    test[42] = 32'hccc0a4fe; // "CC C0"
    test[43] = 32'h3b316f26; // "3B 31"

       // $display("Starting 1000 random test cases...");

//        for (i = 0; i < 5; i = i + 1) begin
            // Generate random 128-bit values
  //          A = {$random, $random, $random, $random};
//			A = states[i];
			$display("Key: %h", Key);
		//	print_matrix(A);
            // Wait for signals to propagate
            #10;
			$display("Each w:");
		//	print_matrix(Y);
		for (i = 0; i < 44; i = i + 1) begin
			$display("w[%0d] = %h", i, ExpandedKey[(((128*(11))-1)-32*i)-:32]);
			if (ExpandedKey[(((128*(11))-1)-32*i)-:32] != test[i]) begin
				$display("mismatch on w[%0d]!!!!", i);
				$stop;
			$display("\n\n\n");
			end
			
		end
		$display("All test cases passed successfully!");
        
		//end

        
	end
endmodule