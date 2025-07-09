`timescale 1ns / 1ps // define a unidade de tempo 

module tb_gnot16;
    // declaração de sinais para conectar ao módulo DUT (Device Under Test)
    reg [15:0] input_in1; // primeira entrada de 16 bits para o gnot16
    reg [15:0] input_in2; // segunda entrada de 16 bits para o gnot16
    wire [15:0] output_out1; // primeira saída de 16 bits do gnot16
    wire [15:0] output_out2; // segunda saída de 16 bits do gnot16

    // instanciação do seu módulo gnot16
    gnot16 dut (
        .in1(input_in1),
        .in2(input_in2),
        .out1(output_out1),
        .out2(output_out2)
    );

    // bloco inicial: geração de estímulos, monitoramento e controle da simulação
    initial begin
        // configura o arquivo VCD para o GTKWave
        $dumpfile("gnot16.vcd"); // o nome do arquivo de saída para as formas de onda
        $dumpvars(0, tb_gnot16); // inclui todos os sinais no escopo atual (tb_gnot16) para o .vcd

        // exibe o cabeçalho no console da simulação
        $display("Time | In1 (hex) | In2 (hex) | Out1 (hex) | Out2 (hex)");
        // monitora e exibe as mudanças dos sinais no console
        $monitor("%0t | %h | %h | %h | %h", $time, input_in1, input_in2, output_out1, output_out2);

        

       
        input_in1 = 16'h0000; 
        input_in2 = 16'h0000; 
        #0.1; 

      
        input_in1 = 16'hFFFF;  
        input_in2 = 16'hFFFF; 
        #0.1; 


        input_in1 = 16'hAAAA; 
        input_in2 = 16'h5555; 
        #0.1; 

     
        input_in1 = 16'hF00F; 
        input_in2 = 16'h1234; 
        #0.1; 

        $finish; 
    end

endmodule