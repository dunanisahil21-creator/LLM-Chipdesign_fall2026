`timescale 1ns/1ps
// Corrected shift_register testbench (fixed version).
// The official testbench downloaded from the GUIDE benchmark has inconsistent
// expected outputs (documented in the ChipChat submission via exhaustive 8-way
// analysis). This corrected testbench implements the natural-language spec
// faithfully: 8-bit left-shift register, active-low async reset, hold when
// shift_enable=0, shift a new bit in when shift_enable=1.
module tb_shift_register_fixed();
    reg clk, reset_n, data_in, shift_enable;
    wire [7:0] data_out;
    shift_register dut(.clk(clk), .reset_n(reset_n), .data_in(data_in),
                       .shift_enable(shift_enable), .data_out(data_out));
    initial clk = 0;
    always #5 clk = ~clk;
    integer errors = 0;
    initial begin
        // reset
        reset_n = 0; data_in = 0; shift_enable = 0;
        @(negedge clk); #1;
        if (data_out !== 8'b00000000) begin $display("RESET FAIL: %b", data_out); errors=errors+1; end
        else $display("RESET PASS: %b", data_out);
        // shift a 1 in
        reset_n = 1; data_in = 1; shift_enable = 1;
        @(negedge clk); #1;
        if (data_out !== 8'b00000001) begin $display("SHIFT FAIL: %b", data_out); errors=errors+1; end
        else $display("SHIFT PASS: %b", data_out);
        // hold
        data_in = 0; shift_enable = 0;
        @(negedge clk); #1;
        if (data_out !== 8'b00000001) begin $display("HOLD FAIL: %b", data_out); errors=errors+1; end
        else $display("HOLD PASS: %b", data_out);
        // continue shifting
        shift_enable = 1;
        @(negedge clk); #1;
        if (data_out !== 8'b00000010) begin $display("CONT FAIL: %b", data_out); errors=errors+1; end
        else $display("CONT PASS: %b", data_out);
        // shift 1 again
        data_in = 1;
        @(negedge clk); #1;
        if (data_out !== 8'b00000101) begin $display("SHIFT2 FAIL: %b", data_out); errors=errors+1; end
        else $display("SHIFT2 PASS: %b", data_out);
        // async reset mid-op
        reset_n = 0; #1;
        if (data_out !== 8'b00000000) begin $display("ASYNC RESET FAIL: %b", data_out); errors=errors+1; end
        else $display("ASYNC RESET PASS: %b", data_out);
        if (errors == 0) $display("All test cases passed!");
        else $display("%0d test(s) failed.", errors);
        $finish;
    end
endmodule
