module adder_4bit(
    input [3:0] A,
    input [3:0] B,
    output [3:0] sum
);

    // Carry Wires
    wire [2:0] cOut;
    
    // Adder Circuits
    full_adder bit0(
        .fA(A[0]),
        .fB(B[0]),
        .cIn(0'b0),
        .fY(sum[0]),
        .cOut(cOut[0])
    );
    
    full_adder bit1(
        .fA(A[1]),
        .fB(B[1]),
        .cIn(cOut[0]),
        .fY(sum[1]),
        .cOut(cOut[1])
    );
    
    full_adder bit2(
        .fA(A[2]),
        .fB(B[2]),
        .cIn(cOut[1]),
        .fY(sum[2]),
        .cOut(cOut[2])
    );
    
    full_adder bit3(
        .fA(A[3]),
        .fB(B[3]),
        .cIn(cOut[2]),
        .fY(sum[3])
    );

endmodule
