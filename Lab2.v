
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Lab2(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);
	wire s_clk;
	wire s_clk1;
	wire s_clk2;
	reg latch_out = 1'b0;
	wire latch;

	SevenSeg T0(.H(HEX3), .NUM(8'd88));

	always @(negedge KEY[0])
		begin
			latch_out <= ~latch_out;	
		end

	assign latch = latch_out;
	assign LEDR[0] = latch_out;

	assign LEDR[1] = s_clk;

	reg [7:0] feb_day;
	
		always @(SW[9])
			begin
				if(SW[9] == 1)
					feb_day <= 8'd29;
				else
					feb_day <= 8'd28;
			end

	reg div_val = 1'b1;
	wire val;

	always @(negedge KEY[1])
		begin
			div_val <= ~div_val;
		end

	assign val = div_val;
	
	clock_divider #(1_000_000) U0(.clk(ADC_CLK_10), .reset_n(latch), .slower_clk(s_clk1));
	clock_divider #(5_000_000) U1(.clk(ADC_CLK_10), .reset_n(latch), .slower_clk(s_clk2));

	clock_choice L0(.select(val), .latch(latch), .s_clk(s_clk), .s1(s_clk1), .s2(s_clk2));

	counters C0(.clk(s_clk), .reset_n(latch), .feb_day(feb_day), .H0(HEX0), .H1(HEX1), .H2(HEX2), .H4(HEX4), .H5(HEX5), .KEY(KEY), .SW(SW));


endmodule
