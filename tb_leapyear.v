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

    initial
        begin
            CLOCK = 1'b0;
            SW[9] = 9'b000000000;
        end

    initial
        begin
            $dumpfile("output.vcd");
            $dumpvars;
            $display("Starting simulation");
        end   


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
            #50 $finish;
            end

endmodule