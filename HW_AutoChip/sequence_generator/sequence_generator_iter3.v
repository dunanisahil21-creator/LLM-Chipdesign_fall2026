module sequence_generator (
    input wire clk,
    input wire reset_n,
    input wire enable,
    output reg [7:0] data
);

    reg [2:0] index; // 3-bit index to access the sequence
    reg [7:0] seq_rom [0:7]; // ROM for the sequence

    initial begin
        seq_rom[0] = 8'hAF;
        seq_rom[1] = 8'hBC;
        seq_rom[2] = 8'hE2;
        seq_rom[3] = 8'h78;
        seq_rom[4] = 8'hFF;
        seq_rom[5] = 8'hE2;
        seq_rom[6] = 8'h0B;
        seq_rom[7] = 8'h8D;
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data <= 8'hAF; // Preload data on reset
            index <= 3'b000; // Set index to 0 on reset
        end else if (enable) begin
            data <= seq_rom[index]; // Output current sequence value
            index <= index + 1; // Increment index
            if (index == 3'b111) // Wrap around if index reaches 7
                index <= 3'b000;
        end
    end

    // Ensure the index wraps correctly after outputting the last value
    always @(posedge clk) begin
        if (enable && index == 3'b111) begin
            index <= 3'b000; // Wrap around to the first value
        end
    end

endmodule