`timescale 1ns / 1ps

module Control_unit(input stall, [5:0] OpCode,
output reg RegWrite,RegDst,Branch,MemToReg,Mem_Write,Mem_Read,
output reg [1:0] ALUop,ALUsrc
//output reg
);
parameter S0=6'd0, S1=6'd10, S2=6'd35,S3=6'd2, S4 = 6'd43 ;

always@(*) begin
    if (stall) begin
        ALUsrc=2'b00;
        RegDst=1'b0;
        Mem_Read=1'b0;
        Mem_Write=1'b0;
        MemToReg=1'b0;
        Branch=1'b0;
        RegWrite=1'b0;
        ALUop=2'b00; end
   else begin
    case(OpCode)
    S0 : begin
//            WriteControl=1'b1;
            ALUsrc=1'b0;
            RegDst=1'b1;
            Mem_Read=1'b0;
            Mem_Write=1'b0;
            MemToReg=1'b0;
            Branch=1'b0;
            RegWrite=1'b1;
            ALUop=2'b10;
         end
    S1 : begin
//            WriteControl=1'b0;
            ALUsrc=1'b1;
            RegDst=1'b0;
            Mem_Read=1'b0;
            Mem_Write=1'b0;
            MemToReg=1'b0;
            Branch=1'b0;
            RegWrite=1'b1;
            ALUop=2'b11;
         end
    S2 : begin
//            WriteControl=1'b0;
            ALUsrc=1'b1;
            RegDst=1'b0;
            Mem_Read=1'b1;
            Mem_Write=1'b0;
            MemToReg=1'b1;
            Branch=1'b0;                
            RegWrite=1'b1;
            ALUop=2'b00;
         end
    S3 : begin
            ALUsrc=2'b10;
            RegDst=1'b0;
            Mem_Read=1'b0;
            Mem_Write=1'b0;
            MemToReg=1'b0;
            Branch=1'b1;
            RegWrite=1'b0;
            ALUop=2'b01;
         end
     S4 : begin
                     ALUsrc=2'b01;
                     RegDst=1'b0;
                     Mem_Read=1'b0;
                     Mem_Write=1'b1;
                     MemToReg=1'b1;
                     Branch=1'b0;
                     RegWrite=1'b1;
                     ALUop=2'b00;
                  end
    endcase 
    end
    end 
endmodule
