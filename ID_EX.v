`timescale 1ns / 1ps

module ID_EX(input clk,RegWrite_in,RegDst_in,jump_in,MemToReg_in,Mem_Write_in,Mem_Read_in,
            input [1:0] ALUsrc_in,ALUop_in, 
            input [31:0] PC_in,instruction_in, Read_Data_1_in, Read_Data_2_in, Sign_ext_in,[27:0] Sign_ext_jump_in,
            input [4:0] Rd_in, Rs_in, Rt_in,
            output reg [31:0] instruction_out,Read_Data_1_out,Read_Data_2_out,Sign_ext_out,
            output reg [27:0] Sign_ext_jump_out,
            output reg [31:0] PC_out,
            output reg RegWrite_out,RegDst_out,jump_out,MemToReg_out,Mem_Write_out,Mem_Read_out,
            output reg [1:0] ALUsrc_out,ALUop_out,
            output reg [4:0]Rd_out,Rs_out,Rt_out              
                ); 


        always@(posedge clk) begin
            instruction_out <= instruction_in;
            PC_out <= PC_in;
            Read_Data_1_out <= Read_Data_1_in;
            Read_Data_2_out <= Read_Data_2_in;
            Rs_out <= Rs_in;
            Rd_out <= Rd_in;
            Rt_out <= Rt_in;
            Sign_ext_out <= Sign_ext_in;
            Sign_ext_jump_out <= Sign_ext_jump_in;
            Mem_Read_out <= Mem_Read_in;
            Mem_Write_out <= Mem_Write_in;
            MemToReg_out <= MemToReg_in;
            jump_out <= jump_in;
            RegDst_out <= RegDst_in;
            RegWrite_out <= RegWrite_in;
            ALUsrc_out <= ALUsrc_in;
            ALUop_out <= ALUop_in;
         end
endmodule
