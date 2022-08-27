`timescale 1ns / 1ps
module Main_module(input clk,reset);

wire [31:0] Instruction;
wire [4:0] Rs,Rd,Rt,Write_reg_num,Rd1,Rt1,Rd_out1,Rd_out2,Rd2,Rs1;
wire [31:0] Write_data,ALU_Results1,ALU_Results2,Write_Data1,Read_data,Read_Data1;
wire [31:0] PC_exe,PC_if_1,Read_Data_1,Read_Data_2,Read_Data_1_id_ex,Read_Data_2_id_ex,Sign_ext,Sign_ext_id_ex,PC_if_id,PC_id_ex;
wire [27:0]Sign_ext_jump,Sign_ext_jump_id_ex;
wire [5:0]function_code,OpCode;
wire [3:0] ALU_control;
wire [31:0] instruction_IF,instruction_ID,instruction_ID1,instruction_EXE,PC_ext,PC_ext1,out,out1,out2,out3;
wire Zero,RegWrite,RegDst,jump,MemToReg,Mem_Write,Mem_Read,jump2,RegWrite1,RegDst1,jump1,jump11
    ,MemToReg1,Mem_Write1,Mem_Read1,MemToReg11, Mem_Write11, Mem_Read11,RegWrite11;
wire[1:0] ALUop,ALUop1,ALUsrc,ALU_src1, Forward_Rs,Forward_Rt;
wire MemToReg2,Mem_Write2,Mem_Read2,RegWrite2,MemToReg3,RegWrite3,Zero1,Zero11;
wire [31:0] PC_if,W;
wire reset1;
wire stall;
wire clk_e;

//////////////////////////////////////Instruction Fetch///////////////////////////////////////////////////
Instr_Fetch IF1(stall, clk,jump,reset,PC_if,PC_if_1,Instruction, clk_e);

//////////////////////////////////////IF_ID Register///////////////////////////////////////////////////
IF_ID reg1(clk_e,reset,Instruction, PC_if_1,reset1,instruction_IF,PC_if_id);

//////////////////////////////////////Instruction Decode///////////////////////////////////////////////////
Instruction_Decode D(clk,reset1,RegWrite3,PC_if_id,Write_reg_num,instruction_IF,Write_data,Read_Data_1,
                    Read_Data_2,Sign_ext,Sign_ext_jump,function_code,OpCode,Rd,Rs,Rt,PC_if);
                    
//////////////////////////////////////IF_EX Register//////////////////////////////////////////////////////                   
ID_EX reg2(clk,RegWrite,RegDst,jump,MemToReg,Mem_Write,Mem_Read,
                        ALUsrc,ALUop,PC_if_id,instruction_IF,Read_Data_1,Read_Data_2,
                        Sign_ext,Sign_ext_jump,Rd,Rs,Rt,instruction_ID,Read_Data_1_id_ex,Read_Data_2_id_ex,
                        Sign_ext_id_ex,Sign_ext_jump_id_ex,PC_id_ex,RegWrite1,RegDst1,jump1,
                        MemToReg1,Mem_Write1,Mem_Read1,ALU_src1,ALUop1,Rd1,Rs1,Rt1);
                                                
//////////////////////////////////////IExecution///////////////////////////////////////////////////  
wire amul,amul_out;
wire [31:0]w_out;         
Execution exe( ALU_src1,RegDst1,Read_Data_1_id_ex,Read_Data_2_id_ex,Rd1,Rt1,Sign_ext_id_ex,
            PC_id_ex,Sign_ext_jump_id_ex,ALU_control,Forward_Rs,Forward_Rt,ALU_Results1,Write_data,
            Zero,out1,W,PC_ext,Rd_out1, amul);
            
 /////////////////////////////////////Temp_reg///////////////////////////////////////////////////           
temp_reg reg3 (clk, Zero,amul, W, Rd_out1, PC_ext, Sign_ext_jump_id_ex, jump1, MemToReg1, Mem_Write1, Mem_Read1,
                RegWrite1,instruction_ID,out1, 
                instruction_ID1,PC_ext1, jump11,  MemToReg11, Mem_Write11, Mem_Read11,RegWrite11, Zero11,
                amul_out, out2,w_out,Rd_out2);
            
 /////////////////////////////////////Temp_execution///////////////////////////////////////////////////           
temp_execution tmp_exe (amul_out,out2, w_out, out3);



//////////////////////////////////////ALU Control///////////////////////////////////////////////////       
ALUcontrol alu(ALUop1,function_code,ALU_control);        
          
//////////////////////////////////////EX_MEM Register///////////////////////////////////////////////////
EX_MEM reg4(PC_ext1,w_out,Zero11,clk,jump11,MemToReg11,
                        Mem_Write11,Mem_Read11,RegWrite11,instruction_ID1,out3,
                        Rd_out2,instruction_EXE,ALU_Results1,Write_Data1,PC_exe,Rd2,jump2,
                        MemToReg2,Mem_Write2,Mem_Read2,RegWrite2,Zero1);
                        
                        
                     
//////////////////////////////////////Data Memory///////////////////////////////////////////////////                       
Data_memory DM(reset,Zero1,ALU_Results1,Write_Data1,Mem_Write2,Mem_Read2,jump2,Read_data);

//////////////////////////////////////MEM_WB Register///////////////////////////////////////////////////
MEM_WB reg5(clk,MemToReg2,RegWrite2,Read_data,ALU_Results1,Rd2,
            Write_reg_num,Read_Data1,ALU_Results2,MemToReg3,RegWrite3);
            
 //////////////////////////////////////Writeback Unit///////////////////////////////////////////////////
 Writeback_unit WB(MemToReg3,Read_Data1,ALU_Results2,Write_data); 
 
  //////////////////////////////////////Control Unit///////////////////////////////////////////////////
 Control_unit control(stall, OpCode,RegWrite,RegDst,jump,MemToReg,Mem_Write,Mem_Read,ALUop,ALUsrc);
       
//////////////////////////////////////Forwarding Unit///////////////////////////////////////////////////
ForwardingUnit FU(Rs1,Rt1,Rd2,Write_reg_num,RegWrite2,RegWrite3,Forward_Rs,Forward_Rt);

Stall_unit SU (Mem_Read1, Rt1, Rs, Rt, stall);


endmodule
