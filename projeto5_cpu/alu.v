module alu(
    // entradas
    input [15:0] x, 
    input [15:0] y,     
    input zx, 
    input nx, 
    input zy, 
    input ny, 
    input f, 
    input no,
    // saidas
    output reg [15:0] out,      
    output zr, 
    output ng    
);

    // combina os sinais de controle em um unico barramento
    wire [5:0] sel;
    assign sel = {zx, nx, zy, ny, f, no};

    // operacao da alu seguindo os sinais de controle
    always @(*) begin
        case (sel)
            6'b101010: out = 0;         // zero
            6'b111111: out = 1;         // um
            6'b111010: out = -1;        // menos um
            6'b001100: out = x;         // passa x
            6'b110000: out = y;         // passa y
            6'b001101: out = ~x;        // not x
            6'b110001: out = ~y;        // not y
            6'b001111: out = -x;        // negativo de x
            6'b110011: out = -y;        // negativo de y
            6'b011111: out = x + 1;     // incrementa x
            6'b110111: out = y + 1;     // incrementa y
            6'b000010: out = x + y;     // soma x e y
            6'b010011: out = x - y;     // subtrai y de x
            6'b000111: out = y - x;     // subtrai x de y
            6'b000000: out = x & y;     // and x e y
            6'b010101: out = x | y;     // or x e y
            default: out = 16'hxxxx;    // operacao indefinida
        endcase
    end

    // sinal de zero-> ativado se a saida for zero
    assign zr = (out == 0) ? 1 : 0;

    // sinal de negativo-> ativado se o bit mais significativo da saida for 1
    assign ng = out[15];

endmodule
