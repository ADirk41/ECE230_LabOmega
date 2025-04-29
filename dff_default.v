module dff_default(
    input Default,
    input reset,
    input clock,
    input D,
    output reg Q,
    output NotQ
);
    assign NotQ = ~Q;

    always @(posedge reset, posedge clock) begin
        if (reset) begin
            Q <= Default;
        end else if (clock) begin
            Q <= D;
        end
    end
endmodule
