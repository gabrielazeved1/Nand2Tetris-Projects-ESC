module mux8way16(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [15:0] e,
    input [15:0] f,
    input [15:0] g,
    input [15:0] h,
    input [2:0] sel,
    output [15:0] out
);
    reg [15:0] temp_out;

    always @(*) begin
        case (sel)
            3'b000: temp_out = a;
            3'b001: temp_out = b;
            3'b010: temp_out = c;
            3'b011: temp_out = d;
            3'b100: temp_out = e;
            3'b101: temp_out = f;
            3'b110: temp_out = g;
            3'b111: temp_out = h;
            default: temp_out = 16'bx;
        endcase
    end
    
    assign out = temp_out;
endmodule