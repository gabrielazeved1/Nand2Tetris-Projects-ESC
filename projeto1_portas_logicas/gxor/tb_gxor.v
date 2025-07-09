`timescale 1ns / 1ps // define a unidade de tempo 

module tb_gxor;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg input_a;   // sinal de entrada 'a' para o gxor
    reg input_b;   // sinal de entrada 'b' para o gxor
    wire output_out; // sinal de saída 'out' do gxor

    // instanciação do seu módulo gxor
    gxor dut (
        .a(input_a),
        .b(input_b),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("gxor.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_gxor); // inclui todos os sinais no escopo atual (tb_gxor) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | Input_A | Input_B | Output_Out");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %b | %b | %b", $time, input_a, input_b, output_out);

        // --- cenários de teste para a porta XOR (Tabela Verdade) ---
        // A  B | OUT (XOR)
        // 0  0 | 0
        // 0  1 | 1
        // 1  0 | 1
        // 1  1 | 0

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