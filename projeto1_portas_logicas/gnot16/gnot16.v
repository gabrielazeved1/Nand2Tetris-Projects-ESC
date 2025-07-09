module gnot16(
    input [15:0] in1, 
    input [15:0] in2, 
    output [15:0] out1, // Saída de 16 bits correspondente a in1 negado
    output [15:0] out2  // Saída de 16 bits correspondente a in2 negado
);
    
    assign out1 = ~in1;
    assign out2 = ~in2;
endmodule