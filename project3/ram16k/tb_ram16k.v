`timescale 1ns / 1ps

module tb_ram16k;

reg clk;
reg load;
reg [13:0] address;
reg [15:0] in;
wire [15:0] out;

ram16k uut (
    .clk(clk),
    .load(load),
    .address(address),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("ram16k.vcd");
    $dumpvars(0, tb_ram16k);

    load = 0; address = 14'b00000000000000; in = 16'h0000;
    #10;

    load = 1; address = 14'b00000000000010; in = 16'habcd;  // escreve na posição 2
    #10;
    load = 0;
    #10;

    address = 14'b00000000000010; // lê da posição 2
    #10;

    load = 1; address = 14'b11111111111111; in = 16'h1234;  // escreve na posição 16383
    #10;
    load = 0;
    #10;

    address = 14'b11111111111111; // lê da posição 16383
    #10;

    address = 14'b00000000000000; // lê da posição 0 (sem escrita)
    #10;

    $finish;
end

endmodule
