module clock_div
#(
    parameter DIVIDE_BY = 17 // Maximum defined by lab is 17, minimum must be 1, should be 2 for testing
)
(
    input clock,
    input reset,
    output div_clock
);

    // Wires
    wire [16:0] ClkData; // The Clock Data, aka notQ
    wire [16:0] ClkOut; // Q output
    
    // Selector...?
    assign div_clock = ClkOut[DIVIDE_BY - 1];
    
    // Clock Circuits
    dff div0 (
        .Default(1'b0),
        .reset(reset),
        .clock(clock),
        .D(ClkData[0]),
        .Q(ClkOut[0]),
        .NotQ(ClkData[0])
    );
    
    dff div1 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[0]),
        .D(ClkData[1]),
        .Q(ClkOut[1]),
        .NotQ(ClkData[1])
    );
    
    dff div2 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[1]),
        .D(ClkData[2]),
        .Q(ClkOut[2]),
        .NotQ(ClkData[2])
    );
    
    dff div3 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[2]),
        .D(ClkData[3]),
        .Q(ClkOut[3]),
        .NotQ(ClkData[3])
    );
    
    dff div4 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[3]),
        .D(ClkData[4]),
        .Q(ClkOut[4]),
        .NotQ(ClkData[4])
    );
    
    dff div5 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[4]),
        .D(ClkData[5]),
        .Q(ClkOut[5]),
        .NotQ(ClkData[5])
    );
    
    dff div6 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[5]),
        .D(ClkData[6]),
        .Q(ClkOut[6]),
        .NotQ(ClkData[6])
    );
    
    dff div7 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[6]),
        .D(ClkData[7]),
        .Q(ClkOut[7]),
        .NotQ(ClkData[7])
    );
    
    dff div8 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[7]),
        .D(ClkData[8]),
        .Q(ClkOut[8]),
        .NotQ(ClkData[8])
    );
    
    dff div9 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[8]),
        .D(ClkData[9]),
        .Q(ClkOut[9]),
        .NotQ(ClkData[9])
    );
    
    dff div10 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[9]),
        .D(ClkData[10]),
        .Q(ClkOut[10]),
        .NotQ(ClkData[10])
    );
    
    dff div11 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[10]),
        .D(ClkData[11]),
        .Q(ClkOut[11]),
        .NotQ(ClkData[11])
    );
    
    dff div12 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[11]),
        .D(ClkData[12]),
        .Q(ClkOut[12]),
        .NotQ(ClkData[12])
    );
    
    dff div13 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[12]),
        .D(ClkData[13]),
        .Q(ClkOut[13]),
        .NotQ(ClkData[13])
    );
    
    dff div14 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[13]),
        .D(ClkData[14]),
        .Q(ClkOut[14]),
        .NotQ(ClkData[14])
    );
    
    dff div15 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[14]),
        .D(ClkData[15]),
        .Q(ClkOut[15]),
        .NotQ(ClkData[15])
    );
    
    dff div16 (
        .Default(1'b0),
        .reset(reset),
        .clock(ClkOut[15]),
        .D(ClkData[16]),
        .Q(ClkOut[16]),
        .NotQ(ClkData[16])
    );

endmodule