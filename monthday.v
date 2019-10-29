module monthday(
    input                       clk,
    input                       reset_n,
    input            [7:0]      cntr99,

	output           [7:0]      H0,
    output           [7:0]      H1,
    output           [7:0]      H2,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

reg[7:0] month;
reg[7:0] day_cntr;

always @(posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
            begin
                month <= 8'd1;
                day_cntr <= 8'd1;
            end
        else if(cntr99 <= 31)
            begin
                if(cntr99 == 1)
                    begin
                        month <= 8'd1;
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        month <= month;
                        day_cntr <= day_cntr + 1;
                    end
            end
        else if(cntr99 <= 59)
            begin
                if(cntr99 == 32)
                    begin
                        month <= 8'd2;
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        month <= month;
                        day_cntr <= day_cntr + 1;
                    end
            end
        else if(cntr99 <= 90)
            begin
                if(cntr99 == 60)
                    begin
                        month <= 8'd3;
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        month <= month;
                        day_cntr <= day_cntr + 1;
                    end
            end
        else if(cntr99 <= 99)
            begin
                if(cntr99 == 91)
                    begin
                        month <= 8'd4;
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        month <= month;
                        day_cntr <= day_cntr + 1;
                    end
            end
    end

reg [7:0] day_one;
reg [7:0] day_ten;

always@(posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
            begin
                day_one <= 8'd1;
                day_ten <= 8'd88;
            end
        else if(day_cntr <= 9)
            begin
                day_one <= day_cntr;
                day_ten <= 8'd88;
            end
        else if(day_cntr <= 19)
            if(day_cntr == 10)
                begin
                    day_one <= 8'd0;
                    day_ten <= 8'd1;
                end
            else
                begin
                   day_ten <= day_ten;
                   day_one <= day_one + 1; 
                end
        else if(day_cntr <= 29)
            if(day_cntr == 20)
                begin
                    day_one <= 8'd0;
                    day_ten <= 8'd2;
                end
            else
                begin
                    day_ten <= day_ten;
                    day_one <= day_one + 1;
                end
        else
            if(day_cntr == 30)
                begin
                    day_one <= 8'd0;
                    day_ten <= 8'd3;
                end
            else
                begin
                    day_ten <= day_ten;
                    day_one <= day_one + 1;
                end
    end


    SevenSeg S0(.H(H2), .NUM(month));
    SevenSeg S1(.H(H1), .NUM(day_ten));
    SevenSeg S2(.H(H0), .NUM(day_one));


endmodule