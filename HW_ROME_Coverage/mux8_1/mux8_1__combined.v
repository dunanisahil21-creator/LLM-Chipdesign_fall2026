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
