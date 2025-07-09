`timescale 1ns / 1ps // define a unidade de tempo 

module tb_dmux;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg input_in;    // entrada do demultiplexador
    reg input_sel;   // entrada de seleção 'sel'
    wire output_a;   // saída 'a' do demultiplexador
    wire output_b;   // saída 'b' do demultiplexador

    // instanciação do seu módulo dmux
    dmux dut (
        .in(input_in),
        .sel(input_sel),
        .a(output_a),
        .b(output_b)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("dmux.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_dmux); // inclui todos os sinais no escopo atual (tb_dmux) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | Input_IN | Input_SEL | Output_A | Output_B");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %b | %b | %b | %b", $time, input_in, input_sel, output_a, output_b);

        // --- cenários de teste para o Demultiplexador (Tabela Verdade) ---
        // SEL | IN | OUT_A | OUT_B
        // 0   | 0  | 0     | 0
        // 0   | 1  | 1     | 0
        // 1   | 0  | 0     | 0
        // 1   | 1  | 0     | 1

        // Inicializa todas as entradas
        input_in = 0; input_sel = 0;
        #0.1; // Pequeno atraso inicial para registrar o estado 0

        // Testes com SEL = 0 (entrada 'in' deve ir para a saída 'a')
        input_sel = 0;
        $display("\n--- Testes com SEL = 0 (OUT_A = IN, OUT_B = 0) ---");
        
        input_in = 0; #5; // OUT_A=0, OUT_B=0
        input_in = 1; #5; // OUT_A=1, OUT_B=0

        // Grande atraso para demarcar a mudança de SEL
        #10; // Atraso maior antes de mudar o SEL, para melhor visualização

        // Testes com SEL = 1 (entrada 'in' deve ir para a saída 'b')
        input_sel = 1;
        $display("\n--- Testes com SEL = 1 (OUT_A = 0, OUT_B = IN) ---");

        input_in = 0; #5; // OUT_A=0, OUT_B=0
        input_in = 1; #5; // OUT_A=0, OUT_B=1
        
        $finish; // termina a simulação
    end

endmodule