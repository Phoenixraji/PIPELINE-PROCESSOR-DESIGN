`timescale 1ns/1ps

module tb_pipeline_processor;

    reg clk;
    reg reset;

    pipeline_processor uut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;  // 10ns clock

    initial begin
        $dumpfile("pipeline.vcd");
        $dumpvars(0, tb_pipeline_processor);

        clk = 0;
        reset = 1;
        #10 reset = 0;

        #100 $finish;
    end

endmodule
