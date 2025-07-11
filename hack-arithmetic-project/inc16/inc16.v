module inc16 (
    input  wire [15:0] in,
    output wire [15:0] out
);

    wire [15:0] one = 16'b0000000000000001;

    add16 adder (
        .a(in),
        .b(one),
        .sum(out)
    );

endmodule

// add16 reusado aqui
module add16 (
    input  wire [15:0] a,
    input  wire [15:0] b,
    output wire [15:0] sum
);
    wire [15:0] carry;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : add_bit
            if (i == 0) begin
                fulladder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(1'b0),
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end else begin
                fulladder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(carry[i-1]),
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end
        end
    endgenerate
endmodule

module fulladder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
