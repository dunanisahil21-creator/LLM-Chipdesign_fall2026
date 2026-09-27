module sequence_detector (
    input clk,
    input reset_n,
    input [2:0] data,
    output reg sequence_found
);

    // State encoding
    typedef enum reg [3:0] {
        S0 = 4'b0000, // 0b001
        S1 = 4'b0001, // 0b101
        S2 = 4'b0010, // 0b110
        S3 = 4'b0011, // 0b000
        S4 = 4'b0100, // 0b110
        S5 = 4'b0101, // 0b110
        S6 = 4'b0110, // 0b011
        S7 = 4'b0111, // 0b101
        S8 = 4'b1000  // Invalid state
    } state_t;

    state_t state, next_state;

    // State transition logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = (data == 3'b001) ? S1 : S0;
            S1: next_state = (data == 3'b101) ? S2 : S0;
            S2: next_state = (data == 3'b110) ? S3 : S0;
            S3: next_state = (data == 3'b000) ? S4 : S0;
            S4: next_state = (data == 3'b110) ? S5 : S0;
            S5: next_state = (data == 3'b110) ? S6 : S0;
            S6: next_state = (data == 3'b011) ? S7 : S0;
            S7: next_state = (data == 3'b101) ? S8 : S0;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        sequence_found = (state == S7) && (data == 3'b101);
    end

endmodule