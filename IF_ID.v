`timescale 1ns / 1ps

module IF_ID(input clk_e, reset_in, input [31:0]instruction_in,pc_in,
            output reset_out, output reg[31:0] instruction_out,pc_out );

always@(posedge clk_e) begin
    instruction_out <= instruction_in;
    pc_out <= pc_in + 4;
    end
assign reset_out = reset_in;
endmodule
