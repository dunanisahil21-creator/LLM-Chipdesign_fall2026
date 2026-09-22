module traffic_light_fsm  (
    input wire clk,
    input wire reset_n,
    input wire enable,
    output reg red,
    output reg yellow,
    output reg green
);
    // State encoding
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    reg [1:0] state;
    reg [5:0] counter;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state   <= RED;
            counter <= 6'd0;
            red     <= 1'b1;
            yellow  <= 1'b0;
            green   <= 1'b0;
        end else if (enable) begin
            case (state)
                RED: begin
                    if (counter == 6'd31) begin
                        state   <= GREEN;
                        counter <= 6'd0;
                        red     <= 1'b0;
                        green   <= 1'b1;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                GREEN: begin
                    if (counter == 6'd19) begin
                        state   <= YELLOW;
                        counter <= 6'd0;
                        green   <= 1'b0;
                        yellow  <= 1'b1;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                YELLOW: begin
                    if (counter == 6'd6) begin
                        state   <= RED;
                        counter <= 6'd0;
                        yellow  <= 1'b0;
                        red     <= 1'b1;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                default: state <= RED;
            endcase
        end
    end
endmodule