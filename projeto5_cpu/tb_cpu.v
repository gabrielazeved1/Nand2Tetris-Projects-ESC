`include "CPU.v"

module tb_CPU;
    // definicoes dos sinais
    reg clk;                     // clock
    reg reset;                   // sinal de reset
    reg [15:0] inM;              // valor de entrada M (memoria)
    reg [15:0] instruction;      // instrucao para execucao
    wire [15:0] outM;            // valor de saida M (memoria)
    wire loadM;                  // sinal para escrever em M
    wire [15:0] addressM;        // endereco da memoria de dados (M)
    wire [15:0] pc;              // contador de programa (program counter)

    // instancia da CPU
    CPU uut (
        .clk(clk),
        .inM(inM),
        .instruction(instruction),
        .reset(reset),
        .outM(outM),
        .loadM(loadM),
        .addressM(addressM),
        .pc(pc)
    );

    // gerador de clock
    always
        #1 clk = ~clk;  

    // como os sinais irao variar durante a simulacao
    initial begin
        $display("testando o modulo CPU");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_CPU);
        // inicializando os sinais
        clk = 0;
        reset = 0;
        inM = 16'd0;
        instruction = 16'd0;

        // resetando a CPU
        reset = 1;
        #2;
        reset = 0;

        // teste 1: carregar @12345 no registrador A (A = 12345)
        instruction = 16'b0011000000111001;  // @12345
        #2;  // espera 2 unidades de tempo (um ciclo de clock completo)
        
        // teste 2: executar D=A (D = 12345)
        instruction = 16'b1110110000010000;  // D=A
        #2;

        // teste 3: carregar @23456 no registrador A (A = 23456)
        instruction = 16'b0101101110100000;  // @23456
        #2;

        // teste 4: executar D=A-D (D = A-D)
        instruction = 16'b1110000111010000;  // D=A-D
        #2;

        // teste 5: carregar @1000 no registrador A (A = 1000)
        instruction = 16'b0000001111101000;  // @1000
        #2;

        // teste 6: executar M=D (M = D)
        instruction = 16'b1110001100001000;  // M=D
        #2;

        // teste 7: carregar @1001 no registrador A (A = 1001)
        instruction = 16'b0000001111101001;  // @1001
        #2;

        // teste 8: executar MD=D-1 (M e D = D-1)
        instruction = 16'b1110001110011000;  // MD=D-1
        #2;

        // teste 9: carregar @1000 no registrador A (A = 1000)
        instruction = 16'b0000001111101000;  // @1000
        #2;

        // teste 10: executar D=D-M (D = D - M)
        instruction = 16'b1111010011010000;  // D=D-M
        inM = 16'b11111;                     // define inM como 11111 (valor da memoria)
        #2;

        // continue com os outros testes conforme necessario, usando o mesmo padrao de delays e configuracoes.
        
        // finalizando a simulacao
        $finish;
    end

endmodule
