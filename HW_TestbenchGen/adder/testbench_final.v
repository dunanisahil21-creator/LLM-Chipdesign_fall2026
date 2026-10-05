module tb_adder4;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    integer errors;
    adder4 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
        errors = 0;

        // TEST 1
        a = 4'd0; b = 4'd0; cin = 1'b0; #1;
        if (sum !== 4'd0 || cout !== 1'b0) begin
            $display("TEST 1 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 1 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 2
        a = 4'd1; b = 4'd1; cin = 1'b0; #1;
        if (sum !== 4'd2 || cout !== 1'b0) begin
            $display("TEST 2 FAIL: a=%0d b=%0d cin=%0d expected sum=2 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 2 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 3
        a = 4'd2; b = 4'd3; cin = 1'b0; #1;
        if (sum !== 4'd5 || cout !== 1'b0) begin
            $display("TEST 3 FAIL: a=%0d b=%0d cin=%0d expected sum=5 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 3 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 4
        a = 4'd15; b = 4'd1; cin = 1'b0; #1;
        if (sum !== 4'd0 || cout !== 1'b1) begin
            $display("TEST 4 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 4 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 5
        a = 4'd15; b = 4'd15; cin = 1'b0; #1;
        if (sum !== 4'd14 || cout !== 1'b1) begin
            $display("TEST 5 FAIL: a=%0d b=%0d cin=%0d expected sum=14 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 5 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 6
        a = 4'd7; b = 4'd8; cin = 1'b1; #1;
        if (sum !== 4'd0 || cout !== 1'b1) begin
            $display("TEST 6 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 6 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 7
        a = 4'd10; b = 4'd5; cin = 1'b1; #1;
        if (sum !== 4'd0 || cout !== 1'b1) begin
            $display("TEST 7 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 7 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 8
        a = 4'd0; b = 4'd15; cin = 1'b1; #1;
        if (sum !== 4'd0 || cout !== 1'b1) begin
            $display("TEST 8 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 8 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 9
        a = 4'd15; b = 4'd0; cin = 1'b1; #1;
        if (sum !== 4'd0 || cout !== 1'b1) begin
            $display("TEST 9 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 9 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 10
        a = 4'd12; b = 4'd12; cin = 1'b0; #1;
        if (sum !== 4'd8 || cout !== 1'b1) begin
            $display("TEST 10 FAIL: a=%0d b=%0d cin=%0d expected sum=8 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 10 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 11
        a = 4'd3; b = 4'd3; cin = 1'b1; #1;
        if (sum !== 4'd7 || cout !== 1'b0) begin
            $display("TEST 11 FAIL: a=%0d b=%0d cin=%0d expected sum=7 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 11 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 12
        a = 4'd5; b = 4'd5; cin = 1'b0; #1;
        if (sum !== 4'd10 || cout !== 1'b0) begin
            $display("TEST 12 FAIL: a=%0d b=%0d cin=%0d expected sum=10 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 12 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 13
        a = 4'd9; b = 4'd9; cin = 1'b1; #1;
        if (sum !== 4'd3 || cout !== 1'b1) begin
            $display("TEST 13 FAIL: a=%0d b=%0d cin=%0d expected sum=3 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 13 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 14
        a = 4'd14; b = 4'd1; cin = 1'b0; #1;
        if (sum !== 4'd15 || cout !== 1'b0) begin
            $display("TEST 14 FAIL: a=%0d b=%0d cin=%0d expected sum=15 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 14 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 15
        a = 4'd6; b = 4'd6; cin = 1'b1; #1;
        if (sum !== 4'd13 || cout !== 1'b0) begin
            $display("TEST 15 FAIL: a=%0d b=%0d cin=%0d expected sum=13 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 15 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 16
        a = 4'd0; b = 4'd0; cin = 1'b1; #1;
        if (sum !== 4'd1 || cout !== 1'b0) begin
            $display("TEST 16 FAIL: a=%0d b=%0d cin=%0d expected sum=1 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 16 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 17
        a = 4'd15; b = 4'd15; cin = 1'b1; #1;
        if (sum !== 4'd15 || cout !== 1'b1) begin
            $display("TEST 17 FAIL: a=%0d b=%0d cin=%0d expected sum=15 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 17 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 18
        a = 4'd4; b = 4'd3; cin = 1'b0; #1;
        if (sum !== 4'd7 || cout !== 1'b0) begin
            $display("TEST 18 FAIL: a=%0d b=%0d cin=%0d expected sum=7 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 18 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 19
        a = 4'd8; b = 4'd8; cin = 1'b0; #1;
        if (sum !== 4'd0 || cout !== 1'b1) begin
            $display("TEST 19 FAIL: a=%0d b=%0d cin=%0d expected sum=0 cout=1 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 19 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        // TEST 20
        a = 4'd7; b = 4'd7; cin = 1'b1; #1;
        if (sum !== 4'd15 || cout !== 1'b0) begin
            $display("TEST 20 FAIL: a=%0d b=%0d cin=%0d expected sum=15 cout=0 got sum=%0d cout=%0d", a, b, cin, sum, cout);
            errors = errors + 1;
        end else begin
            $display("TEST 20 PASS: a=%0d b=%0d cin=%0d sum=%0d cout=%0d", a, b, cin, sum, cout);
        end

        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule