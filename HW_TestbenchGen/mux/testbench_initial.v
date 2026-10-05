module tb_mux21;
    reg a;
    reg b;
    reg sel;
    wire y;

    // Instantiate the DUT
    mux21 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test patterns
        {a, b, sel} = 3'b000; #1; $display("TEST 1: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b001; #1; $display("TEST 2: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b010; #1; $display("TEST 3: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b011; #1; $display("TEST 4: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b100; #1; $display("TEST 5: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b101; #1; $display("TEST 6: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b110; #1; $display("TEST 7: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b111; #1; $display("TEST 8: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        
        // Randomized / mid-range cases
        {a, b, sel} = 3'b010; #1; $display("TEST 9: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b101; #1; $display("TEST 10: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b110; #1; $display("TEST 11: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b001; #1; $display("TEST 12: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b011; #1; $display("TEST 13: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b100; #1; $display("TEST 14: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b000; #1; $display("TEST 15: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b111; #1; $display("TEST 16: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b010; #1; $display("TEST 17: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b101; #1; $display("TEST 18: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b110; #1; $display("TEST 19: a=%b b=%b sel=%b y=%b", a, b, sel, y);
        {a, b, sel} = 3'b001; #1; $display("TEST 20: a=%b b=%b sel=%b y=%b", a, b, sel, y);

        $finish;
    end
endmodule