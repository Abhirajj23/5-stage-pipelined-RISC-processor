`timescale 1ns / 1ps

module MEM_WB(input clk,MemToReg_in,RegWrite_in,
input [31:0] Read_Data_in,ALU_Results_in,
input[4:0] Rd_in,
output reg [4:0] Write_reg_num,
output reg [31:0] Read_Data_out,ALU_Results_out,
output reg MemToReg_out, RegWrite_out
    );
always@(posedge clk)
begin
    Read_Data_out <= Read_Data_in;
    ALU_Results_out <= ALU_Results_in;
    RegWrite_out <= RegWrite_in;
    MemToReg_out <= MemToReg_in;
    Write_reg_num <= Rd_in;
end
endmodule