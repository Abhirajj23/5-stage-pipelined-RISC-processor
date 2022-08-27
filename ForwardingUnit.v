`timescale 1ns / 1ps
module ForwardingUnit(
input [4:0]Rs1,Rt1,Rd3,Write_reg_num,
input RegWrite2,RegWrite3,
output reg [1:0] Forward_Rs,Forward_Rt
    );

always@(*)  
begin
if(RegWrite2)
    begin
        if(Rd3==Rs1)
        begin
        Forward_Rs=2'b01;
        end
     
        if(Rd3==Rt1)
        begin
        Forward_Rt=2'b01;
        end
    end
 end
always@(*)
if(RegWrite3)
     begin
         if(Write_reg_num==Rs1)
         begin
            if(!(RegWrite2 && Rd3==Rs1 ))
               begin
                    Forward_Rs=2'b10;
                end
            else
                begin
                    Forward_Rs=2'b00;
                end
         end
         else
             begin
                Forward_Rs=2'b00;
             end  
         if(Write_reg_num==Rt1)
          begin
             if(!(RegWrite2 && Rd3==Rt1 ))
             begin
                 Forward_Rt=2'b10;
             end
             else
             begin
                 Forward_Rt=2'b00;
             end
          end
        else
             begin
                 Forward_Rt=2'b00;
             end  
      end
else
             begin
                 Forward_Rs=2'b00;  
                 Forward_Rt=2'b00;
             end
endmodule
