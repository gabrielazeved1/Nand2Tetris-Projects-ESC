`timescale 1ns / 1ps // define a unidade de tempo 

module tb_mux;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg input_a;    // entrada 'a' do multiplexador
    reg input_b;    // entrada 'b' do multiplexador
    reg input_sel;  // entrada de seleção 'sel'
    wire output_out; // saída do multiplexador

    // instanciação do seu módulo mux
    mux dut (
        .a(input_a),
        .b(input_b),
        .sel(input_sel),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("mux.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_mux); // inclui todos os sinais no escopo atual (tb_mux) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | Input_A | Input_B | Input_SEL | Output_Out");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %b | %b | %b | %b", $time, input_a, input_b, input_sel, output_out);

        // --- cenários de teste para o Multiplexador (Tabela Verdade) ---
        // SEL | A | B | OUT
        // 0   | 0 | 0 | 0 (saída = A)
        // 0   | 0 | 1 | 0 (saída = A)
        // 0   | 1 | 0 | 1 (saída = A)
        // 0   | 1 | 1 | 1 (saída = A)
        // 1   | 0 | 0 | 0 (saída = B)
        // 1   | 0 | 1 | 1 (saída = B)
        // 1   | 1 | 0 | 0 (saída = B)
        // 1   | 1 | 1 | 1 (saída = B)

        // testes com SEL = 0 (deve passar A para a saída)
        input_sel = 0;
        input_a = 0; input_b = 0; #0.1; 
        input_a = 0; input_b = 1; #0.1; 
        input_a = 1; input_b = 0; #0.1; 
        input_a = 1; input_b = 1; #0.1; 

        // testes com SEL = 1 (deve passar B para a saída)
        input_sel = 1;
        input_a = 0; input_b = 0; #0.1; 
        input_a = 0; input_b = 1; #0.1; 
        input_a = 1; input_b = 0; #0.1; 
        input_a = 1; input_b = 1; #0.1; 

        $finish; 
    end

endmodule