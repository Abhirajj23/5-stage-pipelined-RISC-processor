`timescale 1ns / 1ps

module Instruction_Decode(input clk, reset, RegWrite, 
input [31:0] PC_0,
input [4:0] Write_Reg_Num,
input [31:0] instruction,Write_data,
output [31:0] Reg_Data_1, Reg_Data_2, Sign_ext,
output [27:0] Sign_ext_jump,
output [5:0] function_code,
output [5:0] OpCode,
output [4:0] Rd, Rs, Rt,
output [31:0] PC_1 );


assign Sign_ext = {{16{instruction[15]}},instruction[15:0]};
assign Sign_ext_jump = {{2{instruction[25]}},instruction[25:0]};
assign OpCode = instruction[31:26];
assign Rs = instruction [25:21];
assign Rt = instruction [20:16];
assign Rd = instruction [15:11];
assign function_code = instruction [5:0];
assign PC_1 = {PC_0 [31:28], Sign_ext_jump};

Register_File RF (reset, RegWrite, Rs, Rt, Write_Reg_Num, Write_data, Reg_Data_1, Reg_Data_2);

endmodule
