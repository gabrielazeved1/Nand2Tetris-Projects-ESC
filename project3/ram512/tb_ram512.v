module tb_ram512;

reg clk;
reg load;
reg [8:0] address;
reg [15:0] in;
wire [15:0] out;

ram512 uut (
    .clk(clk),
    .load(load),
    .address(address),
    .in(in),
    .out(out)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("ram512.vcd");
    $dumpvars(0, tb_ram512);

    load = 0; address = 9'b000000000; in = 16'h0000;
    #10;

    load = 1; address = 9'b000000010; in = 16'habcd;  // escreve na posição 2
    #10;
    load = 0;
    #10;

    address = 9'b000000010; // lê da posição 2
    #10;

    load = 1; address = 9'b111111111; in = 16'h1234;  // escreve na posição 511
    #10;
    load = 0;
    #10;

    address = 9'b111111111; // lê da posição 511
    #10;

    address = 9'b000000000; // lê da posição 0 (sem escrita)
    #10;

    $finish;
end

endmodule
