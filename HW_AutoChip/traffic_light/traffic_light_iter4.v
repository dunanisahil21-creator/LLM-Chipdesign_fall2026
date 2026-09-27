module traffic_light_fsm(
    input clk,
    input reset_n,
    input enable,
    output reg red,
    output reg yellow,
    output reg green
);

    // State encoding
    typedef enum reg [1:0] {
        RED = 2'b00,
        GREEN = 2'b01,
        YELLOW = 2'b10
    } state_t;

    state_t current_state, next_state;

    // Counter for timing
    reg [5:0] counter;

    // State transition and output logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            current_state <= RED;
            counter <= 0;
        end else if (enable) begin
            // Update state based on current state and counter
            case (current_state)
                RED: begin
                    if (counter < 31) begin
                        counter <= counter + 1; // Count up to 32
                    end else begin
                        current_state <= GREEN; // Transition to GREEN
                        counter <= 0; // Reset counter for next state
                    end
                end
                GREEN: begin
                    if (counter < 19) begin
                        counter <= counter + 1; // Count up to 20
                    end else begin
                        current_state <= YELLOW; // Transition to YELLOW
                        counter <= 0; // Reset counter for next state
                    end
                end
                YELLOW: begin
                    if (counter < 6) begin
                        counter <= counter + 1; // Count up to 7
                    end else begin
                        current_state <= RED; // Transition to RED
                        counter <= 0; // Reset counter for next state
                    end
                end
            endcase
        end
    end

    // Output logic
    always @(*) begin
        red = (current_state == RED);
        yellow = (current_state == YELLOW);
        green = (current_state == GREEN);
    end

endmodule