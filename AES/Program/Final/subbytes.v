module subbytes (
					input clk,
					input rst,
					input ena,
					input [127:0] beforeSub,
					output reg [127:0] afterSub
				);

	wire [127:0] temp;

	sbox s0(beforeSub[7:0], temp[7:0]);
	sbox s1(beforeSub[15:8], temp[15:8]);
	sbox s2(beforeSub[23:16], temp[23:16]);
	sbox s3(beforeSub[31:24], temp[31:24]);

	sbox s4(beforeSub[39:32], temp[39:32]);
	sbox s5(beforeSub[47:40], temp[47:40]);
	sbox s6(beforeSub[55:48], temp[55:48]);
	sbox s7(beforeSub[63:56], temp[63:56]);

	sbox s8(beforeSub[71:64], temp[71:64]);
	sbox s9(beforeSub[79:72], temp[79:72]);
	sbox s10(beforeSub[87:80], temp[87:80]);
	sbox s11(beforeSub[95:88], temp[95:88]);

	sbox s12(beforeSub[103:96], temp[103:96]);
	sbox s13(beforeSub[111:104], temp[111:104]);
	sbox s14(beforeSub[119:112], temp[119:112]);
	sbox s15(beforeSub[127:120], temp[127:120]);

	always@(posedge clk or posedge rst) 
	begin
		if (rst)
			afterSub <= 0;
		else if (ena)
			afterSub <= temp;
	end

endmodule