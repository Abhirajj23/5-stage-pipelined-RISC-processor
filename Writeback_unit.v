`timescale 1ns / 1ps

module Writeback_unit(input MemToReg_in,
input [31:0] Read_Data_in,ALU_Results_in,
output reg [31:0] Write_data
    );
   
always@(*)  
begin
    if (MemToReg_in)
        Write_data<=Read_Data_in;
    else
        Write_data<=ALU_Results_in;
end      
endmodule