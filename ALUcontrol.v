
`timescale 1ns / 1ps
module ALUcontrol( input [1:0] ALUop_in,
input [5:0] function_code,
output reg [3:0] ALU_control
);
parameter A0=2'b10,A1=2'b11,A2=2'b00,A3=2'b01;


always @(*)

    begin
     case(ALUop_in)
            A0: begin
                    if(function_code == 6'b100111)
                        ALU_control=4'b0000;
                    else if (function_code == 6'b111111)
                        ALU_control=4'b0100;
                end
             A1:ALU_control=4'b0001;
             A2:ALU_control=4'b0010;
     endcase
    end
endmodule