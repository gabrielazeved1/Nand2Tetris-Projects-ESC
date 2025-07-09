module gnand(
    input a,
    input b,
    output out
);
    assign out = ~(a & b); // Implementação da porta NAND
endmodule