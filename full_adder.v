// Full_adder (Revised casing)
module full_adder(
    input fA, fB, cIn,
    output fY, cOut
);

    // Eq
    assign fY = fA ^ fB ^ cIn; // A ^ B ^ C
    assign cOut = (fA & fB) | (fA & cIn) | (fB & cIn);

endmodule 