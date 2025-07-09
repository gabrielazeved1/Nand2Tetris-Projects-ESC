`timescale 1ns / 1ps // define a unidade de tempo 

module tb_mux16;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg [15:0] input_a;    // entrada 'a' de 16 bits
    reg [15:0] input_b;    // entrada 'b' de 16 bits
    reg input_sel;         // entrada de seleção (1 bit)
    wire [15:0] output_out; // saída de 16 bits

    // instanciação do seu módulo mux16
    mux16 dut (
        .a(input_a),
        .b(input_b),
        .sel(input_sel),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("mux16.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_mux16); // inclui todos os sinais no escopo atual (tb_mux16) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | In_A (hex) | In_B (hex) | SEL | Out (hex)");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %h | %h | %b | %h", $time, input_a, input_b, input_sel, output_out);

        // --- cenários de teste para o Multiplexador de 16 bits ---

        // Inicializa todas as entradas
        input_a = 16'h0000; input_b = 16'hFFFF; input_sel = 0;
        #0.1;

        // Testes com SEL = 0
        input_sel = 0;
        input_a = 16'h1234; input_b = 16'hABCD; #5;
        input_a = 16'h5678; input_b = 16'hEFFE; #5; 
        input_a = 16'hFFFF; input_b = 16'h0000; #5;
        input_a = 16'h0000; input_b = 16'hFFFF; #5;

        #10; // Atraso maior para demarcar a mudança de SEL

        // Testes com SEL = 1
        input_sel = 1;
        input_a = 16'h1234; input_b = 16'hABCD; #5;
        input_a = 16'h5678; input_b = 16'hEFFE; #5; 
        input_a = 16'hFFFF; input_b = 16'h0000; #5;
        input_a = 16'h0000; input_b = 16'hFFFF; #5;
        
        $finish; 
    end

endmodule