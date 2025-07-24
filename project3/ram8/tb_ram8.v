`timescale 1ns / 1ps

module tb_ram8;

reg clk;
reg load;
reg [2:0] address;
reg [15:0] in;
wire [15:0] out;

ram8 uut (
    .clk(clk),
    .load(load),
    .address(address),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("ram8.vcd");
    $dumpvars(0, tb_ram8);

    load = 0; address = 3'b000; in = 16'h0000;
    #10;

    load = 1; address = 3'b010; in = 16'habcd;  // Escreve na posição 2
    #10;
    load = 0;
    #10;

    address = 3'b010; // Lê da posição 2
    #10;

    load = 1; address = 3'b111; in = 16'h1234;  // Escreve na posição 7
    #10;
    load = 0;
    #10;

    address = 3'b111; // Lê da posição 7
    #10;

    address = 3'b000; // Lê da posição 0 (sem escrita)
    #10;

    $finish;
end

endmodule
