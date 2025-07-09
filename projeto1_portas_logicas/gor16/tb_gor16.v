`timescale 1ns / 1ps // define a unidade de tempo 

module tb_gor16;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg [15:0] input_in1; // primeira entrada de 16 bits para o gor16
    reg [15:0] input_in2; // segunda entrada de 16 bits para o gor16
    wire [15:0] output_out; // saída de 16 bits do gor16

    // instanciação do seu módulo gor16
    gor16 dut (
        .in1(input_in1),
        .in2(input_in2),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("gor16.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_gor16); // inclui todos os sinais no escopo atual (tb_gor16) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | In1 (hex) | In2 (hex) | Out (hex)");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %h | %h | %h", $time, input_in1, input_in2, output_out);

        // --- cenários de teste para a porta OR de 16 bits ---

        input_in1 = 16'h0000;
        input_in2 = 16'h0000;
        #0.1;

        input_in1 = 16'h0000;
        input_in2 = 16'hFFFF;
        #0.1;

        input_in1 = 16'hFFFF;
        input_in2 = 16'h0000;
        #0.1;

        input_in1 = 16'hFFFF;
        input_in2 = 16'hFFFF;
        #0.1;

        input_in1 = 16'hF0F0;
        input_in2 = 16'h0FF0;
        #0.1;

        input_in1 = 16'hAAAA;
        input_in2 = 16'h5555;
        #0.1;

        $finish; 
    end

endmodule