module LFSR_TOP #(parameter n = 4)(
	input 	wire clk,
	input 	wire key_0,
	input 	wire sw_0,
	output 	wire [n-1:0] LEDs
	);
	
	wire rst_button;
	assign rst_button = ~key_0;
	
	wire ena_sw;
	assign ena_sw = sw_0;
	
	wire [n-1:0] reg_leds;
	wire clk_lfsr = clk;
	
//	pll u0 ( 
//		.areset(rst_button), 
//		.inclk0(clk), 
//		.c0(clk_lfsr)
//		);
	
	LFSR_n #(.n(n)) u1 (
        .clk(clk_lfsr),
        .rst(rst_button),
		.ena(ena_sw),
        .random(reg_leds)
		);
	
	assign LEDs = reg_leds;
	
endmodule