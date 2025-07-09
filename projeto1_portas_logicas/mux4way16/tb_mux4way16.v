`timescale 1ns / 1ps // define a unidade de tempo (1ns) e a precisão (1ps) da simulação

module tb_mux4way16;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg [15:0] input_a;    // entrada 'a' de 16 bits
    reg [15:0] input_b;    // entrada 'b' de 16 bits
    reg [15:0] input_c;    // entrada 'c' de 16 bits
    reg [15:0] input_d;    // entrada 'd' de 16 bits
    reg [1:0] input_sel;   // entrada de seleção de 2 bits
    wire [15:0] output_out; // saída de 16 bits

    // instanciação do seu módulo mux4way16
    mux4way16 dut (
        .a(input_a),
        .b(input_b),
        .c(input_c),
        .d(input_d),
        .sel(input_sel),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("mux4way16.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_mux4way16); // inclui todos os sinais no escopo atual (tb_mux4way16) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | In_A (hex) | In_B (hex) | In_C (hex) | In_D (hex) | SEL (bin) | Out (hex)");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %h | %h | %h | %h | %b | %h", $time, input_a, input_b, input_c, input_d, input_sel, output_out);

        // Inicializa todas as entradas
        input_a = 16'hAAAA; input_b = 16'hBBBB; input_c = 16'hCCCC; input_d = 16'hDDDD; input_sel = 2'b00;
        #0.1;

        // Testes com SEL = 00 (Saída deve ser igual a Input_A)
        input_sel = 2'b00;
        input_a = 16'h1111; input_b = 16'h2222; input_c = 16'h3333; input_d = 16'h4444; #5;
        input_a = 16'hAAAA; input_b = 16'hBBBB; input_c = 16'hCCCC; input_d = 16'hDDDD; #5;
        #10;

        // Testes com SEL = 01 (Saída deve ser igual a Input_B)
        input_sel = 2'b01;
        input_a = 16'h1111; input_b = 16'h2222; input_c = 16'h3333; input_d = 16'h4444; #5;
        input_a = 16'hAAAA; input_b = 16'hBBBB; input_c = 16'hCCCC; input_d = 16'hDDDD; #5;
        #10;

        // Testes com SEL = 10 (Saída deve ser igual a Input_C)
        input_sel = 2'b10;
        input_a = 16'h1111; input_b = 16'h2222; input_c = 16'h3333; input_d = 16'h4444; #5;
        input_a = 16'hAAAA; input_b = 16'hBBBB; input_c = 16'hCCCC; input_d = 16'hDDDD; #5;
        #10;

        // Testes com SEL = 11 (Saída deve ser igual a Input_D)
        input_sel = 2'b11;
        input_a = 16'h1111; input_b = 16'h2222; input_c = 16'h3333; input_d = 16'h4444; #5;
        input_a = 16'hAAAA; input_b = 16'hBBBB; input_c = 16'hCCCC; input_d = 16'hDDDD; #5;
        #10;
        
        $finish; // termina a simulação
    end

endmodule