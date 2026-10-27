`timescale 1ns/1ps
module adder4_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    integer errors;
    adder4 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
        $dumpfile("adder4.vcd");
        $dumpvars(0, adder4_tb);
        errors = 0;
        // Baseline cases - deliberately limited: a handful of common patterns
        a=4'h0; b=4'h0; cin=0; #1;
        if ({cout,sum} !== 5'h00) begin $display("ERR t1"); errors=errors+1; end else $display("Test 1 passed: 0+0");
        a=4'h3; b=4'h5; cin=0; #1;
        if ({cout,sum} !== 5'h08) begin $display("ERR t2"); errors=errors+1; end else $display("Test 2 passed: 3+5");
        a=4'hF; b=4'h1; cin=0; #1;
        if ({cout,sum} !== 5'h10) begin $display("ERR t3"); errors=errors+1; end else $display("Test 3 passed: F+1");
        a=4'hF; b=4'hF; cin=1; #1;
        if ({cout,sum} !== 5'h1F) begin $display("ERR t4"); errors=errors+1; end else $display("Test 4 passed: F+F+1");
        a=4'h7; b=4'h8; cin=0; #1;
        if ({cout,sum} !== 5'h0F) begin $display("ERR t5"); errors=errors+1; end else $display("Test 5 passed: 7+8");

        if (errors == 0) $display("passed!");
        else $display("FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule
