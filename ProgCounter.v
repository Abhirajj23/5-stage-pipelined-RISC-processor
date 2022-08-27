`timescale 1ns / 1ps

module ProgCounter( input clk,reset, [31:0] PC_in, output reg [31:0] PC_out);

    always@(posedge clk, negedge reset)
        begin   
            if (~reset)
                PC_out <= 32'd0;
            else
                PC_out <= PC_in;
         end

endmodule
