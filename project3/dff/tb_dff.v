module tb_dff;

reg clk;
reg reset;
reg d;
wire q;

// instancia o DFF
dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// clock 10ns período
initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0, tb_dff);

    // inicializa sinais
    reset = 1;
    d = 0;

    // testa reset ativo
    #10;
    reset = 0;

    // testa DFF com diferentes valores de D
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;

    // testa reset ativo novamente
    reset = 1;
    #10;
    reset = 0;

    
    d = 0;
    #7;
    d = 1;
    #8;
    d = 0;
    #10;

    $finish;
end

endmodule
