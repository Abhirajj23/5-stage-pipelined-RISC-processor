`timescale 1ns / 1ps

module mux_if(input jump, [31:0]m1,m2, output reg [31:0] PC);

always@(*) begin
    if (jump)
    assign PC = m2;
    else
    assign PC = m1;
end
endmodule
