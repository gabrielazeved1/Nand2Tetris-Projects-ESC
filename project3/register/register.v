// register.v
module register (
    input wire clk,
    input wire load,
    input wire [15:0] in,
    output wire [15:0] out
);

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : bits
        bit bit_inst (
            .clk(clk),
            .load(load),
            .in(in[i]),
            .out(out[i])
        );
    end
endgenerate

endmodule
