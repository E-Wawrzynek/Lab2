module tb_cntr99(
);

    reg CLOCK;
    reg RESET;
    wire [7:0] cntr;
    wire [7:0] c1;
    wire [7:0] c2;

    counters R0(.clk(CLOCK), .reset_n(RESET), .cntr_99(cntr));
    
    initial
        begin
            CLOCK = 1'b0;
            RESET = 1'b0;
        #10 RESET = 1'b1;
        end

    always
        #5 CLOCK = ~CLOCK;

    initial
        begin
            $dumpfile("output.vcd");
            $dumpvars;
            $display("Starting simulation");
        end   

    initial
        begin
        $monitor("%d,\t%b,\t%b,", $time, CLOCK, cntr);        
        end

        initial
            begin
            $display("Simulation ended.");
            #500 $finish;
            end

endmodule