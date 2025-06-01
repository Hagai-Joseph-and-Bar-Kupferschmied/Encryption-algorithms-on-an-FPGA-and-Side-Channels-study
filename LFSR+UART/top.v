module top #(
				parameter LFSR_size = 3,
				parameter UART_size = 8,
				baud_bits_counter = 13,
				baud_div = 5208				
			)
			(
				input clk, 			// FPGA clock
				input key0,			// Key 0 for reset
				input sw0,			// Switch 0 to enable
				output reg TxD		// UART TX data line
			);
		
	// Signals	
		reg transmit;
		wire [UART_size-1:0] data_in;
		wire TxDw;
		wire tick;
		wire tock;
		wire reset;
		wire LFSR_ena;
		wire [LFSR_size-1:0] LFSR_out;
		wire LFSR_clk;
		wire [LFSR_size-1:0] feedfunc;
		
	// Wire & Reg assignments
	
		assign reset = ~key0;
		assign LFSR_clk = tock;
		assign feedfunc = 3'b110;
		assign LFSR_ena = sw0;
		
		always @(*) begin
			TxD = TxDw;
		end
		
		always @(posedge tock or posedge reset)
		begin
			if (reset)
				transmit <= 0;
			else if (sw0)
				transmit <= 1;
			else
				transmit <= 0;
		end
		
		
	// Module connections
	
		transmitter_bau #(
							.data_size(UART_size)
						)
						TRANS   
						(
							.tick(tick), 
							.rst(reset),
							.transmit(transmit),
							.data(data_in),
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
	
		LFSR_n			#(
							.n(LFSR_size)
						)
						LFSR
						(
							.clk(LFSR_clk),
							.rst(reset),
							.ena(LFSR_ena),
							.feedfunc(feedfunc),
							.random(LFSR_out)
						);
							
		num_to_ASCII	#(
							.data_size(LFSR_size),
							.ascii_size(UART_size)
						)
						ASCII_DEC
						(
							.num_in(LFSR_out),
							.ascii(data_in)
						);
		
endmodule						 