`timescale 1ns / 1ps

module tb;

reg clk,reset=1;

Main_module P (clk,reset);

initial begin
    clk = 1'b0;
    #5 reset = 1'b0;
    #2 reset = 1'b1;
   # 150 $finish;
    end
always
    #5 clk = ~clk;


endmodule