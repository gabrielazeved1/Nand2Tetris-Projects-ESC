module tb_register;

reg clk;
reg load;
reg [15:0] in;
wire [15:0] out;

register uut (
    .clk(clk),
    .load(load),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("register.vcd");
    $dumpvars(0, tb_register);

    load = 0; in = 16'h0000;
    #10;

    load = 1; in = 16'hAAAA;  // padrão alternado 1010...
    #10;
    load = 0;
    #10;

    load = 1; in = 16'h5555;  // padrão alternado 0101...
    #10;
    load = 0;
    #10;

    load = 1; in = 16'hFFFF;  // todos 1
    #10;
    load = 0;
    #10;

    $finish;
end

endmodule
