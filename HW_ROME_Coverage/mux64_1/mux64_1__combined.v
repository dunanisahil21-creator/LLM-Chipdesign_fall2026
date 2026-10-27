module mux2_1(input wire in1, input wire in2, input wire select, output wire out);
    assign out = select ? in2 : in1;
endmodule
module mux4_1(input [1:0] sel, input [3:0] in, output reg out);
    always @(*) begin
        case(sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            2'b11: out = in[3];
            default: out = 1'b0; // Default case for safety
        endcase
    end
endmodule
module mux8_1(input [2:0] sel, input [7:0] in, output reg out);
    wire [3:0] mux4_out;

    mux4_1 mux4_0 (
        .sel(sel[2:1]),
        .in(in[3:0]),
        .out(mux4_out[0])
    );

    mux4_1 mux4_1 (
        .sel(sel[2:1]),
        .in(in[7:4]),
        .out(mux4_out[1])
    );

    always @(*) begin
        case (sel[0])
            1'b0: out = mux4_out[0];
            1'b1: out = mux4_out[1];
        endcase
    end
endmodule
module mux16_1(input [3:0] sel, input [15:0] in, output out);
    wire [1:0] sel4;
    wire [3:0] mux4_out;

    // Instantiate four 4-to-1 multiplexers
    mux4_1 mux0(.sel(sel[1:0]), .in(in[3:0]), .out(mux4_out[0]));
    mux4_1 mux1(.sel(sel[1:0]), .in(in[7:4]), .out(mux4_out[1]));
    mux4_1 mux2(.sel(sel[1:0]), .in(in[11:8]), .out(mux4_out[2]));
    mux4_1 mux3(.sel(sel[1:0]), .in(in[15:12]), .out(mux4_out[3]));

    // Instantiate a 2-to-1 multiplexer to select between the outputs of the 4-to-1 multiplexers
    wire mux2_out;
    mux2_1 mux2to1(.in1(mux4_out[0]), .in2(mux4_out[1]), .select(sel[3]), .out(mux2_out));
    assign out = sel[2] ? mux4_out[2] : (sel[3] ? mux2_out : mux4_out[1]);
endmodule
module mux32_1(input [4:0] sel, input [31:0] in, output reg [31:0] out);
    wire [15:0] mux0_out, mux1_out;

    mux16_1 mux0 (
        .sel(sel[3:0]),
        .in(in[15:0]),
        .out(mux0_out)
    );

    mux16_1 mux1 (
        .sel(sel[3:0]),
        .in(in[31:16]),
        .out(mux1_out)
    );

    always @(*) begin
        case(sel[4:3])
            2'b00: out = {mux0_out, 16'b0}; 
            2'b01: out = {mux1_out, 16'b0}; 
            2'b10: out = {16'b0, mux0_out}; 
            2'b11: out = {16'b0, mux1_out}; 
            default: out = 32'b0; 
        endcase
    end
endmodule
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
