module SevenSegmentDigits (
							input [7:0] idx,
							output reg [6:0] Hex0,
							output reg [6:0] Hex1
						  );
	
	always @(*) begin
		Hex0 = ToHexSeg(idx[3:0]);
		Hex1 = ToHexSeg(idx[7:4]);
	end
	
	
	
	function[6:0] ToHexSeg;
	input [3:0] num;
	begin
	 case(num)
		0: ToHexSeg = 7'b1000000;
		1: ToHexSeg = 7'b1111001;
		2: ToHexSeg = 7'b0100100;
		3: ToHexSeg = 7'b0110000;
		4: ToHexSeg = 7'b0011001;
		5: ToHexSeg = 7'b0010010;
		6: ToHexSeg = 7'b0000010;
		7: ToHexSeg = 7'b1111000;
		8: ToHexSeg = 7'b0000000;
		9: ToHexSeg = 7'b0011000;
		10: ToHexSeg = 7'b0001000;
		11: ToHexSeg = 7'b0000011;
		12: ToHexSeg = 7'b1000110;
		13: ToHexSeg = 7'b0100001;
		14: ToHexSeg = 7'b0000110;
		15: ToHexSeg = 7'b0001110;
		default: ToHexSeg = 7'b1111111;
	 endcase
	end
	endfunction
	
endmodule		
		