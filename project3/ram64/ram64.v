module ram64 (
    input [15:0] in,
    input [5:0] address,
    input load,
    input clk,
    output reg [15:0] out
);

    reg [15:0] ram [63:0];
    integer i;

    initial begin
        for (i = 0; i < 64; i = i + 1)
            ram[i] = 16'h0000;
    end

    always @(posedge clk) begin
        if (load)
            ram[address] <= in;
        out <= ram[address];
    end

endmodule
