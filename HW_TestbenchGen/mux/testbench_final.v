module tb_mux21;
    reg a;
    reg b;
    reg sel;
    wire y;
    integer errors;

    // Instantiate the DUT
    mux21 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        errors = 0;

        // Test patterns
        a = 0; b = 0; sel = 0; #1;
        if (y !== 0) begin
            $display("TEST 1 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 1 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 0; sel = 1; #1;
        if (y !== 0) begin
            $display("TEST 2 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 2 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 1; sel = 0; #1;
        if (y !== 0) begin
            $display("TEST 3 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 3 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 1; sel = 1; #1;
        if (y !== 1) begin
            $display("TEST 4 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 4 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 0; sel = 0; #1;
        if (y !== 1) begin
            $display("TEST 5 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 5 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 0; sel = 1; #1;
        if (y !== 0) begin
            $display("TEST 6 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 6 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 1; sel = 0; #1;
        if (y !== 1) begin
            $display("TEST 7 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 7 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 1; sel = 1; #1;
        if (y !== 1) begin
            $display("TEST 8 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 8 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        // Randomized / mid-range cases
        a = 0; b = 1; sel = 0; #1;
        if (y !== 0) begin
            $display("TEST 9 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 9 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 0; sel = 1; #1;
        if (y !== 0) begin
            $display("TEST 10 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 10 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 1; sel = 0; #1;
        if (y !== 1) begin
            $display("TEST 11 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 11 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 0; sel = 1; #1;
        if (y !== 0) begin
            $display("TEST 12 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 12 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 1; sel = 1; #1;
        if (y !== 1) begin
            $display("TEST 13 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 13 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 0; sel = 0; #1;
        if (y !== 1) begin
            $display("TEST 14 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 14 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 0; sel = 0; #1;
        if (y !== 0) begin
            $display("TEST 15 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 15 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 1; sel = 1; #1;
        if (y !== 1) begin
            $display("TEST 16 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 16 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 1; sel = 0; #1;
        if (y !== 0) begin
            $display("TEST 17 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 17 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 0; sel = 1; #1;
        if (y !== 0) begin
            $display("TEST 18 FAIL: a=%b b=%b sel=%b expected y=0 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 18 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 1; b = 1; sel = 0; #1;
        if (y !== 1) begin
            $display("TEST 19 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 19 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        a = 0; b = 1; sel = 1; #1;
        if (y !== 1) begin
            $display("TEST 20 FAIL: a=%b b=%b sel=%b expected y=1 got y=%b", a, b, sel, y);
            errors = errors + 1;
        end else begin
            $display("TEST 20 PASS: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        end

        if (errors == 0) begin
            $display("ALL TESTS PASSED");
        end else begin
            $display("%0d TEST(S) FAILED", errors);
        end

        $finish;
    end
endmodule