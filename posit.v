`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2023 11:07:51 AM
// Design Name: 
// Module Name: posit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module posit( in1,in2,out,select,c,z);

    input[7:0] in1,in2;
    output reg [7:0] out;
    input[2:0] select;
    output reg c,z;



always @(*)
    begin
    case (select)
      3'b000 :  out = in1 + in2;
      3'b001 :  out = in1 - in2;
      3'b010 :  out = in1 & in2;
      3'b011 :  out = in1 | in2;
      3'b100 :  out = in1 ^ in2; 
      3'b101 : begin
        if(in2 > in1) begin  // in2 == rd   in1  == rs/imm2
          c = 1'b0;
          z = 1'b0;
        end
        else if(in2 < in1) begin
          c = 1'b1;
          z = 1'b0;
        end
        else begin
          c = 1'b0;
          z = 1'b1;
        end

      end
    endcase
    end
    
endmodule