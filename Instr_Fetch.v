`timescale 1ns / 1ps

module Instr_Fetch(input stall,clk,jump,reset,
    input [31:0] PC_mux,
    output [31:0] PC_out,
    output [31:0]Instruction_Code,
    output clk_e);
    
    wire [31:0]add_out, PC_in;
    
    clock_enable clke (clk, stall, clk_e);
    adder add (PC_out, add_out);
    mux_if mux (jump, add_out, PC_mux, PC_in);
    ProgCounter pc (clk_e, reset, PC_in, PC_out);
    Instruction_memory inf(PC_out,clk_e,reset,Instruction_Code);
    
endmodule