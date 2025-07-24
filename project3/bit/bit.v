// bit.v
module bit (
    input wire clk,
    input wire load,
    input wire in,
    output reg out
);

always @(posedge clk) begin
    if (load)
        out <= in;
end

endmodule
