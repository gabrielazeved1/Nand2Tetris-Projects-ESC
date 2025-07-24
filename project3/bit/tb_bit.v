module tb_bit;

reg clk;
reg load;
reg in;
wire out;

bit bit_inst (
    .clk(clk),
    .load(load),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("bit.vcd");
    $dumpvars(0, tb_bit);

    load = 0; in = 0;
    #10;

    load = 1; in = 1; // carregar 1
    #10;
    load = 0; in = 0;
    #10;

    load = 1; in = 0; // carregar 0
    #10;
    load = 0;
    #10;

    load = 1; in = 1; // carregar 1 de novo
    #10;

    $finish;
end

endmodule
