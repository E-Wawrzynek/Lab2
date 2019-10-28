`timescale 1 ns / 100 ps

module tb_BCD();

    reg clk;
    reg Rn;
    wire m0;
    wire m1;

    mystery U0 (
        .clock(clk),
        .reset_n(Rn),
        .mystery0(m0),
        .mystery1(m1)
    );

    initial
        begin
            clk = 1'b0;
            Rn = 1'b0;
        #10 Rn = 1'b1;
        end

    always
        #5 clk = ~clk;

    initial
        begin
            $dumpfile("output.vcd");
            $dumpvars;
            $display("Starting simulation");
        end   

    initial
        begin
        $monitor("%d,\t%b,\t%b,\t%d", $time, clk, Rn, m0, m1);        
        end

        initial
            begin
            $display("Simulation ended.");
            #500 $finish;
            end
        
endmodule
