`timescale 1ns / 1ps // define a unidade de tempo 

module tb_dmux8way;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg input_in;
    reg [2:0] input_sel;
    wire output_a;
    wire output_b;
    wire output_c;
    wire output_d;
    wire output_e;
    wire output_f;
    wire output_g;
    wire output_h;

    // instanciação do seu módulo dmux8way
    dmux8way dut (
        .in(input_in),
        .sel(input_sel),
        .a(output_a),
        .b(output_b),
        .c(output_c),
        .d(output_d),
        .e(output_e),
        .f(output_f),
        .g(output_g),
        .h(output_h)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("dmux8way.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_dmux8way); // inclui todos os sinais no escopo atual (tb_dmux8way) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | IN | SEL (bin) | OUT_A | OUT_B | OUT_C | OUT_D | OUT_E | OUT_F | OUT_G | OUT_H");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b", $time,
                 input_in, input_sel, output_a, output_b, output_c, output_d,
                 output_e, output_f, output_g, output_h);

        // --- cenários de teste para o Demultiplexador de 1 para 8 ---

        // Inicializa todas as entradas
        input_in = 0; input_sel = 3'b000;
        #0.1; // Pequeno atraso inicial

        // Testes com Input_IN = 1 (para ver o direcionamento para cada saída)
        input_in = 1;

        input_sel = 3'b000; #5; // IN -> OUT_A
        input_sel = 3'b001; #5; // IN -> OUT_B
        input_sel = 3'b010; #5; // IN -> OUT_C
        input_sel = 3'b011; #5; // IN -> OUT_D
        input_sel = 3'b100; #5; // IN -> OUT_E
        input_sel = 3'b101; #5; // IN -> OUT_F
        input_sel = 3'b110; #5; // IN -> OUT_G
        input_sel = 3'b111; #5; // IN -> OUT_H

        // Testes com Input_IN = 0 (para ver que todas as saídas são 0)
        #10; // Atraso para demarcar a mudança

        input_in = 0;
        input_sel = 3'b000; #5; // IN -> OUT_A (mas IN=0, então OUT_A=0)
        input_sel = 3'b001; #5; // IN -> OUT_B (mas IN=0, então OUT_B=0)
        input_sel = 3'b010; #5; // IN -> OUT_C (mas IN=0, então OUT_C=0)
        input_sel = 3'b011; #5; // IN -> OUT_D (mas IN=0, então OUT_D=0)
        input_sel = 3'b100; #5; // IN -> OUT_E (mas IN=0, então OUT_E=0)
        input_sel = 3'b101; #5; // IN -> OUT_F (mas IN=0, então OUT_F=0)
        input_sel = 3'b110; #5; // IN -> OUT_G (mas IN=0, então OUT_G=0)
        input_sel = 3'b111; #5; // IN -> OUT_H (mas IN=0, então OUT_H=0)
        
        $finish; // termina a simulação
    end

endmodule