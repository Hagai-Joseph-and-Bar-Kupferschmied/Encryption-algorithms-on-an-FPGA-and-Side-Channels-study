module mixColumns	(
						input clk,
						input rst,
						input ena,
						input [127:0] state_in,    // input state
						output reg [127:0] state_out // output state (registered)
					);

    // Function to multiply by 2 in GF(2^8)
    function [7:0] mb2; 
        input [7:0] x;
        begin
            if(x[7] == 1) 
                mb2 = ((x << 1) ^ 8'h1b); // shift and XOR with 0x1b if MSB is 1
            else 
                mb2 = x << 1; // simple shift if MSB is 0
        end
    endfunction

    // Function to multiply by 3 in GF(2^8)
    function [7:0] mb3;
        input [7:0] x;
        begin
            mb3 = mb2(x) ^ x; // multiply by 2 and XOR with the original value to get multiplication by 3
        end
    endfunction

    // Internal state for calculation (to hold values before the clock edge)
    wire [127:0] state_reg;

    // Always block to calculate the mixColumns function
        // Process each column of the state
        assign state_reg[127:120] = mb2(state_in[127:120]) ^ mb3(state_in[119:112]) ^ state_in[111:104] ^ state_in[103:96];
        assign state_reg[119:112] = state_in[127:120] ^ mb2(state_in[119:112]) ^ mb3(state_in[111:104]) ^ state_in[103:96];
        assign state_reg[111:104] = state_in[127:120] ^ state_in[119:112] ^ mb2(state_in[111:104]) ^ mb3(state_in[103:96]);
        assign state_reg[103:96]  = mb3(state_in[127:120]) ^ state_in[119:112] ^ state_in[111:104] ^ mb2(state_in[103:96]);

        assign state_reg[95:88]   = mb2(state_in[95:88]) ^ mb3(state_in[87:80]) ^ state_in[79:72] ^ state_in[71:64];
        assign state_reg[87:80]   = state_in[95:88] ^ mb2(state_in[87:80]) ^ mb3(state_in[79:72]) ^ state_in[71:64];
        assign state_reg[79:72]   = state_in[95:88] ^ state_in[87:80] ^ mb2(state_in[79:72]) ^ mb3(state_in[71:64]);
        assign state_reg[71:64]   = mb3(state_in[95:88]) ^ state_in[87:80] ^ state_in[79:72] ^ mb2(state_in[71:64]);

        assign state_reg[63:56]   = mb2(state_in[63:56]) ^ mb3(state_in[55:48]) ^ state_in[47:40] ^ state_in[39:32];
        assign state_reg[55:48]   = state_in[63:56] ^ mb2(state_in[55:48]) ^ mb3(state_in[47:40]) ^ state_in[39:32];
        assign state_reg[47:40]   = state_in[63:56] ^ state_in[55:48] ^ mb2(state_in[47:40]) ^ mb3(state_in[39:32]);
        assign state_reg[39:32]   = mb3(state_in[63:56]) ^ state_in[55:48] ^ state_in[47:40] ^ mb2(state_in[39:32]);

        assign state_reg[31:24]   = mb2(state_in[31:24]) ^ mb3(state_in[23:16]) ^ state_in[15:8] ^ state_in[7:0];
        assign state_reg[23:16]   = state_in[31:24] ^ mb2(state_in[23:16]) ^ mb3(state_in[15:8]) ^ state_in[7:0];
        assign state_reg[15:8]    = state_in[31:24] ^ state_in[23:16] ^ mb2(state_in[15:8]) ^ mb3(state_in[7:0]);
        assign state_reg[7:0]     = mb3(state_in[31:24]) ^ state_in[23:16] ^ state_in[15:8] ^ mb2(state_in[7:0]);

    // Assign the result to the output
    always @(posedge clk or posedge rst) begin
        if (rst)
			state_out <= 0;
		else if (ena)
			state_out <= state_reg; // Register the output
    end

endmodule
