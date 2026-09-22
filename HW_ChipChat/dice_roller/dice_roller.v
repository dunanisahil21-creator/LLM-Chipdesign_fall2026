module dice_roller (
    input wire clk, rst_n, roll,
    input wire [1:0] die_select,
    output reg [7:0] rolled_number
);
    reg [15:0] lfsr;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lfsr <= 16'hACE1;
            rolled_number <= 0;
        end else begin
            lfsr <= {lfsr[14:0], lfsr[15]^lfsr[13]^lfsr[12]^lfsr[10]};
            if (roll) begin
                case (die_select)
                    2'b00: rolled_number <= (lfsr[7:0] % 4)  + 1;
                    2'b01: rolled_number <= (lfsr[7:0] % 6)  + 1;
                    2'b10: rolled_number <= (lfsr[7:0] % 8)  + 1;
                    2'b11: rolled_number <= (lfsr[7:0] % 20) + 1;
                endcase
            end
        end
    end
endmodule