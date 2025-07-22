module clk_delay	#(
						parameter delay_length = 10
					)
					(	input clk,			// Input Clock 
						input rst,			// Reset
						output reg delay	// Output clock after delay
					);

	reg [delay_length-1:0] delay_counter;		// Counter for delay
	
	always @ (posedge clk or posedge rst) 
	begin
		if (rst) begin
			delay_counter <= 0; // Initialized the delay register to 0
			delay <= 0;
		end
		else begin 
			if (delay_counter >= delay_length) begin // If reached to delay length start to count again 
				delay <= 1'b1;
				delay_counter <= 0;
			end
			else begin
				delay <= 1'b0; // If delay not reached keep counting
				delay_counter <= delay_counter + 1;
			end
		end
	end
endmodule