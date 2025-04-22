module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);
    
    // Ah yes... the wires.
    wire timeKeeper;
    wire [3:0] theNoid;
    wire [3:0] plusel;
    wire [3:0] minun;
    
    // Instantiate the clock divider...
    clock_div #(.DIVIDE_BY(DIVIDE_BY)) clockTower (
        .clock(clk),
        .reset(btnC),
        .div_clock(timeKeeper)
    ); 
    
    // ... wire it up to the scanner...
    seven_seg_scanner shorthault (
        .div_clock(timeKeeper),
        .reset(btnC),
        .anode(theNoid)
    );

    // Instantiate the math block...
    math_block overworld (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(plusel),
        .AminusB(minun)
    );
    
    // ... and wire both the scanner and math block to the decoder
    seven_seg_decoder mumbo (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(plusel),
        .AminusB(minun),
        .anode(theNoid),
        .segs(seg)
    );
    
    // Anode
    assign an = theNoid;

    // Do not forget to wire up resets!!

endmodule