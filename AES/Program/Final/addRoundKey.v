module addRoundKey #(
						parameter CYPHER_SIZE = 128 //Key length in bits
					)
					(
						input clk,
						input rst,
						input ena,
						input [127:0] data,
						input [CYPHER_SIZE-1:0] key,
						output reg [127:0] out
					);

	always @(posedge clk or posedge rst) 
	begin
		if (rst)
			out <= 0;
		else if (ena)
			out <= key ^ data;
	end

endmodule