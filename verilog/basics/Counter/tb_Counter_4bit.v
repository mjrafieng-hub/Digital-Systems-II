`timescale 1ns/1ps

module tb_counter();
	reg clk;
	reg en;
	reg rst;
	wire [3:0] Q;
	 
	 
counter_4bit uut (
	.clk(clk),
	.rst(rst),
    .en(en),
	.Q(Q)
);	 

initial clk = 0;
always #10 clk = ~clk ;

initial begin
        rst = 1;
        en = 0;
        @(posedge clk);
        @(posedge clk);
        rst = 0;
        en = 0;
        @(posedge clk);
        @(posedge clk);

        en = 1;
        #350; 

        en = 0;
        #40;

        en = 1;
        #60;
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | rst = %b | en = %b | Q = %0d (Binary: %b)", $time, rst, en, Q, Q);
    end

endmodule