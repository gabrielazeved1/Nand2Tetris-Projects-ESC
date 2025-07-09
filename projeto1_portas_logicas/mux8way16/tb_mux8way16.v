`timescale 1ns / 1ps

module tb_mux8way16;
    reg [15:0] input_a;
    reg [15:0] input_b;
    reg [15:0] input_c;
    reg [15:0] input_d;
    reg [15:0] input_e;
    reg [15:0] input_f;
    reg [15:0] input_g;
    reg [15:0] input_h;
    reg [2:0] input_sel;
    wire [15:0] output_out;

    mux8way16 dut (
        .a(input_a),
        .b(input_b),
        .c(input_c),
        .d(input_d),
        .e(input_e),
        .f(input_f),
        .g(input_g),
        .h(input_h),
        .sel(input_sel),
        .out(output_out)
    );

    initial begin
        $dumpfile("mux8way16.vcd");
        $dumpvars(0, tb_mux8way16);

        $display("Time | In0 (hex) | In1 (hex) | In2 (hex) | In3 (hex) | In4 (hex) | In5 (hex) | In6 (hex) | In7 (hex) | SEL (bin) | Out (hex)");
        $monitor("%0t | %h | %h | %h | %h | %h | %h | %h | %h | %b | %h",
                 $time, input_a, input_b, input_c, input_d, input_e, input_f, input_g, input_h, input_sel, output_out);

        input_a = 16'h0000; input_b = 16'h1111; input_c = 16'h2222; input_d = 16'h3333;
        input_e = 16'h4444; input_f = 16'h5555; input_g = 16'h6666; input_h = 16'h7777;
        input_sel = 3'b000;
        #0.1;

        input_sel = 3'b000; #5;
        input_sel = 3'b001; #5;
        input_sel = 3'b010; #5;
        input_sel = 3'b011; #5;
        input_sel = 3'b100; #5;
        input_sel = 3'b101; #5;
        input_sel = 3'b110; #5;
        input_sel = 3'b111; #5;

        input_a = 16'hAAAA; input_b = 16'hBBBB; input_c = 16'hCCCC; input_d = 16'hDDDD;
        input_e = 16'hEEEE; input_f = 16'hFFFF; input_g = 16'h0123; input_h = 16'h4567;
        #10;

        input_sel = 3'b000; #5;
        input_sel = 3'b001; #5;
        input_sel = 3'b010; #5;
        input_sel = 3'b011; #5;
        input_sel = 3'b100; #5;
        input_sel = 3'b101; #5;
        input_sel = 3'b110; #5;
        input_sel = 3'b111; #5;

        $finish;
    end

endmodule