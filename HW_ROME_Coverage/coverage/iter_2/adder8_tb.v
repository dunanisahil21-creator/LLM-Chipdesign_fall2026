`timescale 1ns/1ps
module adder8_tb;
    reg [7:0] a, b;
    reg cin;
    wire [7:0] sum;
    wire cout;
    integer errors;
    adder8 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
        $dumpfile("adder8.vcd");
        $dumpvars(0, adder8_tb);
        errors = 0;
        // Deliberately limited baseline - more exhaustive patterns added in Part III
        a=8'h00; b=8'h00; cin=0; #1;
        if ({cout,sum} !== 9'h000) begin $display("ERR t1"); errors=errors+1; end else $display("Test 1 passed: 0+0");
        a=8'h12; b=8'h34; cin=0; #1;
        if ({cout,sum} !== 9'h046) begin $display("ERR t2"); errors=errors+1; end else $display("Test 2 passed: 12+34");
        a=8'hFF; b=8'h01; cin=0; #1;
        if ({cout,sum} !== 9'h100) begin $display("ERR t3"); errors=errors+1; end else $display("Test 3 passed: FF+1 overflow");
        a=8'hFF; b=8'hFF; cin=1; #1;
        if ({cout,sum} !== 9'h1FF) begin $display("ERR t4"); errors=errors+1; end else $display("Test 4 passed: FF+FF+1");
        a=8'h55; b=8'hAA; cin=0; #1;
        if ({cout,sum} !== 9'h0FF) begin $display("ERR t5"); errors=errors+1; end else $display("Test 5 passed: 55+AA");

        // New test cases for uncovered items
        a=8'hAA; b=8'h55; cin=0; #1;
        if ({cout,sum} !== 9'h0FF) begin $display("ERR t6"); errors=errors+1; end else $display("Test 6 passed: AA+55");
        a=8'hFF; b=8'hFF; cin=0; #1;
        if ({cout,sum} !== 9'h1FE) begin $display("ERR t7"); errors=errors+1; end else $display("Test 7 passed: FF+FF");
        a=8'h00; b=8'hFF; cin=1; #1;
        if ({cout,sum} !== 9'h100) begin $display("ERR t8"); errors=errors+1; end else $display("Test 8 passed: 0+FF+1");
        a=8'h01; b=8'h01; cin=1; #1;
        if ({cout,sum} !== 9'h003) begin $display("ERR t9"); errors=errors+1; end else $display("Test 9 passed: 1+1+1");
        a=8'h7F; b=8'h80; cin=1; #1;
        if ({cout,sum} !== 9'h100) begin $display("ERR t10"); errors=errors+1; end else $display("Test 10 passed: 7F+80+1");
        
        // Additional targeted test cases
        a=8'h7F; b=8'h01; cin=1; #1; // Test with carry from the least significant bit
        if ({cout,sum} !== 9'h080) begin $display("ERR t11"); errors=errors+1; end else $display("Test 11 passed: 7F+1+1");
        a=8'h80; b=8'h80; cin=0; #1; // Test with two high values
        if ({cout,sum} !== 9'h100) begin $display("ERR t12"); errors=errors+1; end else $display("Test 12 passed: 80+80");
        a=8'h0F; b=8'hF0; cin=0; #1; // Test with low and high values
        if ({cout,sum} !== 9'h0FF) begin $display("ERR t13"); errors=errors+1; end else $display("Test 13 passed: 0F+F0");
        a=8'h10; b=8'h10; cin=1; #1; // Test with carry and equal values
        if ({cout,sum} !== 9'h022) begin $display("ERR t14"); errors=errors+1; end else $display("Test 14 passed: 10+10+1");
        a=8'hFE; b=8'h01; cin=0; #1; // Test with values close to overflow
        if ({cout,sum} !== 9'h0FF) begin $display("ERR t15"); errors=errors+1; end else $display("Test 15 passed: FE+01");

        if (errors == 0) $display("passed!");
        else $display("FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule