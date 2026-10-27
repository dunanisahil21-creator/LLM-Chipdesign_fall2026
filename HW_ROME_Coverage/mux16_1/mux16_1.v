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
