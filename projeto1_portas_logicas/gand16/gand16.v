module gand16(
    input [15:0] in1,
    input [15:0] in2, 
    output [15:0] out  
);
    // Aplica a operação AND bit a bit entre as duas entradas de 16 bits
    assign out = in1 & in2;
endmodule