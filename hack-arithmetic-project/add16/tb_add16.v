`timescale 1ns / 1ps

module tb_add16;

    reg  [15:0] a, b;
    wire [15:0] sum;

    add16 uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $dumpfile("add16.vcd");
        $dumpvars(0, tb_add16);

        $display("        A            B         |      SUM");
        $monitor("%b %b | %b", a, b, sum);

        a = 16'b0000000000000001; b = 16'b0000000000000010; #10;
        a = 16'b0000000011110000; b = 16'b0000000000001111; #10;
        a = 16'b1111111111111111; b = 16'b0000000000000001; #10;
        a = 16'b1010101010101010; b = 16'b0101010101010101; #10;

        $finish;
    end

endmodule
