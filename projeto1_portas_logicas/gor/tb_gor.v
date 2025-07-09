`timescale 1ns / 1ps // define a unidade de tempo 

module tb_gor;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg input_a;   // sinal de entrada 'a' para o gor
    reg input_b;   // sinal de entrada 'b' para o gor
    wire output_out; // sinal de saída 'out' do gor

    // instanciação do seu módulo gor
    gor dut (
        .a(input_a),
        .b(input_b),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("gor.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_gor); // inclui todos os sinais no escopo atual (tb_gor) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | Input_A | Input_B | Output_Out");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %b | %b | %b", $time, input_a, input_b, output_out);

        // --- cenários de teste para a porta OR (Tabela Verdade) ---
        // A  B | OUT (OR)
        // 0  0 | 0
        // 0  1 | 1
        // 1  0 | 1
        // 1  1 | 1

        input_a = 0;
        input_b = 0;
        #0.1; 

        input_a = 0;
        input_b = 1;
        #0.1;

        input_a = 1;
        input_b = 0;
        #0.1;

        input_a = 1;
        input_b = 1;
        #0.1;

        $finish; 
    end

endmodule