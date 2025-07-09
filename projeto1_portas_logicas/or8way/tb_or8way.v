`timescale 1ns / 1ps // define a unidade de tempo 

module tb_or8way;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg [7:0] input_in;    // entrada de 8 bits para o or8way
    wire output_out;       // saída de 1 bit do or8way

    // instanciação do seu módulo or8way
    or8way dut (
        .in(input_in),
        .out(output_out)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("or8way.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_or8way); // inclui todos os sinais no escopo atual (tb_or8way) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | Input_IN (hex) | Output_Out");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %h | %b", $time, input_in, output_out);

      

      
        input_in = 8'h00; 
        #0.1; 

      
        input_in = 8'h01; 
        #0.1; 

        
        input_in = 8'h80;
        #0.1; 

      
        input_in = 8'hAA; 
        #0.1; 

        
        input_in = 8'hFF; 
        #0.1; 

       
        input_in = 8'h0F; 
        #0.1; 
        
        $finish; 
    end

endmodule