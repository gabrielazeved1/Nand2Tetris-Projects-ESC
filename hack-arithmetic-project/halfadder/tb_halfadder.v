`timescale 1ns / 1ps

module tb_halfadder;

    reg a, b;
    wire sum, carry;

    halfadder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("halfadder.vcd");      
        $dumpvars(0, tb_halfadder);      
        $display("A B | SUM CARRY");
        $monitor("%b %b |  %b    %b", a, b, sum, carry);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
