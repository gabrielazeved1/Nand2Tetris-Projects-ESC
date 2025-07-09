module mux16(
    input [15:0] a,    
    input [15:0] b,    
    input sel,         
    output [15:0] out  
);
    // O multiplexador de 16 bits seleciona entre 'a' e 'b' (vetores de 16 bits) baseado em 'sel'.
    // Se sel=0, a saída 'out' é igual à entrada 'a'.
    // Se sel=1, a saída 'out' é igual à entrada 'b'.
    assign out = (sel == 1'b0) ? a : b;
endmodule