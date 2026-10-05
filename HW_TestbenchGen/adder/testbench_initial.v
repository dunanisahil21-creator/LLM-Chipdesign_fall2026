module tb_adder4;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the DUT
    adder4 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test patterns
        a = 4'b0000; b = 4'b0000; cin = 1'b0; #1;
        $display("TEST 1: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0001; b = 4'b0001; cin = 1'b0; #1;
        $display("TEST 2: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0010; b = 4'b0011; cin = 1'b0; #1;
        $display("TEST 3: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1111; b = 4'b0001; cin = 1'b0; #1;
        $display("TEST 4: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1111; b = 4'b1111; cin = 1'b0; #1;
        $display("TEST 5: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0111; b = 4'b1000; cin = 1'b1; #1;
        $display("TEST 6: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1010; b = 4'b0101; cin = 1'b1; #1;
        $display("TEST 7: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0000; b = 4'b1111; cin = 1'b1; #1;
        $display("TEST 8: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1111; b = 4'b0000; cin = 1'b1; #1;
        $display("TEST 9: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1100; b = 4'b1100; cin = 1'b0; #1;
        $display("TEST 10: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0011; b = 4'b0011; cin = 1'b1; #1;
        $display("TEST 11: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0101; b = 4'b0101; cin = 1'b0; #1;
        $display("TEST 12: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1001; b = 4'b1001; cin = 1'b1; #1;
        $display("TEST 13: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1110; b = 4'b0001; cin = 1'b0; #1;
        $display("TEST 14: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0110; b = 4'b0110; cin = 1'b1; #1;
        $display("TEST 15: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0000; b = 4'b0000; cin = 1'b1; #1;
        $display("TEST 16: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1111; b = 4'b1111; cin = 1'b1; #1;
        $display("TEST 17: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0100; b = 4'b0011; cin = 1'b0; #1;
        $display("TEST 18: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b1000; b = 4'b1000; cin = 1'b0; #1;
        $display("TEST 19: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);
        
        a = 4'b0111; b = 4'b0111; cin = 1'b1; #1;
        $display("TEST 20: a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);

        $finish;
    end

endmodule