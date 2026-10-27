module mux64_1(input [5:0] sel, input [63:0] in, output reg [63:0] out);
  wire [31:0] mux_out0, mux_out1;

  mux32_1 mux0(.sel(sel[4:0]), .in(in[31:0]), .out(mux_out0));
  mux32_1 mux1(.sel(sel[4:0]), .in(in[63:32]), .out(mux_out1));
  
  always @(*) begin
    case(sel[5:4])
      2'b00: out = {32'b0, mux_out0}; 
      2'b01: out = {32'b0, mux_out1}; 
      2'b10: out = 64'b0;
      2'b11: out = 64'b0;
      default: out = 64'b0;
    endcase
  end
endmodule
