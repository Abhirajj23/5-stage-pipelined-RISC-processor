`timescale 1ns / 1ps

module EX_MEM(input [31:0]PC_ext,W,
//input [27:0]Sign_exe_jump_in,
input Zero,
input clk,jump_in,MemToReg_in,Mem_Write_in,Mem_Read_in,RegWrite_in,
input [31:0] instruction_in,out,
input [4:0] Rd_in,
output reg [31:0] instruction_out,ALU_Results_out,Write_Data_out,PC_out,
output reg [4:0] Rd_out,
output reg jump_out,MemToReg_out,Mem_Write_out,Mem_Read_out,RegWrite_out,
output reg Zero_out
    );
   
always@(posedge clk)
    begin
       
         instruction_out <= instruction_in;
         ALU_Results_out <= out;
         Write_Data_out <= W;
         Rd_out <= Rd_in;
         PC_out <= PC_ext;
         jump_out <= jump_in;
         MemToReg_out <= MemToReg_in;
         Mem_Write_out <= Mem_Write_in;
         Mem_Read_out <= Mem_Read_in;
         RegWrite_out <= RegWrite_in;
         Zero_out <= Zero;
    end

endmodule
