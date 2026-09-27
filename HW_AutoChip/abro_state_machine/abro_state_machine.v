module abro_state_machine (
    input clk,
    input rst_n,
    input A,
    input B,
    output reg O,
    output reg [3:0] State
);

    // State encoding
    localparam S0 = 4'b0001; // State 0
    localparam S1 = 4'b0010; // State 1
    localparam S2 = 4'b0100; // State 2

    // State update logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            State <= S0; // Reset to State 0
        end else begin
            case ({A, B})
                2'b00: State <= State; // Keep current state
                2'b01: State <= S0;    // State 0
                2'b10: State <= S1;    // State 1
                2'b11: State <= S2;    // State 2
                default: State <= State; // Should not occur
            endcase
        end
    end

    // Output logic
    always @(*) begin
        O = A & B; // Output is A AND B
    end

endmodule