module lfsr (
    input clk,
    input reset_n,
    output reg [7:0] data
);
    // Initial state
    initial begin
        data = 8'b10001010;
    end

    // LFSR operation
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data <= 8'b10001010; // Reset to initial state
        end else begin
            // Shift and feedback calculation
            data <= {data[6:0], data[0] ^ data[3] ^ data[5] ^ data[6]};
        end
    end
endmodule