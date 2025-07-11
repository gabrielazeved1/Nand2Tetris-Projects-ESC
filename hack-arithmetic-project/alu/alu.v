module alu (
    input  wire [15:0] x,
    input  wire [15:0] y,
    input  wire zx, nx, zy, ny, f, no,
    output wire [15:0] out,
    output wire zr,
    output wire ng
);

    wire [15:0] x1, x2;
    wire [15:0] y1, y2;
    wire [15:0] out_f;
    wire [15:0] out_pre;

    assign x1 = zx ? 16'b0 : x;
    assign x2 = nx ? ~x1    : x1;

    assign y1 = zy ? 16'b0 : y;
    assign y2 = ny ? ~y1    : y1;

    assign out_f  = f ? (x2 + y2) : (x2 & y2);
    assign out_pre = no ? ~out_f  : out_f;

    assign out = out_pre;

    assign zr = (out == 16'b0);
    assign ng = out[15]; 

endmodule
