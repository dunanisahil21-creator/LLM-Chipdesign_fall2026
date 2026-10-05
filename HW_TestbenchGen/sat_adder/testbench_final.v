module tb_sat_adder4;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    integer errors = 0;
    integer test_num = 0;

    // Instantiate the Device Under Test (DUT)
    sat_adder4 dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test patterns with expected values
        test_num = 1; a = 4'd0; b = 4'd0; #1; check_result(0);
        test_num = 2; a = 4'd7; b = 4'd5; #1; check_result(12);
        test_num = 3; a = 4'd15; b = 4'd0; #1; check_result(15);
        test_num = 4; a = 4'd8; b = 4'd8; #1; check_result(15);
        test_num = 5; a = 4'd15; b = 4'd15; #1; check_result(15);
        test_num = 6; a = 4'd1; b = 4'd1; #1; check_result(2);
        test_num = 7; a = 4'd3; b = 4'd2; #1; check_result(5);
        test_num = 8; a = 4'd4; b = 4'd4; #1; check_result(8);
        test_num = 9; a = 4'd2; b = 4'd3; #1; check_result(5);
        test_num = 10; a = 4'd10; b = 4'd6; #1; check_result(15);
        test_num = 11; a = 4'd14; b = 4'd3; #1; check_result(15);
        test_num = 12; a = 4'd5; b = 4'd10; #1; check_result(15);
        test_num = 13; a = 4'd12; b = 4'd4; #1; check_result(15);
        test_num = 14; a = 4'd6; b = 4'd9; #1; check_result(15);
        test_num = 15; a = 4'd13; b = 4'd3; #1; check_result(15);
        test_num = 16; a = 4'd0; b = 4'd15; #1; check_result(15);
        test_num = 17; a = 4'd15; b = 4'd1; #1; check_result(15);
        test_num = 18; a = 4'd7; b = 4'd9; #1; check_result(15);
        test_num = 19; a = 4'd11; b = 4'd5; #1; check_result(15);
        test_num = 20; a = 4'd9; b = 4'd7; #1; check_result(15);

        if (errors == 0) 
            $display("ALL TESTS PASSED");
        else 
            $display("%d TEST(S) FAILED", errors);

        $finish;
    end

    task check_result(input [3:0] expected);
        if (sum !== expected) begin
            $display("TEST %d FAIL: a=%d b=%d expected sum=%d got=%d", test_num, a, b, expected, sum);
            errors = errors + 1;
        end else begin
            $display("TEST %d PASS: a=%d b=%d sum=%d", test_num, a, b, sum);
        end
    endtask
endmodule