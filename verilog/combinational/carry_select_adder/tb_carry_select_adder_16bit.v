`timescale 1ns / 1ps

module tb_carry_select_adder_16bit;

    reg [15:0] A;
    reg [15:0] B;
    reg CIN;

    wire [15:0] S;
    wire CO;

    carry_select_adder_16bit uut (
        .A(A), 
        .B(B), 
        .CIN(CIN), 
        .S(S), 
        .CO(CO)
    );

    initial begin
        A = 16'h0000;
        B = 16'h0000;
        CIN = 1'b0;
        #20;

        A = 16'h1234;
        B = 16'h0111;
        CIN = 1'b0;
        #20;

        A = 16'h5A5A;
        B = 16'h3C3C;
        CIN = 1'b0;
        #20;

        CIN = 1'b1;
        #20;

        A = 16'hFFFF;
        B = 16'h0001;
        CIN = 1'b0;
        #20;
		  
        A = 16'hABCD;
        B = 16'h1234;
        CIN = 1'b1;
        #20;

        $stop;
    end
      
endmodule