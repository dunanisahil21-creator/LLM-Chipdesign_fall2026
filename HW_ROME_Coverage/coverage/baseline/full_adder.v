module full_adder(input a, input b, input cin, output sum, output cout);
    wire sum1, carry1, carry2;

    half_adder HA1 (.a(a), .b(b), .sum(sum1), .carry(carry1));
    half_adder HA2 (.a(sum1), .b(cin), .sum(sum), .carry(carry2));
    assign cout = carry1 | carry2;
endmodule
