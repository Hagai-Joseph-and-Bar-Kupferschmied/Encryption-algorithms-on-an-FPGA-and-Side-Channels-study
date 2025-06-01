module CPA_input_AES #(
					CYPHER_SIZE = 128
				)
				(
					input clk,
					input ena,
					input reset,
					output reg [127:0] plainText,
					output reg [CYPHER_SIZE-1:0] cypher_key
				);
	

	wire [127:0] GenText; 
	wire [127:0] LFSR_feedfunc;
	wire LFSR_clk;
	wire LFSR_rst;
	wire LFSR_ena;
	
	assign LFSR_clk = clk;
	assign LFSR_ena = ena;
	assign LFSR_rst = reset;
	assign LFSR_feedfunc = 128'h00000000000000000000000014000003;
	
	LFSR_n		#(
					.n(128)
				)
				lfsr_n_text
				(
					.clk(LFSR_clk),
					.rst(LFSR_rst),
					.ena(LFSR_ena),
					.feedfunc(LFSR_feedfunc),
					.random(GenText)
				);	
	
	always @(posedge clk or posedge reset)
	begin
		if (reset) begin
			plainText <= 0;
			cypher_key <= 0;
		end
		else if (ena) begin
			plainText <= GenText;
			cypher_key <= 1; // Perement Key!!
		end
	end
	
endmodule