/* Module transmits UART data from an FPGA
 Inputs: clk, the internal clock of the FPGA (50MHz)
 reset, resets the transmitter to it's initial state
 transmit, transmitter only operates if this bit is on
data, the data to be transmitted
 Output: TxD, the serial output
*/
module transmitter_bau	#(
						parameter data_size = 8
					)
					(
						input tick, 
						input rst, 
						input transmit,
						input [data_size-1:0] data,
						output reg TxD
					);
					
	reg[4:0] bitCounter; 	// counts the number of bits that have been sent
	reg state, nextState; 	// the current and next state of the transmitter
	reg[9:0] rightShiftReg;	// register used to hold the value that is currently being sent
	reg shift, load, clear; // determines the operations that should be done in the current state
	
	always @ (posedge tick or posedge rst)
	begin
		if (rst) begin
			state <= 0;
			bitCounter <= 0;
		end
		else begin
			state <= nextState;
			if (load)
			// Sets the data to be sent including a start bit (0), and a stop bit (1)
				rightShiftReg <= {1'b1, data[data_size-1:0], 1'b0};
			if (clear)
				bitCounter <= 0;
			if (shift) begin
				rightShiftReg <= rightShiftReg >> 1;
				bitCounter <= bitCounter + 1;
			end
		end
	end
	// state machine for the transmitter
	always @(state or bitCounter or transmit)
	begin
		load <= 0;
		shift <= 0;
		clear <= 0;
		TxD <= 1;

		case (state)
		 // initial state, if transmit is set initializes for data transmission
			0: begin
					if (transmit == 1) begin
						nextState <= 1;
						load <= 1;
						shift <= 0;
						clear <= 0;
					end
					else begin
						nextState <= 0;
						TxD <= 1;
					end
				end
		 // sets the operations for this state and stays here until all 10 bits have been sent
			1: begin
					if (bitCounter >= 9) begin
						nextState <= 0;
						clear <= 1;
					end
					else begin
						nextState <= 1;
						shift <= 1;
						TxD <= rightShiftReg[0];
					end
				end
		endcase
	end
endmodule