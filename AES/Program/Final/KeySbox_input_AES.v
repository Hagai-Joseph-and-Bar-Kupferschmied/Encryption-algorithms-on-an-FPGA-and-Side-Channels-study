module KeySbox_input_AES #(
					CYPHER_SIZE = 128
				)
				(
					input clk,
					input ena,
					input reset,
					output reg [127:0] plainText,
					output reg [CYPHER_SIZE-1:0] cypher_key
				);
	

	reg [4:0] idx; 
	
	always @(posedge clk or posedge reset)
	begin
		if (reset) begin
			plainText <= 0;
			cypher_key <= 0;
			idx <= 0;
		end
		else if (ena) begin
			plainText <= GenText(idx);
			cypher_key <= GenCKey(idx);
			idx <= idx + 1;
		end
	end


	function[127:0] GenText;
	input [4:0] idx;
	begin
	 case(idx)
		// KeySbox Test
		0: GenText = 128'h00000000000000000000000000000000;
		1: GenText = 128'h00000000000000000000000000000000;
		2: GenText = 128'h00000000000000000000000000000000;
		3: GenText = 128'h00000000000000000000000000000000;
		4: GenText = 128'h00000000000000000000000000000000;
		5: GenText = 128'h00000000000000000000000000000000;
		6: GenText = 128'h00000000000000000000000000000000;
		7: GenText = 128'h00000000000000000000000000000000;
		8: GenText = 128'h00000000000000000000000000000000;
		9: GenText = 128'h00000000000000000000000000000000;
		10: GenText = 128'h00000000000000000000000000000000;
		11: GenText = 128'h00000000000000000000000000000000;
		12: GenText = 128'h00000000000000000000000000000000;
		13: GenText = 128'h00000000000000000000000000000000;
		14: GenText = 128'h00000000000000000000000000000000;
		15: GenText = 128'h00000000000000000000000000000000;
		16: GenText = 128'h00000000000000000000000000000000;
		17: GenText = 128'h00000000000000000000000000000000;
		18: GenText = 128'h00000000000000000000000000000000;
		19: GenText = 128'h00000000000000000000000000000000;
		20: GenText = 128'h00000000000000000000000000000000;
		default: GenText = 0;
	  endcase
	  end
	endfunction
	
	function[CYPHER_SIZE-1:0] GenCKey;
	input [4:0] idx;
	begin
	 case(idx)
		// KeySbox Test
		0: GenCKey = 128'h10a58869d74be5a374cf867cfb473859;
		1: GenCKey = 128'hcaea65cdbb75e9169ecd22ebe6e54675;
		2: GenCKey = 128'ha2e2fa9baf7d20822ca9f0542f764a41;
		3: GenCKey = 128'hb6364ac4e1de1e285eaf144a2415f7a0;
		4: GenCKey = 128'h64cf9c7abc50b888af65f49d521944b2;
		5: GenCKey = 128'h47d6742eefcc0465dc96355e851b64d9;
		6: GenCKey = 128'h3eb39790678c56bee34bbcdeccf6cdb5;
		7: GenCKey = 128'h64110a924f0743d500ccadae72c13427;
		8: GenCKey = 128'h18d8126516f8a12ab1a36d9f04d68e51;
		9: GenCKey = 128'hf530357968578480b398a3c251cd1093;
		10: GenCKey = 128'hda84367f325d42d601b4326964802e8e;
		11: GenCKey = 128'he37b1c6aa2846f6fdb413f238b089f23;
		12: GenCKey = 128'h6c002b682483e0cabcc731c253be5674;
		13: GenCKey = 128'h143ae8ed6555aba96110ab58893a8ae1;
		14: GenCKey = 128'hb69418a85332240dc82492353956ae0c;
		15: GenCKey = 128'h71b5c08a1993e1362e4d0ce9b22b78d5;
		16: GenCKey = 128'he234cdca2606b81f29408d5f6da21206;
		17: GenCKey = 128'h13237c49074a3da078dc1d828bb78c6f;
		18: GenCKey = 128'h3071a2a48fe6cbd04f1a129098e308f8;
		19: GenCKey = 128'h90f42ec0f68385f2ffc5dfc03a654dce;
		20: GenCKey = 128'hfebd9a24d8b65c1c787d50a4ed3619a9;
		default: GenCKey = 0;
	  endcase
	  end
	endfunction
	
endmodule