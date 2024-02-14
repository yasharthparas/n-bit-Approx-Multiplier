`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2023 15:50:00
// Design Name: 
// Module Name: ca
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



   
    module ca(input clk,input rst,output [15:0]q);
    dff a (clk,rst,(q[1]^q[0]),q[0]);
    genvar i;
    generate for (i=1;i<8;i=i+1)
        begin:d_ff
            dff b(clk,rst,(q[2*i-2]^q[2*i]),q[2*i-1]);
            dff E(clk,rst,(q[2*i-1]^q[2*i]^q[2*i+1]),q[2*i]);
        end
    endgenerate
  
    dff c(clk,rst,(q[14]),q[15]);
endmodule
    
    
