`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2023 13:12:13
// Design Name: 
// Module Name: mult_approx_8
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

module mult_approx_8(
input [7:0]a, b,
output [15:0]p
    );
    
    wire [28:1]s,c;
    
    //Approximate part
    assign p[0]=(a[0]&b[0]);
    assign p[1]=(a[1]&b[0])|(a[0]&b[1]);
    assign p[2]=(a[2]&b[0])|(a[1]&b[1])|(a[0]&b[2]);
    assign p[3]=(a[3]&b[0])|(a[2]&b[1])|(a[1]&b[2])|(a[0]&b[3]);
    assign p[4]=(a[4]&b[0])|(a[3]&b[1])|(a[2]&b[2])|(a[1]&b[3])|(a[0]&b[4]);
    assign p[5]=(a[5]&b[0])|(a[4]&b[1])|(a[3]&b[2])|(a[2]&b[3])|(a[1]&b[4])|(a[0]&b[5]);
    assign p[6]=(a[6]&b[0])|(a[5]&b[1])|(a[4]&b[2])|(a[3]&b[3])|(a[2]&b[4])|(a[1]&b[5])|(a[0]&b[6]);
    
    
    //Accurate part
    FA_df f1((a[7]&b[0]), (a[6]&b[1]), (a[5]&b[2]), s[1], c[1]);
    FA_df f2((a[4]&b[3]), (a[3]&b[4]), (a[2]&b[5]), s[2], c[2]);
    HA_df h1((a[1]&b[6]), (a[0]&b[7]), s[3], c[3]);
    FA_df f3((a[7]&b[1]), (a[6]&b[2]), (a[5]&b[3]), s[4], c[4]);
    FA_df f4((a[4]&b[4]), (a[3]&b[5]), (a[2]&b[6]), s[5], c[5]);
    FA_df f5((a[7]&b[2]), (a[6]&b[3]), (a[5]&b[4]), s[6], c[6]);
    FA_df f6((a[4]&b[5]), (a[3]&b[6]), (a[2]&b[7]), s[7], c[7]);
    FA_df f7((a[7]&b[3]), (a[6]&b[4]), (a[5]&b[5]), s[8], c[8]);
    HA_df h2((a[4]&b[6]), (a[3]&b[7]), s[9], c[9]);
    FA_df f8((a[7]&b[4]), (a[6]&b[5]), (a[5]&b[6]), s[10], c[10]);
    FA_df f9((a[7]&b[5]), (a[6]&b[6]), (a[5]&b[7]), s[11], c[11]);
    HA_df h3((a[7]&b[6]), (a[6]&b[7]), s[12], c[12]);
    FA_df f10(s[1], s[2], s[3], s[13], c[13]);
    FA_df f11(s[4], s[5], (a[1]&b[7]), s[14], c[14]);
    FA_df f12(c[1], c[2], c[3], s[15], c[15]);
    FA_df f13(s[6], s[7], c[4], s[16], c[16]);
    FA_df f14(s[8], s[9], c[6], s[17], c[17]);
    FA_df f15(s[10], (a[4]&b[7]), c[8], s[18], c[18]);
    FA_df f16(s[14], s[15], c[13], s[19], c[19]);
    FA_df f17(s[16], c[5], c[14], s[20], c[20]);
    FA_df f18(s[17], c[7], c[16], s[21], c[21]);
    FA_df f19(s[18], c[9], c[17], s[22], c[22]);
    FA_df f20(s[20], c[15], c[19], s[23], c[23]);
    FA_df f21(s[21], c[20], c[23], s[24], c[24]);
    FA_df f22(s[22], c[21], c[24], s[25], c[25]);
    FA_df f23(s[11], c[10], c[25], s[26], c[26]);
    FA_df f24(s[12], c[11], c[26], s[27], c[27]);
    HA_df h4((a[7]&b[7]), c[27], s[28], c[28]);
    
    assign p[7]=s[13];
    assign p[8]=s[19];
    assign p[9]=s[23];
    assign p[10]=s[24];
    assign p[11]=s[25];
    assign p[12]=s[26];
    assign p[13]=s[27];
    assign p[14]=s[28];
    assign p[15]=c[28];
    
    
endmodule

module HA_df(
input a,b,
output s,c
);
assign s=a^b;
assign c=a&b;
endmodule

module FA_df(
input a,b,cin,
output s,cout
);
assign s=a^b^cin;
assign cout=(a&b)|(b&cin)|(a&cin);
endmodule

