module or8way(
    input [7:0] in, 
    output out     
);
    // Aplica a operação OR a todos os 8 bits da entrada 'in'.
    // A saída será 1 se QUALQUER um dos bits de entrada for 1.
    // A saída será 0 SOMENTE se TODOS os bits de entrada forem 0.
    assign out = |in; // Operador de redução OR
endmodule