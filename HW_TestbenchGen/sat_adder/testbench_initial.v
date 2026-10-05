module tb_sat_adder4;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;

    // Instantiate the Device Under Test (DUT)
    sat_adder4 dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test patterns
        a = 4'd0; b = 4'd0; #1; $display("TEST 1: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd7; b = 4'd5; #1; $display("TEST 2: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd15; b = 4'd0; #1; $display("TEST 3: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd8; b = 4'd8; #1; $display("TEST 4: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd15; b = 4'd15; #1; $display("TEST 5: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd1; b = 4'd1; #1; $display("TEST 6: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd3; b = 4'd2; #1; $display("TEST 7: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd4; b = 4'd4; #1; $display("TEST 8: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd2; b = 4'd3; #1; $display("TEST 9: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd10; b = 4'd6; #1; $display("TEST 10: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd14; b = 4'd3; #1; $display("TEST 11: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd5; b = 4'd10; #1; $display("TEST 12: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd12; b = 4'd4; #1; $display("TEST 13: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd6; b = 4'd9; #1; $display("TEST 14: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd13; b = 4'd3; #1; $display("TEST 15: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd0; b = 4'd15; #1; $display("TEST 16: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd15; b = 4'd1; #1; $display("TEST 17: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd7; b = 4'd9; #1; $display("TEST 18: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd11; b = 4'd5; #1; $display("TEST 19: a=%d b=%d sum=%d", a, b, sum);
        a = 4'd9; b = 4'd7; #1; $display("TEST 20: a=%d b=%d sum=%d", a, b, sum);

        $finish;
    end
endmodule