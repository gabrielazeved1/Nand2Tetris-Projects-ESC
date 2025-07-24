// tb_dff.v
`timescale 1ns/1ps

module tb_dff;

reg clk;
reg reset;
reg d;
wire q;

// Instancia o DFF
dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// Clock 10ns período
initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0, tb_dff);

    // Inicializa sinais
    reset = 1;
    d = 0;

    // Testa reset ativo
    #10;
    reset = 0;

    // Testa entrada D
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;

    // Testa reset novamente
    reset = 1;
    #10;
    reset = 0;

    // Testa troca rápida de D
    d = 0;
    #7;
    d = 1;
    #8;
    d = 0;
    #10;

    $finish;
end

endmodule
