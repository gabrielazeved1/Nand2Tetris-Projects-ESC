`timescale 1ns / 1ps // define a unidade de tempo 

module tb_gnot;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg input_a;    // sinal de entrada 'a' para o gnot
    wire output_out; // sinal de saída 'out' do gnot

    // instanciação do seu módulo gnot
    gnot dut (
        .a(input_a),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("gnot.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_gnot); // inclui todos os sinais no escopo atual (tb_gnot) para o .vcd

    
        $display("Time | Input_A | Output_Out");
       
        $monitor("%0t | %b | %b", $time, input_a, output_out);

        // --- cenários de teste para a porta NOT (Tabela Verdade) ---
        // A | OUT (NOT)
        // 0 | 1
        // 1 | 0

        
        input_a = 0;
        #0.1; 

        
        input_a = 1;
        #0.1;

        $finish; // termina a simulação
    end

endmodule