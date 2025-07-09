module dmux4way(
    input in,
    input [1:0] sel,
    output a,
    output b,
    output c,
    output d
);
    // Demultiplexador de 1 para 4
    // A entrada 'in' é direcionada para uma das 4 saídas (a, b, c, d)
    // conforme o valor de 'sel'. As outras saídas são 0.
    
    assign a = (sel == 2'b00) ? in : 1'b0;
    assign b = (sel == 2'b01) ? in : 1'b0;
    assign c = (sel == 2'b10) ? in : 1'b0;
    assign d = (sel == 2'b11) ? in : 1'b0;

endmodule