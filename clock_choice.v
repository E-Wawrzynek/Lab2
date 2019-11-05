module clock_choice(

    input                       select,

    input                        latch,
    output                       s_clk,

	//////////// KEY //////////
	input 		     [1:0]		KEY
);

    parameter div_hold = 0;

    clock_divider #(div_hold) U0(.clk(ADC_CLK_10), .reset_n(latch), .slower_clk(s_clk));
	clock_divider #(div_hold) U1(.clk(ADC_CLK_10), .reset_n(latch), .slower_clk(s_clk));

    always @(select)
        begin
            case(select)
                1: div_hold = 1_000_000;
                0: div_hold = 5_000_000;
            endcase 
        end

endmodule