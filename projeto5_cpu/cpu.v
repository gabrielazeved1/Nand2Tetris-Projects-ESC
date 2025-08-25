`include "alu.v"
module CPU(
    input wire clk,
    input wire [15:0] inM,          // entrada do valor M (M = conteudo da RAM[A])
    input wire [15:0] instruction,  // instrucao para execucao
    input wire reset,               // indica se deve reiniciar o programa atual
                                    // (reset==1) ou continuar executando o
                                    // programa atual (reset==0).

    output wire [15:0] outM,        // saida do valor M
    output wire loadM,              // escrever em M?
    output wire [15:0] addressM,    // endereco na memoria de dados (de M) para leitura
    output reg [15:0] pc            // endereco da proxima instrucao
);

    assign addressM = regA;
    wire loadI;
    wire loadA;
    wire loadD;
    assign outM = outALU;    
    wire [15:0] am;
    assign am = (instruction[12]) ? inM : regA;
    wire lt;
    wire eq;
    wire jmp;
    wire inc;
    wire [15:0] outALU;
        
    reg [15:0] regA;
    reg [15:0] regD;


    // sinais de controle para carregamento de registradores
    assign loadI = ~instruction[15]; // carrega instrucao no registrador A se o bit 15 for 0
    assign loadA = instruction[15] & instruction[5]; // carrega valor no registrador A se o bit 15 e o bit 5 forem 1
    assign loadD = instruction[15] & instruction[4]; // carrega valor no registrador D se o bit 15 e o bit 4 forem 1
    assign loadM = instruction[15] & instruction[3]; // carrega valor na memoria se o bit 15 e o bit 3 forem 1

    // logica de salto condicional
    assign jmp = instruction[15] & ((lt & instruction[2]) | (eq & instruction[1]) | ((!(lt | eq)) & instruction[0]));

    // logica de atualizacao do contador de programa (pc)
    always @(posedge clk) begin
        if (reset) 
            pc <= 0; // reseta o PC para 0
        else if (jmp) 
            pc <= regA; // salta para o endereco no registrador A
        else 
            pc <= pc + 1; // incrementa o PC
    end

    // logica de atualizacao do registrador A
    always @(posedge clk) begin
        if (reset) 
            regA <= 0; // reseta o registrador A para 0
        else if (loadI) 
            regA <= instruction; // carrega a instrucao no registrador A
        else if (loadA) 
            regA <= outALU; // carrega o valor da ALU no registrador A
        else 
            regA <= regA; // mantem o valor atual do registrador A
    end

    // logica de atualizacao do registrador D
    always @(posedge clk) begin
        if (reset) 
            regD <= 0; // reseta o registrador D para 0
        else if (loadD) 
            regD <= outALU; // carrega o valor da ALU no registrador D
        else 
            regD <= regD; // mantem o valor atual do registrador D
    end

endmodule
