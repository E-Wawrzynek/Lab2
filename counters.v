module counters(
    input                       clk,
    input                       reset_n,

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

    wire [6:0] binary_val;
    assign binary_val = (cntr99[7:4] * 10) + ({3'b0, cntr99[3:0]});

    SevenSeg W0(.H(H4), .NUM(cntr1));
    SevenSeg W1(.H(H5), .NUM(cntr2));

endmodule