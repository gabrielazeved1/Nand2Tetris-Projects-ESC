module mux4way16(
    input [15:0] a,    // Primeira entrada de 16 bits
    input [15:0] b,    // Segunda entrada de 16 bits
    input [15:0] c,    // Terceira entrada de 16 bits
    input [15:0] d,    // Quarta entrada de 16 bits
    input [1:0] sel,   // Sinal de seleção de 2 bits
    output [15:0] out  // Saída de 16 bits
);
    // Declaração de um reg temporário para a saída dentro do bloco always
    reg [15:0] temp_out;

    // Implementa o multiplexador de 4 para 1
    // Usa uma instrução case para selecionar a saída baseada em 'sel'
    always @(*) begin
        case (sel)
            2'b00: temp_out = a;
            2'b01: temp_out = b;
            2'b10: temp_out = c;
            2'b11: temp_out = d;
            default: temp_out = 16'bx; // Saída indefinida para seleções inválidas
        endcase
    end
    
    assign out = temp_out; // Atribui o valor do reg 'temp_out' para a saída 'out' (que é um wire)
endmodule