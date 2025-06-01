module shiftRows(
					input clk,
					input rst,
					input ena,
					input [127:0] in,
					output reg [127:0] shifted
				);
				
	always@(posedge clk or posedge rst)
	begin
		if (rst)
			shifted <= 0;
		else if (ena) begin
			// First row (r = 0) is not shifted
			 shifted[127:120] <= in[127:120];
			 shifted[95:88] <= in[95:88];
			 shifted[63:56] <= in[63:56];
			 shifted[31:24] <= in[31:24];
			
			// Second row (r = 1) is cyclically left shifted by 1 offset
			 shifted[119:112] <= in[87:80];
			 shifted[87:80] <= in[55:48];
			 shifted[55:48] <= in[23:16];
			 shifted[23:16] <= in[119:112];

			// 3rd row shift 2
			 shifted[111:104] <= in[47:40];
			 shifted[79:72] <= in[15:8];
			 shifted[47:40] <= in[111:104];
			 shifted[15:8] <= in[79:72];

			// 4th row shift 3
			 shifted[103:96] <= in[7:0];
			 shifted[71:64] <= in[103:96];
			 shifted[39:32] <= in[71:64];
			 shifted[7:0] <= in[39:32];
		end
	end
endmodule