`timescale 1ns/1ps
module half_adder_tb;
    reg a, b;
    wire sum, carry;
    integer errors;
    half_adder dut(.a(a), .b(b), .sum(sum), .carry(carry));
    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);
        errors = 0;
        // Four input combinations
        a=0; b=0; #1;
        if (sum !== 0 || carry !== 0) begin $display("ERROR 00: sum=%b carry=%b", sum, carry); errors=errors+1; end
        else $display("Test 1 passed: 0+0");
        a=0; b=1; #1;
        if (sum !== 1 || carry !== 0) begin $display("ERROR 01: sum=%b carry=%b", sum, carry); errors=errors+1; end
        else $display("Test 2 passed: 0+1");
        a=1; b=0; #1;
        if (sum !== 1 || carry !== 0) begin $display("ERROR 10: sum=%b carry=%b", sum, carry); errors=errors+1; end
        else $display("Test 3 passed: 1+0");
        a=1; b=1; #1;
        if (sum !== 0 || carry !== 1) begin $display("ERROR 11: sum=%b carry=%b", sum, carry); errors=errors+1; end
        else $display("Test 4 passed: 1+1");

        if (errors == 0) $display("passed!");
        else $display("FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule
