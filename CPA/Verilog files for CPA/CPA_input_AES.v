module CPA_input_AES #(
					CYPHER_SIZE = 128
				)
				(
					input clk_text_input,
					input reset,
					output [7:0] idx_to_hex,
					output reg [127:0] Text_to_AES,
					output reg [CYPHER_SIZE-1:0] cypher_key
				);

	reg [7:0] idx;
	
	always @(posedge clk_text_input or posedge reset)
	begin
		if (reset) begin
			Text_to_AES <= 0;
			cypher_key <= 0;
			idx <= 0;
		end
		else begin
			Text_to_AES <= plainText(idx);
			cypher_key <= 128'h6efe8f326ab4878d12e98a9f7e6eb1a9; // Perement Key!!
			idx <= idx + 1;
		end
	end
	
	assign idx_to_hex = idx - 1;
	
	function[127:0] plainText;
	input [7:0] idx; //
	begin
	 case(idx)
		0 : plainText = 128'h54b87fe5004b9c038b7f5f5bb86b91f5;
		1 : plainText = 128'h29419808a3b2c3e268d26cd0e7822da4;
		2 : plainText = 128'hcb9b02e478d5f309affdb810891aa77b;
		3 : plainText = 128'h3fa1c2768b2c631989b6ad543ca09ccd;
		4 : plainText = 128'h68b03fe64bfcebe3e639bdf563f91966;
		5 : plainText = 128'h21b2b67aba41ece7b23aa24485c666e6;
		6 : plainText = 128'hcd28a66acea83a86fd9c5b717ce976d8;
		7 : plainText = 128'hac373de28d31d7e1f3d40c45c712880b;
		8 : plainText = 128'habd3941c821ecb52ea77f6fd5a6748b7;
		9 : plainText = 128'h7c8c40e7b1d9258b864c80288fd2080d;
		10 : plainText = 128'hb3bedd7d7434e3bf69531319b8ce7892;
		11 : plainText = 128'h7dca464fd658b5cc5d95dd5ce0eb7b2d;
		12 : plainText = 128'h14fc2576391b96aea75c715c6f74e3df;
		13 : plainText = 128'h63af24ce43e60c886825a3ec1a40f8a8;
		14 : plainText = 128'h33953019f95a8e96f226d0ffc092faeb;
		15 : plainText = 128'hcdc682331d35362384a9f34d1cd0ecb3;
		16 : plainText = 128'h80d4577da31bc112f469239670241022;
		17 : plainText = 128'h86971486d6192042f62259f688e75328;
		18 : plainText = 128'h5e79ac74c922de31187b18747ba8a864;
		19 : plainText = 128'h05a629f81cdde98dc88df80234526d40;
		20 : plainText = 128'hafc875300a0dea12a2e05a2998581433;
		21 : plainText = 128'h13269839a169b94a9b3aeb892b5b415c;
		22 : plainText = 128'h3fc73e0c97658363838dad2dd4af8e29;
		23 : plainText = 128'hc7c5c1cadf2b7eb0d6deded942ee2133;
		24 : plainText = 128'h752bd3a2e93921e43934fd9aa14f1bf1;
		25 : plainText = 128'h40d9da2ee883fa9c94206708c635460b;
		26 : plainText = 128'h51b5ea8a9fb3c03fa67f325208bb9dd7;
		27 : plainText = 128'h281db5faa0d16740f4e9d5cdcad6ce3b;
		28 : plainText = 128'h99285146889adfeb29b99f01ac105100;
		29 : plainText = 128'h28f6f1038f26826f7492c8f5ceffc5aa;
		30 : plainText = 128'h47bbdf9296e07b716e0d8437ed95718e;
		31 : plainText = 128'h0f9241177e5c7fcbf90e1e0573f7bfa1;
		32 : plainText = 128'h748f278d8c55cb8f4117664675b81e37;
		33 : plainText = 128'h35403f99b7fd3f8c67dd26534f32bccc;
		34 : plainText = 128'h6a745971db9a915fb861a2b2f423dc69;
		35 : plainText = 128'hd5c6312ccd90ba0205e5733388f4dee7;
		36 : plainText = 128'h6dc0ca8c7e66ba472a322f86b8003c30;
		37 : plainText = 128'hefbcd28871a130754aae7913b2c501b6;
		38 : plainText = 128'h27f62de4a4381beba23d778ed7b8be70;
		39 : plainText = 128'hd7426c5e9398342d7bf92456d024f5da;
		40 : plainText = 128'h083146fbe8c499f02e81577ae5fc7622;
		41 : plainText = 128'h8f1e28b28fdd624f626db7bc9628d4dd;
		42 : plainText = 128'h6f4f09eba834f94a064168f4fbf8eb27;
		43 : plainText = 128'ha628a982d9f1845f7b6638351ad0b58b;
		44 : plainText = 128'h96d53e575bd003976da26dd11770b878;
		45 : plainText = 128'h747c0371e5b5b71d2275eed76e433c9b;
		46 : plainText = 128'hc18e743f1956425e7d0eb48f98550adb;
		47 : plainText = 128'ha48e0a175f351c1a4a66fa67e809af9e;
		48 : plainText = 128'h47d9638b0288f81f3a2ad7005d92f1a2;
		49 : plainText = 128'heb7a77a98922f68b4fb8b2405cc7621b;
		50 : plainText = 128'hbd69cc52a908482a272948d7619d5f90;
		51 : plainText = 128'hfc0c41292bd3de073caccf369fa5ba8e;
		52 : plainText = 128'hc296ed8db1e1729e49b6181d4cfcbac7;
		53 : plainText = 128'h2f00b4a5d3c91010720d2b9697e771f8;
		54 : plainText = 128'he7db4b2ce8a1118cdc903f7d8bd00c96;
		55 : plainText = 128'hc757c0addb2bbb688183e9facd441dde;
		56 : plainText = 128'heea587b6daed0e997df3a0eccadcfaf1;
		57 : plainText = 128'h60b1f7487036b36eb988ed22d2551675;
		58 : plainText = 128'hc31906bffe0266689a7f0b939e229dea;
		59 : plainText = 128'h3c2746dc62f1bc82644b42703da1057b;
		60 : plainText = 128'hba84f25402d095b0a82063d929ef3960;
		61 : plainText = 128'he9b0d26d426df332a798edbf6aba7e31;
		62 : plainText = 128'ha5776a757348ef30d965704841a7339d;
		63 : plainText = 128'hf085690044b105369a6bf5cd0c01d463;
		64 : plainText = 128'h7d5723d0a5e50c939888b4d07e667190;
		65 : plainText = 128'h4ab7b3ad21018c3480352770c7bd8852;
		66 : plainText = 128'hdf8aafc90198a35a9f19d93a3a00abdb;
		67 : plainText = 128'hcaf178d0751823be929a1cf70de09fd7;
		68 : plainText = 128'hfc633360296580cd13d4513efdc797d3;
		69 : plainText = 128'h4cb215897885f38d2666fe5efd674538;
		70 : plainText = 128'h330a3413826a057b60163e0c8130c77f;
		71 : plainText = 128'h199788cbb00f51d17af33cf3b5698628;
		72 : plainText = 128'h1fee79f8658f92377209d4ab65693796;
		73 : plainText = 128'h5a91d61ba3bef47dbeb10d96e879fe11;
		74 : plainText = 128'h0f9333dfe2cf77e75ab41c333e878dee;
		75 : plainText = 128'hd06e1f48635ce8941e586e8f25dbf54d;
		76 : plainText = 128'hac39c834116cebb43b6f188243dec6c1;
		77 : plainText = 128'h0cfb3b570bb531ca56c3acbb9c566bb6;
		78 : plainText = 128'h0523027d08f8a7feeb0c091f146c4b0b;
		79 : plainText = 128'hdf71c8362fe55b507fc000df87798231;
		80 : plainText = 128'hd7ee460a32afb8cc8843ec6b4d7d1181;
		81 : plainText = 128'he21ae641bde50dc621fa996f74663275;
		82 : plainText = 128'hf7749de5333c8c758ddc24c693b3409e;
		83 : plainText = 128'hfa360c8abd246a833624b8afa823ce87;
		84 : plainText = 128'hd595c0c3b5969745f53f688fd8417219;
		85 : plainText = 128'ha5c2e7d73ec1654a49cbdca47f469b8d;
		86 : plainText = 128'h632d57b96a1776906c97f0b1d82f542f;
		87 : plainText = 128'hba0363d15f26a26ea08923f9051488a0;
		88 : plainText = 128'h47f52e5e2b52ac5c282ea29f6894423d;
		89 : plainText = 128'had0caa90ff761a1c6165e9b9de1debbf;
		90 : plainText = 128'h3be72bde05ba5ad834e333ecbcf15f22;
		91 : plainText = 128'h014a1189a088163c52ec2b519d410576;
		92 : plainText = 128'hab6c9aa23deba4f85b456e4845570ff9;
		93 : plainText = 128'h29bfcce5f7a020a4bfdc918d2f3fcaf5;
		94 : plainText = 128'haecc7830b6a791dcaf0f6ad5fd8ab66c;
		95 : plainText = 128'he99b5ba00bcfb5d3f9807608d9f94f9e;
		96 : plainText = 128'hb3f93830f3d0f09b8d6c837c09962f47;
		97 : plainText = 128'h6a032a8eb621fc2082adef5287a63fc2;
		98 : plainText = 128'h31679da468f007fa9f977b35f4c45a7e;
		99 : plainText = 128'habb8b314089c5453c6d673c3e72dbe4d;
		100 : plainText = 128'hf4975a8eda4c15be9dc973dd82921958;
		default: plainText = 0;
	 endcase
	end
	endfunction
	
endmodule