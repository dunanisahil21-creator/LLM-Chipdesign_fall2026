module binary_to_bcd_converter (
    input [4:0] binary_input,
    output reg [7:0] bcd_output
);

    always @* begin
        // Initialize BCD output
        bcd_output = 8'b0;

        // Convert binary to BCD using double-dabble algorithm
        reg [3:0] tens = 4'b0;
        reg [3:0] ones = 4'b0;

        // Shift through each bit of the binary input
        for (integer i = 4; i >= 0; i = i - 1) begin
            // Shift left the BCD values
            if (tens >= 5)
                tens = tens + 3;
            if (ones >= 5)
                ones = ones + 3;

            // Shift left
            tens = {tens[2:0], ones[3]};
            ones = {ones[2:0], binary_input[i]};
        end

        bcd_output = {tens, ones};
    end

endmodule