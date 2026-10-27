`timescale 1ns/1ps
module full_adder_tb;
    reg a, b, cin;
    wire sum, cout;
    integer errors;
    full_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
        errors = 0;
        // All 8 input combinations
        a=0; b=0; cin=0; #1;
        if (sum !== 0 || cout !== 0) begin $display("ERROR 000"); errors=errors+1; end else $display("Test 1 passed: 0+0+0");
        a=0; b=0; cin=1; #1;
        if (sum !== 1 || cout !== 0) begin $display("ERROR 001"); errors=errors+1; end else $display("Test 2 passed: 0+0+1");
        a=0; b=1; cin=0; #1;
        if (sum !== 1 || cout !== 0) begin $display("ERROR 010"); errors=errors+1; end else $display("Test 3 passed: 0+1+0");
        a=0; b=1; cin=1; #1;
        if (sum !== 0 || cout !== 1) begin $display("ERROR 011"); errors=errors+1; end else $display("Test 4 passed: 0+1+1");
        a=1; b=0; cin=0; #1;
        if (sum !== 1 || cout !== 0) begin $display("ERROR 100"); errors=errors+1; end else $display("Test 5 passed: 1+0+0");
        a=1; b=0; cin=1; #1;
        if (sum !== 0 || cout !== 1) begin $display("ERROR 101"); errors=errors+1; end else $display("Test 6 passed: 1+0+1");
        a=1; b=1; cin=0; #1;
        if (sum !== 0 || cout !== 1) begin $display("ERROR 110"); errors=errors+1; end else $display("Test 7 passed: 1+1+0");
        a=1; b=1; cin=1; #1;
        if (sum !== 1 || cout !== 1) begin $display("ERROR 111"); errors=errors+1; end else $display("Test 8 passed: 1+1+1");

        if (errors == 0) $display("passed!");
        else $display("FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule
