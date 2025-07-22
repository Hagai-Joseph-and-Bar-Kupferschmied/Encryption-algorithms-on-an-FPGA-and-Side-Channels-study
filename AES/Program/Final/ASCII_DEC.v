module num_to_ASCII #(
						parameter  data_size = 4,
						parameter ascii_size = 8
					)
					(
						input [data_size-1:0] num_in,
						output reg [ascii_size-1:0] ascii
					);
		
		always @(*) begin
			case (num_in)
				0: ascii <= 48;
				1: ascii <= 49;
				2: ascii <= 50;
				3: ascii <= 51;
				4: ascii <= 52;
				5: ascii <= 53;
				6: ascii <= 54;
				7: ascii <= 55;
				8: ascii <= 56;
				9: ascii <= 57;
				10: ascii <= 65;
				11: ascii <= 66;
				12: ascii <= 67;
				13: ascii <= 68;
				14: ascii <= 69;
				15: ascii <= 70;
				default: ascii <= 59;
			endcase
		end
endmodule