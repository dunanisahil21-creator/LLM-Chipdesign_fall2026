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

    // State register
    reg [3:0] current_state, next_state;

    // State transition logic
    always @(*) begin
        case (current_state)
            S0: begin
                if (A && !B)
                    next_state = S1; // Transition to State 1
                else if (A && B)
                    next_state = S2; // Transition to State 2
                else
                    next_state = S0; // Stay in State 0
            end
            S1: begin
                if (A && !B)
                    next_state = S1; // Stay in State 1
                else
                    next_state = S0; // Transition back to State 0
            end
            S2: begin
                next_state = S0; // Transition back to State 0
            end
            default: next_state = S0; // Default state
        endcase
    end

    // State update on clock edge
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= S0; // Reset to State 0
            O <= 1'b0; // Output reset
        end else begin
            current_state <= next_state; // Update state
        end
    end

    // Output the current state and O
    always @(*) begin
        State = current_state; // Output the current state
        O = (current_state == S2) ? 1'b1 : 1'b0; // Set output based on state
    end

endmodule