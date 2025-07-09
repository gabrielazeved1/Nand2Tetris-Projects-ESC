`timescale 1ns / 1ps // define a unidade de tempo 

module tb_dmux4way;
    reg input_in;
    reg [1:0] input_sel;
    wire output_a;
    wire output_b;
    wire output_c;
    wire output_d;

    dmux4way dut (
        .in(input_in),
        .sel(input_sel),
        .a(output_a),
        .b(output_b),
        .c(output_c),
        .d(output_d)
    );

    initial begin
        $dumpfile("dmux4way.vcd");
        $dumpvars(0, tb_dmux4way);

        $display("Time | IN | SEL (bin) | OUT_A | OUT_B | OUT_C | OUT_D");
        $monitor("%0t | %b | %b | %b | %b | %b | %b", $time, input_in, input_sel, output_a, output_b, output_c, output_d);

        // --- cenários de teste para o Demultiplexador de 1 para 4 ---

        // Inicializa todas as entradas
        input_in = 0; input_sel = 2'b00;
        #0.1; // Pequeno atraso inicial

        // Testes com Input_IN = 1
        input_in = 1;

        input_sel = 2'b00; #5;
        input_sel = 2'b01; #5;
        input_sel = 2'b10; #5;
        input_sel = 2'b11; #5;

        // Testes com Input_IN = 0
        #10;

        input_in = 0;
        input_sel = 2'b00; #5;
        input_sel = 2'b01; #5;
        input_sel = 2'b10; #5;
        input_sel = 2'b11; #5;
        
        $finish;
    end

endmodule