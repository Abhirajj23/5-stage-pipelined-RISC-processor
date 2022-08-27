
`timescale 1ns / 1ps
module Execution (input [1:0] ALUsrc_in,
input RegDst_in,
input [31:0] Read_Data_1_in,Read_Data_2_in,
input [4:0] Rd_in,Rt_in,
input [31:0] Sign_extended_in,PC_in,
input [27:0]Sign_exe_jump_in,
input [3:0] ALU_control,
input [1:0] Forward_Rs,Forward_Rt,
input [31:0]ALU_Results1,Write_data,
output reg Zero,
output reg [31:0] out,W,
output[31:0]PC_ext,
output reg [4:0] Rd_out,
output reg amul
 );
reg [31:0] A,B;
parameter C1=4'b0000, C2=4'b0001, C3=4'b0010, C4=4'b0100, C5=4'b1000 , C6=4'b0110;
parameter D1=2'b00, D2=2'b01, D3=2'b10;

assign PC_ext={PC_in[31:28],Sign_exe_jump_in};

always@(*)
begin

case (Forward_Rs)
         D1:   A=Read_Data_1_in;
         D2:   A=ALU_Results1;
         D3:   A=Write_data;
    endcase  
       
     case (Forward_Rt)
         D1:  begin
                 W=Read_Data_2_in;
                 B=ALUsrc_in ? Sign_extended_in : W;
              end
         D2:  begin
                W=ALU_Results1;
                B=ALUsrc_in ? Sign_extended_in : W;
              end
         D3:   begin
                W=Write_data;
                B=ALUsrc_in ? Sign_extended_in : W;
              end
    endcase    

  begin
        if (RegDst_in)
        Rd_out=Rd_in;
        else
        Rd_out=Rt_in;
  end      
           
case(ALU_control)
   C1: begin out=  ~(A | B);
                amul = 1'b0; end
   C2: begin out= A<B ? 1 : 0 ;
            amul = 1'b0; end
   C3: begin out= A + B;
             amul = 1'b0; end
   C4: begin out= A * B;
            amul = 1'b1; end
   default: begin  out = 32'd0;
                    amul = 1'b0; end
endcase
    Zero=~|out;
 end
 
endmodule
