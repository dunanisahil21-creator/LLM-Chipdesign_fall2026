module adder8(input [7:0] a, input [7:0] b, input cin, output [7:0] sum, output cout);
  wire cout_low;

  adder4 low_adder(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(cout_low));
  adder4 high_adder(.a(a[7:4]), .b(b[7:4]), .cin(cout_low), .sum(sum[7:4]), .cout(cout));

endmodule
