module daydisplay(
    // input                       clk,
    // input                       reset_n,
    input            [7:0]      day_cntr,

    output           [7:0]      H0,
    output           [7:0]      H1

	//////////// LED //////////
	// output		     [9:0]		LEDR,

	// //////////// SW //////////
	// input 		     [9:0]		SW
);

    reg [7:0] ones_digit;
    reg [7:0] tens_digit;

    always @(day_cntr)begin
            case (day_cntr)
                31: begin
                    tens_digit = 3;
                    ones_digit = 1;
                end
                30: begin
                    tens_digit = 3;
                    ones_digit = 0;
                end
                29: begin
                    tens_digit = 2;
                    ones_digit = 9;
                end
                28: begin
                    tens_digit = 2;
                    ones_digit = 8;
                end
                27: begin
                    tens_digit = 2;
                    ones_digit = 7;
                end
                26: begin
                    tens_digit = 2;
                    ones_digit = 6;
                end
                25: begin
                    tens_digit = 2;
                    ones_digit = 5;
                end
                24: begin
                    tens_digit = 2;
                    ones_digit = 4;
                end
                23: begin
                    tens_digit = 2;
                    ones_digit = 3;
                end
                22: begin
                    tens_digit = 2;
                    ones_digit = 2;
                end
                21: begin
                    tens_digit = 2;
                    ones_digit = 1;
                end
                20: begin
                    tens_digit = 2;
                    ones_digit = 0;
                end
                19: begin
                    tens_digit = 1;
                    ones_digit = 9;
                end
                18: begin
                    tens_digit = 1;
                    ones_digit = 8;
                end
                17: begin
                    tens_digit = 1;
                    ones_digit = 7;
                end
                16: begin
                    tens_digit = 1;
                    ones_digit = 6;
                end
                15: begin
                    tens_digit = 1;
                    ones_digit = 5;
                end
                14: begin
                    tens_digit = 1;
                    ones_digit = 4;
                end
                13: begin
                    tens_digit = 1;
                    ones_digit = 3;
                end
                12: begin
                    tens_digit = 1;
                    ones_digit = 2;
                end
                11: begin
                    tens_digit = 1;
                    ones_digit = 1;
                end
                10: begin
                    tens_digit = 1;
                    ones_digit = 0;
                end
                9: begin
                    tens_digit = 88;
                    ones_digit = 9;
                end
                8: begin
                    tens_digit = 88;
                    ones_digit = 8;
                end
                7: begin
                    tens_digit = 88;
                    ones_digit = 7;
                end
                6: begin
                    tens_digit = 88;
                    ones_digit = 6;
                end
                5: begin
                    tens_digit = 88;
                    ones_digit = 5;
                end
                4: begin
                    tens_digit = 88;
                    ones_digit = 4;
                end
                3: begin
                    tens_digit = 88;
                    ones_digit = 3;
                end
                2: begin
                    tens_digit = 88;
                    ones_digit = 2;
                end
                1: begin
                    tens_digit = 88;
                    ones_digit = 1;
                end
                default: begin
                    tens_digit = 9;
                    ones_digit = 9;
                end
            endcase
        end

    SevenSeg S1(.H(H0), .NUM(ones_digit));
    SevenSeg S2(.H(H1), .NUM(tens_digit));

endmodule