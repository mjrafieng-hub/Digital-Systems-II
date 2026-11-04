`timescale 1ns / 1ps

// input & output 

module carry_select_adder_16bit(
    input [15:0] A,
    input [15:0] B,
    input CIN,
    output [15:0] S,
    output CO
);

//
    wire [4:0] S0_low, S1_low;
    wire C0_low, C1_low;
    
	//instant adder5bit for block low 1 & 0
	
    adder_5bit add_low_0 (
        .A(A[4:0]),
        .B(B[4:0]),
        .CIN(1'b0),
        .S(S0_low),
        .CO(C0_low)
    );

        adder_5bit add_low_1 (
        .A(A[4:0]),
        .B(B[4:0]),
        .CIN(1'b1),
        .S(S1_low),
        .CO(C1_low)
    );

    assign S[4:0] = CIN ? S1_low : S0_low;
    wire carry_1 = CIN ? C1_low : C0_low;

    wire [4:0] S0_mid, S1_mid;
    wire C0_mid, C1_mid;

    adder_5bit add_mid_0 (
        .A(A[9:5]),
        .B(B[9:5]),
        .CIN(1'b0),
        .S(S0_mid),
        .CO(C0_mid)
    );

    adder_5bit add_mid_1 (
        .A(A[9:5]),
        .B(B[9:5]),
        .CIN(1'b1),
        .S(S1_mid),
        .CO(C1_mid)
    );

    assign S[9:5] = carry_1 ? S1_mid : S0_mid;
    wire carry_2 = carry_1 ? C1_mid : C0_mid;
    wire [5:0] S0_high, S1_high;
    wire C0_high, C1_high;

    adder_6bit add_high_0 (
        .A(A[15:10]),
        .B(B[15:10]),
        .CIN(1'b0),
        .S(S0_high),
        .CO(C0_high)
    );

    adder_6bit add_high_1 (
        .A(A[15:10]),
        .B(B[15:10]),
        .CIN(1'b1),
        .S(S1_high),
        .CO(C1_high)
    );
  
    assign S[15:10] = carry_2 ? S1_high : S0_high;
    assign CO = carry_2 ? C1_high : C0_high;

endmodule

module adder_5bit(
    input [4:0] A,
    input [4:0] B,
    input CIN,
    output [4:0] S,
    output CO
);
    assign {CO, S} = A + B + CIN; // concat final result
endmodule

module adder_6bit(
    input [5:0] A,
    input [5:0] B,
    input CIN,
    output [5:0] S,
    output CO
);
    assign {CO, S} = A + B + CIN;
endmodule