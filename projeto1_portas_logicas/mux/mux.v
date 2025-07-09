module mux(
    input a,
    input b,
    input sel, 
    output out
);
    //  multiplexador seleciona entre 'a' e 'b' baseado em 'sel'
    // Se sel=0, out=a. Se sel=1, out=b.
    assign out = (sel == 0) ? a : b; 
endmodule