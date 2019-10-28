module monthday(
    input                       clk,
    input                       reset_n,
    input                       bin_val,

	output           [7:0]      H0,
    output           [7:0]      H1,
    output           [7:0]      H2,
    output           [7:0]      H3,
	output		     [7:0]		H4,
	output		     [7:0]		H5,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

always @(posedge clk)
    begin
    end

endmodule