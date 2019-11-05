`timescale 1 ns / 100 ps

module tb_leapyear(
);

    reg CLOCK;
    reg RESET;
    wire [7:0] H0;
    wire [7:0] H1;
    wire [7:0] H2;
    wire [7:0] H3;
    wire [7:0] H4;   
    wire [7:0] H5;
    wire [1:0] KEY;
    wire [9:0] LED;
    reg [9:0] SW;
    reg [7:0] feb_day;



    Lab2 R0(.ADC_CLK_10(CLOCK), .HEX0(H0), .HEX1(H1), .HEX2(H2), .HEX3(H3), .HEX4(H4), .HEX5(H5), .KEY(KEY), .LEDR(LED), .SW(SW));

    // initial
    //     begin
    //         $dumpfile("output.vcd");
    //         $dumpvars;
    //         $display("Starting simulation");

    //         SW[9:0] = 9'b100000000;
    //         #10 if(feb_day != 29)
    //             $display("ERROR: feb_day not correct value");
            
    //         SW[9:0] = 9'b000000000;
    //         #10 if(feb_day != 28)
    //             $display("ERROR: feb_day not correct value");
    //     end

    always
        #5 CLOCK = ~CLOCK;

    always @(posedge CLOCK)
        SW[9] = ~SW[9];

    initial
        begin
        $monitor("%d,\t%b", $time, SW[9]);        
        end

        initial
            begin
            $display("Simulation ended.");
            #500 $finish;
            end

endmodule