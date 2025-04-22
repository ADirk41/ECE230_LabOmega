// Converts the number into its twos complement
module twos_complement(
    input [3:0] twoBit,
    output [3:0] twoOut
);

    // Carry Wires 
    wire [2:0] cBit;
    
    // Bit 0 change
    full_adder two_in_bit_0 (
        .fA(~twoBit[0]),
        .fB(1'b1),
        .cIn(1'b0), // No carry (bit 0)
        .fY(twoOut[0]),
        .cOut(cBit[0])
    );
    
    // Bit 1 change
    full_adder two_in_bit_1 (
        .fA(~twoBit[1]),
        .fB(1'b0), // You can only add 1 for bit 0; add the carry from then on!
        .cIn(cBit[0]), 
        .fY(twoOut[1]),
        .cOut(cBit[1])
    );
    
    // Bit 2 change
    full_adder two_in_bit_2 (
        .fA(~twoBit[2]),
        .fB(1'b0), // You can only add 1 for bit 0; add the carry from then on!
        .cIn(cBit[1]), 
        .fY(twoOut[2]),
        .cOut(cBit[2])
    );
    
    // Bit 3 change
    full_adder two_in_bit_3 (
        .fA(~twoBit[3]),
        .fB(1'b0), // You can only add 1 for bit 0; add the carry from then on!
        .cIn(cBit[2]), 
        .fY(twoOut[3]) // Final bit; no carry out!
    );
    

endmodule