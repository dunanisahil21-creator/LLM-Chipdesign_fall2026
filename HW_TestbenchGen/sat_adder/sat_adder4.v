module sat_adder4(input wire [3:0] a, input wire [3:0] b, output wire [3:0] sum);
    wire [4:0] raw;
    assign raw = a + b;
    assign sum = (raw > 5'd15) ? 4'd15 : raw[3:0];
endmodule