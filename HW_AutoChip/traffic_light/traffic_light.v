module traffic_light_fsm (
    input clk,
    input reset_n,
    input enable,
    output reg red,
    output reg yellow,
    output reg green
);

    reg [5:0] counter; // 6-bit counter
    typedef enum reg [1:0] {RED, GREEN, YELLOW} state_t; // State encoding
    state_t state, next_state;

    // State transition logic
    always @(*) begin
        case (state)
            RED: begin
                if (counter == 6'd31) begin
                    next_state = GREEN;
                end else begin
                    next_state = RED;
                end
            end
            GREEN: begin
                if (counter == 6'd19) begin
                    next_state = YELLOW;
                end else begin
                    next_state = GREEN;
                end
            end
            YELLOW: begin
                if (counter == 6'd6) begin
                    next_state = RED;
                end else begin
                    next_state = YELLOW;
                end
            end
            default: next_state = RED; // Default to RED
        endcase
    end

    // State and counter update logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= RED;
            counter <= 6'd0;
            red <= 1'b1;
            yellow <= 1'b0;
            green <= 1'b0;
        end else if (enable) begin
            if (state == RED && counter == 6'd31) begin
                state <= GREEN;
                counter <= 6'd0;
            end else if (state == GREEN && counter == 6'd19) begin
                state <= YELLOW;
                counter <= 6'd0;
            end else if (state == YELLOW && counter == 6'd6) begin
                state <= RED;
                counter <= 6'd0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // Output logic based on state
    always @(*) begin
        red = (state == RED);
        yellow = (state == YELLOW);
        green = (state == GREEN);
    end

endmodule