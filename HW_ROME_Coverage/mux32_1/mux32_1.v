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
