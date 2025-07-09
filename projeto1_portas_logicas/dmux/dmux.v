module dmux(
    input in,
    input sel, 
    output a,
    output b
);

    assign a = (sel == 0) ? in : 1'b0; // Se sel=0, 'a' recebe 'in', senão 'a' é 0
    assign b = (sel == 1) ? in : 1'b0; // Se sel=1, 'b' recebe 'in', senão 'b' é 0
endmodule