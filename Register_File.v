`timescale 1ns / 1ps
module Register_File(
    input reset, RegWrite,
    input [4:0] Read_Reg_Num_1,
    input [4:0] Read_Reg_Num_2,
    input [4:0] Write_Reg_Num,
    input [31:0] Write_Data,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2
    );
    reg [31:0] RegMemory [31:0];

    assign Read_Data_1 = RegMemory[Read_Reg_Num_1];
    assign Read_Data_2 = RegMemory[Read_Reg_Num_2];
    
    always@(*)
        begin
            if (~reset) begin
            RegMemory[0]=32'h0;RegMemory[1]=32'h32;RegMemory[2]=32'h28;RegMemory[3]=32'h24;                                                                        
            RegMemory[4]=32'h20;RegMemory[5]=32'h16;RegMemory[6]=32'h12;RegMemory[7]=32'h8;                                    
            RegMemory[8]=32'h4;RegMemory[9]=32'h0;RegMemory[10]=32'h0;RegMemory[11]=32'h0;                                
            RegMemory[12]=32'h0;RegMemory[13]=32'h0;RegMemory[14]=32'h0;RegMemory[15]=32'h0;
            RegMemory[16]=32'h0;RegMemory[17]=32'h0;RegMemory[18]=32'h0;RegMemory[19]=32'h0;  
            RegMemory[20]=32'h0;RegMemory[21]=32'h0;RegMemory[22]=32'h0;RegMemory[23]=32'h0;  
            RegMemory[24]=32'h0;RegMemory[25]=32'h0;RegMemory[26]=32'h0;RegMemory[27]=32'h0;
            RegMemory[28]=32'h0;RegMemory[29]=32'h0;RegMemory[30]=32'h4;RegMemory[31]=32'h7;
            end
        end
    always@(*) 
        begin
            if (RegWrite)                
                RegMemory[Write_Reg_Num] =  Write_Data;
        end
endmodule 
