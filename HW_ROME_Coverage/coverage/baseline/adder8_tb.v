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

        if (errors == 0) $display("passed!");
        else $display("FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule
