`timescale 1ns / 1ps

module Data_memory(input reset,Zero,
input [31:0]  ALU_Results_in ,Write_Data_in,
input Mem_Write_in ,Mem_Read_in ,jump_in,
output reg [31:0] Read_data
);
reg [7:0]DMEM [39:0];


always @(reset)
       if (reset==0)
       begin
         DMEM[0]=8'h96;     DMEM[1]=8'h96;      DMEM[2]=8'h96;      DMEM[3]=8'h96;                                                                        
         DMEM[4]=8'd0;     DMEM[5]=8'd0;      DMEM[6]=8'd0;      DMEM[7]=8'd1;                                    
         DMEM[8]=8'd0;     DMEM[9]=8'd0;      DMEM[10]=8'd0;     DMEM[11]=8'd2;                                
         DMEM[12]=8'd0;    DMEM[13]=8'd0;     DMEM[14]=8'd0;     DMEM[15]=8'd3;
         DMEM[16]=8'd0;    DMEM[17]=8'd0;     DMEM[18]=8'd0;     DMEM[19]=8'd4;  
         DMEM[20]=8'd0;    DMEM[21]=8'd0;     DMEM[22]=8'd0;     DMEM[23]=8'd5;  
         DMEM[24]=8'd0;    DMEM[25]=8'd0;     DMEM[26]=8'd0;     DMEM[27]=8'd6;
         DMEM[28]=8'd0;    DMEM[29]=8'd0;     DMEM[30]=8'd0;     DMEM[31]=8'd7;
         DMEM[32]=8'd0;    DMEM[33]=8'd0;     DMEM[34]=8'd0;     DMEM[35]=8'd8;
         DMEM[36]=8'd0;    DMEM[37]=8'd0;     DMEM[38]=8'd0;     DMEM[39]=8'd9;  
       end

always @(*)
        begin
        if(Mem_Write_in)
        begin
           DMEM[ALU_Results_in+3] = Write_Data_in[31:24];
           DMEM[ALU_Results_in+2] = Write_Data_in[23:16];
           DMEM[ALU_Results_in+1]  = Write_Data_in[15:8];
           DMEM[ALU_Results_in]   = Write_Data_in[7:0];
        end
        if (Mem_Read_in)
           Read_data= {DMEM[ALU_Results_in+3],DMEM[ALU_Results_in+2],DMEM[ALU_Results_in+1],DMEM[ALU_Results_in]};
        end

endmodule
