module subtr_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] dif
);
    
    // B's Complement
    wire [3:0] Bcomp; 
    wire [2:0] carry;
    
    twos_complement niceJob (
        .twoBit(B),
        .twoOut(Bcomp)
    );
    
    // Subtracts
    /*adder_4bit subtr (
        .A(A),
        .B(Bcomp),
        .sum(dif)
    );*/
    full_adder bit0 (
        .fA(A[0]),
        .fB(Bcomp[0]),
        .cIn(1'b0),
        .fY(dif[0]),
        .cOut(carry[0])
    );
    
    full_adder bit1 (
        .fA(A[1]),
        .fB(Bcomp[1]),
        .cIn(carry[0]),
        .fY(dif[1]),
        .cOut(carry[1])
    );
    
    full_adder bit2 (
        .fA(A[2]),
        .fB(Bcomp[2]),
        .cIn(carry[1]),
        .fY(dif[2]),
        .cOut(carry[2])
    );
    
    full_adder bit3 (
        .fA(A[3]),
        .fB(Bcomp[3]),
        .cIn(carry[2]),
        .fY(dif[3])
    );

endmodule