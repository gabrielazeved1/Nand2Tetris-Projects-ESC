module ram4k (
    input [15:0] in,
    input [11:0] address,
    input load,
    input clk,
    output reg [15:0] out
);

    reg [15:0] ram [4095:0];
    integer i;

    initial begin
        for (i = 0; i < 4096; i = i + 1)
            ram[i] = 16'h0000;
    end

    always @(posedge clk) begin
        if (load)
            ram[address] <= in;
        out <= ram[address];
    end

endmodule
