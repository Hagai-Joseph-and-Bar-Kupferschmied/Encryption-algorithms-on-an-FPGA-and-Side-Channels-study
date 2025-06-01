module GFSbox_input_AES #(
					CYPHER_SIZE = 128
				)
				(
					input clk,
					input ena,
					input reset,
					output reg [127:0] plainText,
					output reg [CYPHER_SIZE-1:0] cypher_key
				);
	

	reg [2:0] idx;
	
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
	input [2:0] idx; 
	begin
	 case(idx)
		// GFSbox Test
		0: GenText = 128'hf34481ec3cc627bacd5dc3fb08f273e6;
		1: GenText = 128'h9798c4640bad75c7c3227db910174e72;
		2: GenText = 128'h96ab5c2ff612d9dfaae8c31f30c42168;
		3: GenText = 128'h6a118a874519e64e9963798a503f1d35;
		4: GenText = 128'hcb9fceec81286ca3e989bd979b0cb284;
		5: GenText = 128'hb26aeb1874e47ca8358ff22378f09144;
		6: GenText = 128'h58c8e00b2631686d54eab84b91f0aca1;
		default: GenText = 0;
	  endcase
	  end
	endfunction
	
	function[CYPHER_SIZE-1:0] GenCKey;
	input [2:0] idx;
	begin
	 case(idx)
		// GFSbox Test
		0: GenCKey = 128'h00000000000000000000000000000000;
		1: GenCKey = 128'h00000000000000000000000000000000;
		2: GenCKey = 128'h00000000000000000000000000000000;
		3: GenCKey = 128'h00000000000000000000000000000000;
		4: GenCKey = 128'h00000000000000000000000000000000;
		5: GenCKey = 128'h00000000000000000000000000000000;
		6: GenCKey = 128'h00000000000000000000000000000000;
		default: GenCKey = 0;
	  endcase
	  end
	endfunction
	
endmodule