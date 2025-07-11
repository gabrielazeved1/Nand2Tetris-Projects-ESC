`timescale 1ns / 1ps

module tb_fulladder;

    reg a, b, cin;
    wire sum, cout;

    fulladder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("fulladder.vcd");
        $dumpvars(0, tb_fulladder);
        $display("A B Cin | Sum Cout");
        $monitor("%b %b  %b  |  %b    %b", a, b, cin, sum, cout);

        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
    end

endmodule
