module tb_pc;

reg clk;
reg reset;
reg load;
reg inc;
reg [15:0] in;
wire [15:0] out;

pc uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .inc(inc),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, tb_pc);

    reset = 1; load = 0; inc = 0; in = 16'h0000;
    #10;
    reset = 0;
    #10;

    load = 1; in = 16'h00FF;
    #10;
    load = 0;
    #10;

    inc = 1;
    #30;
    inc = 0;
    #10;

    reset = 1;
    #10;
    reset = 0;
    #10;

    $finish;
end

endmodule
