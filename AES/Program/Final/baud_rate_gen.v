/*
 This module creats the Baud Rate for the UART 
*/
module baud_rate_gen 
	#(
		parameter BAUD_DIV = 5208, 		// Divider for 9600 baud at 50 MHz clock
				  CONTER_BITS = 13		// Baud counter bits for 9600 baud at 50 MHz clock
    )
	(
		input clk,         				// FPGA clock
		input rst,						// Reset
		output reg sample_tick 			// Baud rate tick
	);

    reg [CONTER_BITS:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            sample_tick <= 0;
        end else begin
            if (counter == (BAUD_DIV - 1)) begin
                counter <= 0;
                sample_tick <= 1;
            end else begin
                counter <= counter + 1;
                sample_tick <= 0;
            end
        end
    end

endmodule
