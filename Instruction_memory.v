`timescale 1ns / 1ps

module Instruction_memory( input [31:0]pc,
    input clk_e,reset,
    output [31:0]Instruction_Code);
    
    reg [7:0]mem[31:0];   // byte addressable memory 32 locations
    
always@(reset)
    if (reset==0)
        begin
//          mem[0]=8'h28; mem[1]=8'h89;mem[2]=8'h0;mem[3]=8'h10;
//          //First 32-bit location
//          mem[4]=8'h28;mem[5]=8'h68;mem[6]=8'h0;mem[7]=8'h08;
//          //secon 32-bit location
//          mem[8]=8'h8d;mem[9]=8'h23;mem[10]=8'h0;mem[11]=8'h0;
//          //3rd 32-bit location
//          mem[12]=8'h0;mem[13]=8'he4;mem[14]=8'h08;mem[15]=8'h27;
//          //4th 32-bit location
//          mem[16]=8'h0;mem[17]=8'h66;mem[18]=8'h10;mem[19]=8'h27;
//            //5th 32-bit location
//          mem[20]=8'h08;mem[21]=8'h0;mem[22]=8'h0;mem[23]=8'h14;

         mem[0]=8'h03; mem[1]=8'hfe;mem[2]=8'h18;mem[3]=8'h3f;
          //First 32-bit location
          mem[4]=8'h0;mem[5]=8'h0;mem[6]=8'h0;mem[7]=8'h3f;
          //secon 32-bit location
          mem[8]=8'h0;mem[9]=8'h0;mem[10]=8'h0;mem[11]=8'h3f;
          //3rd 32-bit location
            mem[12]=8'h0;mem[13]=8'h0;mem[14]=8'h0;mem[15]=8'h3f;
          //4th 32-bit location
            mem[16]=8'h8c;mem[17]=8'h01;mem[18]=8'h00;mem[19]=8'h00;
            //5th 32-bit location
            mem[20]=8'hac;mem[21]=8'h61;mem[22]=8'h0;mem[23]=8'h0;  


//        mem[0] = 8'b10001100; mem[1]= 8'b00000001; mem[2] = 8'b00000000; mem[3] = 8'b00000000;
//       mem[4] = 8'b10101100; mem[5]= 8'b01100001; mem[6] = 8'b00000000; mem[7] = 8'b00000000;
//       mem[8]=8'h28; mem[9]=8'h89;mem[10]=8'h0;mem[11]=8'h10;

          end

        assign Instruction_Code = {mem[pc], mem[pc+1], mem[pc+2], mem[pc+3]};
        
endmodule
