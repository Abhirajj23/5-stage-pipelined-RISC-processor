`timescale 1ns / 1ps

module adder(input [31:0]PC_out, output reg [31:0]adder_out);
always@(*)
   adder_out <= PC_out + 4;
endmodule
