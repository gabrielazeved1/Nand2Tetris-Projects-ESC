`timescale 1ns / 1ps

module tb_gnand;
    reg input_a;
    reg input_b;
    wire output_out;

    // instancia o dut
    gnand dut (
        .a(input_a),
        .b(input_b),
        .out(output_out)
    );


    initial begin
        // configurar o arquivo de dump de formas de onda (.vcd) para o GTKWave
        $dumpfile("gnand.vcd");
        $dumpvars(0, tb_gnand);

        $display("Time | Input_A | Input_B | Output_Out");
        $monitor("%0t | %b | %b | %b", $time, input_a, input_b, output_out);

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
// terminar a simulação
        $finish; 
    end

endmodule