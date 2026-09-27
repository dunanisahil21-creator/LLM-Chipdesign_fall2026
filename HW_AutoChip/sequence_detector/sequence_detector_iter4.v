module sequence_detector (
    input clk,
    input reset_n,
    input [2:0] data,
    output reg sequence_found
);

    // State encoding
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;
    parameter S6 = 3'b110;
    parameter S7 = 3'b111;

    reg [2:0] current_state, next_state;

    // State transition logic
    always @(*) begin
        case (current_state)
            S0: next_state = (data == 3'b001) ? S1 : S0;
            S1: next_state = (data == 3'b101) ? S2 : S0;
            S2: next_state = (data == 3'b110) ? S3 : S0;
            S3: next_state = (data == 3'b000) ? S4 : S0;
            S4: next_state = (data == 3'b110) ? S5 : S0;
            S5: next_state = (data == 3'b110) ? S6 : S0;
            S6: next_state = (data == 3'b011) ? S7 : S0;
            S7: next_state = (data == 3'b101) ? S0 : S0;
            default: next_state = S0;
        endcase
    end

    // State update and output logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            current_state <= S0;
            sequence_found <= 1'b0;
        end else begin
            current_state <= next_state;
            // Set sequence_found when entering state S7
            if (next_state == S7) begin
                sequence_found <= 1'b1;
            end else begin
                sequence_found <= 1'b0;
            end
        end
    end

endmodule