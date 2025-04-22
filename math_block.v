module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

    // Adder
    adder_4bit addMe (
        .A(A),
        .B(B),
        .sum(AplusB)
    );
    
    // Subtracter
    subtr_4bit subStep (
        .A(A),
        .B(B),
        .dif(AminusB)
    );

endmodule