module top_AES_input#(
						parameter UART_size = 8,
						parameter CYPHER_SIZE = 128,
						parameter Nr = 10,
						parameter Nk = 4,
						parameter TO_ASCII_SIZE = 4,
						parameter baud_bits_counter = 13,
						parameter baud_div = 5208	
					)
					(
						input clk,				// FPGA clk
						input key0,				// Reset button
						input sw0,				// Eneable switch
						output reg [26:0] leds, // 26 LEDs output - to make sure they turrn off!
						output reg TxD			// UART TX data line
					);


	// Signals
		wire [UART_size-1:0] data_to_trans;
		wire TxDw;
		wire tick;
		wire tock;
		wire reset;
		wire aes_clk;
		wire aes_rst;
		wire aes_ena;
		wire [CYPHER_SIZE-1:0] aes_out;
		wire [TO_ASCII_SIZE-1:0]ascii_in;
		wire [CYPHER_SIZE-1:0] cypher_key_input;
		wire [127:0] plainText_input;
		reg [5:0] aes_idx;
		reg [CYPHER_SIZE-1:0] cypher_key;
		reg [CYPHER_SIZE-1:0] data_in;
		reg [2:0] counter;
		reg transmit;
		reg uart_flag;
		reg [6:0] input_clk;

	// Wire & Reg assignments
		assign reset = ~key0;
		assign aes_clk = tock;
		assign aes_ena = sw0;
		assign aes_rst = ~key0;
		assign ascii_in = (sw0&&(~reset)) ? aes_out[CYPHER_SIZE-1 - 4*aes_idx -: 4] : 4'b0;
		
		always @(*) 
		begin
			TxD = TxDw;
			leds = 26'd0;
			data_in = plainText_input;
			cypher_key = cypher_key_input;
		end
				
		always @(posedge tock or posedge reset)
		begin
			if (reset) begin
				transmit <= 0;
				aes_idx <= 0;
				input_clk <= 0;
			end
			else if (sw0) begin
				transmit <= 1;
				aes_idx <= aes_idx + 1;
				input_clk <= input_clk + 1;
			end
			else begin
				transmit <= 0;
				input_clk <= input_clk + 1;
			end
		end

	// Module connections
	
		AES_Encrypt 	#(
							.CYPHER_SIZE(CYPHER_SIZE),
							.Nr(Nr),
							.Nk(Nk)
						)
						aes_inst 
						(
							.clk(aes_clk),
							.rst(aes_rst),
							.ena(aes_ena),
							.data_in(data_in),
							.key(cypher_key),
							.cypher_out(aes_out)
						);
	VarTxt_input_AES	#(							// Change for different tests: GFSbox_input_AES, KeySbox_input_AES, VarTxt_input_AES, VarKey_input_AES
							.CYPHER_SIZE(CYPHER_SIZE)
						)
						aes_input
						(
							.clk(input_clk[6]),
							.ena(sw0),
							.reset(reset),
							.plainText(plainText_input),
							.cypher_key(cypher_key_input)
						);
		transmitter_bau #(
							.data_size(UART_size)
						)
						TRANS   
						(
							.tick(tick), 
							.rst(reset),
							.transmit(transmit),
							.data(data_to_trans),
							.TxD(TxDw)
						);
						 
								 
		baud_rate_gen	#(
							.BAUD_DIV(baud_div),
							.CONTER_BITS(baud_bits_counter)
						)
						BAUD
						(
							.clk(clk),
							.rst(reset),
							.sample_tick(tick)
						);

		clk_delay		#(
							.delay_length(UART_size+2)
						)
						DELAY
						(
							.clk(tick),
							.rst(reset),
							.delay(tock)
						);
								
		num_to_ASCII	#(
							.data_size(TO_ASCII_SIZE),
							.ascii_size(UART_size)
						)
						ASCII_DEC
						(
							.num_in(ascii_in),
							.ascii(data_to_trans)
						);
	
endmodule
