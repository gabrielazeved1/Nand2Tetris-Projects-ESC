`timescale 1ns / 1ps

module tb_ram64;

reg clk;
reg load;
reg [5:0] address;
reg [15:0] in;
wire [15:0] out;

ram64 uut (
    .clk(clk),
    .load(load),
    .address(address),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("ram64.vcd");
    $dumpvars(0, tb_ram64);

    load = 0; address = 6'b000000; in = 16'h0000;
    #10;

    load = 1; address = 6'b000010; in = 16'habcd;  // escreve na posição 2
    #10;
    load = 0;
    #10;

    address = 6'b000010; // lê da posição 2
    #10;

    load = 1; address = 6'b111111; in = 16'h1234;  // escreve na posição 63
    #10;
    load = 0;
    #10;

    address = 6'b111111; // lê da posição 63
    #10;

    address = 6'b000000; // lê da posição 0 (sem escrita)
    #10;

    $finish;
end

endmodule
