`timescale 1ns / 1ps

module tb_inc16;

    reg  [15:0] in;
    wire [15:0] out;

    inc16 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("inc16.vcd");
        $dumpvars(0, tb_inc16);

        $display("        IN         |        OUT");
        $monitor("%b | %b", in, out);

        in = 16'b0000000000000000; #10;
        in = 16'b0000000000000001; #10;
        in = 16'b0000000000001111; #10;
        in = 16'b1111111111111110; #10;
        in = 16'b1111111111111111; #10;

        $finish;
    end

endmodule
