module binary_to_bcd_converter (
    input [4:0] binary_input,
    output reg [7:0] bcd_output
);

integer i;
reg [3:0] tens;
reg [3:0] ones;

always @* begin
    // Initialize BCD digits
    tens = 4'b0000;
    ones = 4'b0000;
    
    // Double-dabble algorithm
    for (i = 0; i < 5; i = i + 1) begin
        // Add 3 if tens or ones are 5 or more
        if (tens >= 4'd5) begin
            tens = tens + 4'd3;
        end
        if (ones >= 4'd5) begin
            ones = ones + 4'd3;
        end
        
        // Shift left
        {tens, ones} = {tens, ones} << 1; // Shift tens and ones
        ones[0] = binary_input[4 - i]; // Add the next bit of binary_input to ones
    end
    
    // Assign the BCD output
    bcd_output = {tens, ones};
end

endmodule