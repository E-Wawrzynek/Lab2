module monthday(
    input                       clk,
    input                       reset_n,
    input            [7:0]      cntr99,
    // input            [7:0]      cntr1,
    // input            [7:0]      cntr2,

	output           [7:0]      H0,
    output           [7:0]      H1,
    output           [7:0]      H2,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

// wire month_reset_n;
// assign month_reset_n = reset_n && (cntr99 != 1) && (cntr99 != 32) && (cntr99 != 60) && (cntr99 != 91);

reg [7:0] month_d;
// reg [7:0] day1;
// reg [7:0] day10;

// always @(cntr1, cntr2)
//     begin
//         if(reset_n == 0)
//             begin
//                 day1 <= 8'd1;
//                 day10 <= 8'd88;
//             end
//         else if()


// // reg [7:0] cntr2;
// // reg [7:0] cntr1;

// // always @(posedge clk, negedge month_reset_n)
// //     begin
// //         if(month_reset_n == 0)
// //             begin
// //                 cntr2 <= 8'd88;
// //                 cntr1 <= 8'd1;
// //             end
// //         else
// //             begin
// //                 if(cntr1 != 9)
// //                     begin
// //                         cntr2 <= cntr2;
// //                         cntr1 <= cntr1 + 1;
// //                     end
// //                 else if(cntr1 == 9)
// //                     begin
// //                         if(cntr2 == 8'd88)
// //                             begin
// //                                 cntr2 <= 8'd1;
// //                                 cntr1 <= 8'd0;
// //                             end
// //                         else if(cntr2 == 8'd9)
// //                             begin
// //                                 cntr2 <= 8'd88;
// //                                 cntr1 <= 8'd1;
// //                             end
// //                         else
// //                             begin
// //                                 cntr2 <= cntr2 + 1;
// //                                 cntr1 <= 8'd0;
// //                             end
// //                     end
// //             end
// //     end

// SevenSeg S1(.H(H0), .NUM(cntr1));
// SevenSeg S2(.H(H1), .NUM(cntr2));

always @(cntr99)
    begin
        if(cntr99 <= 8'd31)
            begin
              month_d <= 8'd1;
            end
        else if(cntr99 <= 8'd59)
            begin
                month_d <= 8'd2;
            end
        else if(cntr99 <= 8'd90)
            begin
                month_d <= 8'd3;
            end
        else
            begin
                month_d <= 8'd4;
            end
    end

SevenSeg S0(.H(H2), .NUM(month_d));

reg[7:0] day_cntr;

always @(cntr99)
    begin
        if(cntr99 <= 31)
            begin
                if(cntr99 == 1)
                    begin
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        day_cntr <= day_cntr + 1;
                    end
            end
        else if(cntr99 <= 59)
            begin
                if(cntr99 == 32)
                    begin
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        day_cntr <= day_cntr + 1;
                    end
            end
        else if(cntr99 <= 90)
            begin
                if(cntr99 == 60)
                    begin
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        day_cntr <= day_cntr + 1;
                    end
            end
        else if(cntr99 <= 99)
            begin
                if(cntr99 == 91)
                    begin
                        day_cntr <= 8'd1;
                    end
                else
                    begin
                        day_cntr <= day_cntr + 1;
                    end
            end
    end

reg [7:0] day_one;
reg [7:0] day_ten;

always@(cntr99)
    begin
        if(day_cntr <= 9)
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


    // SevenSeg S0(.H(H2), .NUM(month));
    SevenSeg S1(.H(H1), .NUM(day_ten));
    SevenSeg S2(.H(H0), .NUM(day_one));


endmodule