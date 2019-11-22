module monthday(
    input                       clk,
    input                       reset_n,
    input            [7:0]      cntr99,
    input            [7:0]      feb_day,

	output           [7:0]      H0,
    output           [7:0]      H1,
    output           [7:0]      H2,

	//////////// SW //////////
	input 		     [9:0]		SW
);

    reg [7:0] month_d;
    reg [7:0] day_cntr;

    always @(cntr99)
        begin
            if(cntr99 <= 8'd31)
                begin
                month_d <= 8'd1;
                day_cntr <= cntr99;
                end
            else if(cntr99 <= (8'd31 + feb_day))
                begin
                    month_d <= 8'd2;
                    day_cntr <= cntr99 - 31;
                end
            else if(cntr99 <= (8'd31 + feb_day + 8'd31))
                begin
                    month_d <= 8'd3;
                    day_cntr <= cntr99 - (8'd31 + feb_day);
                end
            else
                begin
                    month_d <= 8'd4;
                    day_cntr <= cntr99 - (8'd31 + feb_day + 8'd31);
                end
        end

    SevenSeg S0(.H(H2), .NUM(month_d));

    daydisplay D0(.day_cntr(day_cntr), .H0(H0), .H1(H1));

endmodule