module counters(
    input                       clk,
    input                       reset_n,

    output           [7:0]      H0,
    output           [7:0]      H1,
    output           [7:0]      H2,
	output		     [7:0]		H4,
	output		     [7:0]		H5,

    //////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW
);

    reg [7:0] cntr1;
    reg [7:0] cntr2;
    reg [7:0] cntr99;

    always @(posedge clk, negedge reset_n)
        begin
            if(reset_n == 0)
                begin
                    cntr2 <= 8'd88;
                    cntr1 <= 8'd1;
                    cntr99 <= 8'd1;
                end
            else
                begin
                    if(cntr1 != 9)
                        begin
                            cntr2 <= cntr2;
                            cntr1 <= cntr1 + 1;
                            cntr99 <= cntr99 + 1;
                        end
                    else if(cntr1 == 9)
                        begin
                            if(cntr2 == 8'd88)
                                begin
                                    cntr2 <= 8'd1;
                                    cntr1 <= 8'd0;
                                    cntr99 <= cntr99 + 1;
                                end
                            else if(cntr2 == 8'd9)
                                begin
                                    cntr2 <= 8'd88;
                                    cntr1 <= 8'd1;
                                    cntr99 <= 8'd1;
                                end
                            else
                                begin
                                    cntr2 <= cntr2 + 1;
                                    cntr1 <= 8'd0;
                                    cntr99 <= cntr99 + 1;
                                end
                        end
                end
        end

    monthday M0(.clk(clk), .reset_n(reset_n), .cntr99(cntr99), .H0(H0), .H1(H1), .H2(H2), .SW(SW));

    SevenSeg W0(.H(H4), .NUM(cntr1));
    SevenSeg W1(.H(H5), .NUM(cntr2));

endmodule