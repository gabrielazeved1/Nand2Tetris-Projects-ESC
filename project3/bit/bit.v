module bit (
    input wire clk,
    input wire load,
    input wire in,
    output reg out
);

initial begin
    out = 0;  // Inicializa o out com 0 para evitar, vermelho na vizualização do gtkwave
end

always @(posedge clk) begin
    if (load)
        out <= in;
end

endmodule
