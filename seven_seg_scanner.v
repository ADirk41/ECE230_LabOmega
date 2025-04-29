module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    // I'm annoyed...
    wire A_N, B_N, C_N, D_N; // Next state(annode)
    wire A_S, B_S, C_S, D_S; // Current State
    wire A_I, B_I, C_I, D_I; // Inverse of current state
    
    // State FlipFlops (A is the initial state)
    dff_default stateA(
        .Default(1'b0),
        .reset(reset),
        .clock(div_clock),
        .D(A_N),
        .Q(A_S),
        .NotQ(A_I)
    );
    
    dff_default stateB(
        .Default(1'b1),
        .reset(reset),
        .clock(div_clock),
        .D(B_N),
        .Q(B_S),
        .NotQ(B_I)
    );
    
    dff_default stateC(
        .Default(1'b1),
        .reset(reset),
        .clock(div_clock),
        .D(C_N),
        .Q(C_S),
        .NotQ(C_I)
    );
    
    dff_default stateD(
        .Default(1'b1),
        .reset(reset),
        .clock(div_clock),
        .D(D_N),
        .Q(D_S),
        .NotQ(D_I)
    );
    
    // States
    /*assign A_N = D_I;
    assign B_N = A_I;
    assign C_N = B_I;
    assign D_N = C_I;*/
    assign A_N = D_S;
    assign B_N = A_S;
    assign C_N = B_S;
    assign D_N = C_S;
    
    // Anodes
    assign anode[0] = A_S; // R Seg
    assign anode[1] = B_S; // RC Seg
    assign anode[2] = C_S; // LC Seg
    assign anode[3] = D_S; // L Seg

endmodule