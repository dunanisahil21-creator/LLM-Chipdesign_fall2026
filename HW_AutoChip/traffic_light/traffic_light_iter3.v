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
            if (current_state == RED) begin
                if (counter < 32) begin
                    counter <= counter + 1;
                end else begin
                    current_state <= GREEN; // Transition to GREEN
                    counter <= 0; // Reset counter for next state
                end
            end else if (current_state == GREEN) begin
                if (counter < 20) begin
                    counter <= counter + 1;
                end else begin
                    current_state <= YELLOW; // Transition to YELLOW
                    counter <= 0; // Reset counter for next state
                end
            end else if (current_state == YELLOW) begin
                if (counter < 7) begin
                    counter <= counter + 1;
                end else begin
                    current_state <= RED; // Transition to RED
                    counter <= 0; // Reset counter for next state
                end
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            RED: begin
                if (counter == 32) begin
                    next_state = GREEN;
                end else begin
                    next_state = RED;
                end
            end
            GREEN: begin
                if (counter == 20) begin
                    next_state = YELLOW;
                end else begin
                    next_state = GREEN;
                end
            end
            YELLOW: begin
                if (counter == 7) begin
                    next_state = RED;
                end else begin
                    next_state = YELLOW;
                end
            end
            default: next_state = RED; // Default to RED state
        endcase
    end

    // Output logic
    always @(*) begin
        red = (current_state == RED);
        yellow = (current_state == YELLOW);
        green = (current_state == GREEN);
    end

endmodule