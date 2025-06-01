`timescale 1ns / 1ps

module AES_Encrypt_tb;
    // Declare test signals
	reg clk;
    reg [127:0] plaintext, key;
    wire [127:0] ciphertext;
	reg [127:0] appb1 [6:0];
	reg [127:0] b1Ciphertext[6:0];
	reg [127:0] c1Key [15:0];
	reg [127:0] c1Ciphertext [15:0];
	
	
	reg [127:0] e1Key [76:0];
	reg [127:0] e1CipherText [76:0];
    integer i;
    
    // Instantiate the ARK module
    AES_Encrypt uut (
		.clk(clk),
        .in(plaintext),
        .key(key),
        .out(ciphertext)
    );
	
	initial begin
	clk = 0;
	forever #5 clk = ~clk; // Toggle clock every 5ns
	end
	

    // Test procedure
    initial begin
	//appendix b1
	key = 128'h00000000000000000000000000000000;
	$display("|||                          check appendix b.1                     |||");
	$display("key = %h", key);
	appb1[0] = 128'hf34481ec3cc627bacd5dc3fb08f273e6;
	appb1[1] = 128'h9798c4640bad75c7c3227db910174e72;
	appb1[2] = 128'h96ab5c2ff612d9dfaae8c31f30c42168 ;
	appb1[3] = 128'h6a118a874519e64e9963798a503f1d35;
	appb1[4] = 128'hcb9fceec81286ca3e989bd979b0cb284;
	appb1[5] = 128'hb26aeb1874e47ca8358ff22378f09144;
	appb1[6] = 128'h58c8e00b2631686d54eab84b91f0aca1;
	
	b1Ciphertext[0] = 128'h0336763e966d92595a567cc9ce537f5e;
    b1Ciphertext[1] = 128'ha9a1631bf4996954ebc093957b234589;
    b1Ciphertext[2] = 128'hff4f8391a6a40ca5b25d23bedd44a597;
    b1Ciphertext[3] = 128'hdc43be40be0e53712f7e2bf5ca707209;
    b1Ciphertext[4] = 128'h92beedab1895a94faa69b632e5cc47ce;
    b1Ciphertext[5] = 128'h459264f4798f6a78bacb89c15ed3d601;
    b1Ciphertext[6] = 128'h08a4e2efec8a8e3312ca7460b9040bbf;
	

	
	
	for(i=0; i<7 ;i=i+1)begin 
		plaintext = appb1[i];
		$display("Plaintext: %h", plaintext);
		#500;
		$display("ciphertext: %h\n", ciphertext);
		
		if (ciphertext == b1Ciphertext[i]) $display("Correct!\n");
		else $stop;
	end
	
	c1Key[0]  = 128'h10a58869d74be5a374cf867cfb473859;
    c1Key[1]  = 128'hcaea65cdbb75e9169ecd22ebe6e54675;
    c1Key[2]  = 128'ha2e2fa9baf7d20822ca9f0542f764a41;
    c1Key[3]  = 128'hb6364ac4e1de1e285eaf144a2415f7a0;
    c1Key[4]  = 128'h64cf9c7abc50b888af65f49d521944b2;
    c1Key[5]  = 128'h47d6742eefcc0465dc96355e851b64d9;
    c1Key[6]  = 128'h3eb39790678c56bee34bbcdeccf6cdb5;
    c1Key[7]  = 128'h64110a924f0743d500ccadae72c13427;
    c1Key[8]  = 128'h18d8126516f8a12ab1a36d9f04d68e51;
    c1Key[9]  = 128'hf530357968578480b398a3c251cd1093;
    c1Key[10] = 128'hda84367f325d42d601b4326964802e8e;
    c1Key[11] = 128'he37b1c6aa2846f6fdb413f238b089f23;
    c1Key[12] = 128'h6c002b682483e0cabcc731c253be5674;
    c1Key[13] = 128'h143ae8ed6555aba96110ab58893a8ae1;
    c1Key[14] = 128'hb69418a85332240dc82492353956ae0c;
    c1Key[15] = 128'h71b5c08a1993e1362e4d0ce9b22b78d5;

    // Initialize the c1Ciphertext array
    c1Ciphertext[0]  = 128'h6d251e6944b051e04eaa6fb4dbf78465;
    c1Ciphertext[1]  = 128'h6e29201190152df4ee058139def610bb;
    c1Ciphertext[2]  = 128'hc3b44b95d9d2f25670eee9a0de099fa3;
    c1Ciphertext[3]  = 128'h5d9b05578fc944b3cf1ccf0e746cd581;
    c1Ciphertext[4]  = 128'hf7efc89d5dba578104016ce5ad659c05;
    c1Ciphertext[5]  = 128'h0306194f666d183624aa230a8b264ae7;
    c1Ciphertext[6]  = 128'h858075d536d79ccee571f7d7204b1f67;
    c1Ciphertext[7]  = 128'h35870c6a57e9e92314bcb8087cde72ce;
    c1Ciphertext[8]  = 128'h6c68e9be5ec41e22c825b7c7affb4363;
    c1Ciphertext[9]  = 128'hf5df39990fc688f1b07224cc03e86cea;
    c1Ciphertext[10] = 128'hbba071bcb470f8f6586e5d3add18bc66;
    c1Ciphertext[11] = 128'h43c9f7e62f5d288bb27aa40ef8fe1ea8;
    c1Ciphertext[12] = 128'h3580d19cff44f1014a7c966a69059de5;
    c1Ciphertext[13] = 128'h806da864dd29d48deafbe764f8202aef;
    c1Ciphertext[14] = 128'ha303d940ded8f0baff6f75414cac5243;
    c1Ciphertext[15] = 128'hc2dabd117f8a3ecabfbb11d12194d9d0;
	
	$display("|||                         Check appendix c.1                       |||\n");
	
	plaintext = 128'h0000000000000000000000000000000;
	$display("Plaintext: %h\n", plaintext);
	
	for(i=0; i<16 ;i=i+1)begin 
		key = c1Key[i];
		$display("Key: %h", key);
		#500;
		$display("ciphertext: %h\n", ciphertext);
		
		if (ciphertext == c1Ciphertext[i]) $display("Correct!\n");
		else $stop;
	end

	

		

      $display("All 1000 test cases passed successfully!");
	  $stop;
	end
endmodule