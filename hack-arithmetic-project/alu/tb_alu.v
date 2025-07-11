`timescale 1ns / 1ps

module tb_alu;

    reg  [15:0] x, y;
    reg  zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;

    alu uut (
        .x(x), .y(y),
        .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no),
        .out(out), .zr(zr), .ng(ng)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        $display("   x          y     zx nx zy ny f no |        out         zr ng");
        $monitor("%b %b %b  %b  %b  %b  %b %b | %b   %b  %b", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

        // 0 (zera tudo)
        x = 16'h0000; y = 16'h0000;
        zx=1; nx=0; zy=1; ny=0; f=1; no=0; #10;

        // 1 (complemento de zero)
        zx=1; nx=1; zy=1; ny=1; f=1; no=1; #10;

        // x + y
        x = 16'd5; y = 16'd3;
        zx=0; nx=0; zy=0; ny=0; f=1; no=0; #10;

        // x - y
        zx=0; nx=0; zy=0; ny=1; f=1; no=1; #10;

        // y - x
        zx=0; nx=1; zy=0; ny=0; f=1; no=1; #10;

        // x & y
        zx=0; nx=0; zy=0; ny=0; f=0; no=0; #10;

        // ~x & y
        zx=0; nx=1; zy=0; ny=0; f=0; no=0; #10;

        $finish;
    end

endmodule
