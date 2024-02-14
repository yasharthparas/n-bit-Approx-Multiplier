`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2023 16:06:27
// Design Name: 
// Module Name: tbench
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





module tbench(

    );
    reg clk;
    reg rst;
    reg [7:0] a;
    reg [7:0] b;
    
    //reg tm;
    wire [15:0] tp;
    wire [15:0] ao;
    wire [15:0] oro;
    //reg correct ,wrong;
    bist bi1(clk,rst,a,b,tp,ao,oro);
    initial begin
        clk=0;
        rst=0;
       // tm=1;
       // a=4'h1111;
        //b=4'h2222;///
       //if (~tm)
       // begin
            //$monitor("a=%h,b=%h,ao=%h",a[15:0],b[15:0],ao[16:0]);
            //#1 $finish;
        //end
        #1 
        rst=1;
        
        #2
        rst=0;
        
     
        
      //  $monitor("x=%h,y=%h,ao=%h,sig=%h",tp[15:0],tp[31:16],ao,oro);
       // #594994
        $display("x=%h,y=%h,ao=%h,sig=%h,time = %t",tp[15:8],tp[7:0],ao,oro,$time);
       //if (tm & ~(oro==17'h17431))
            //$display("MACHINE IN TEST MODE \nOUTPUT RESPONSE %h !=17431 \nMACHINE IS FAULTY ",oro);
       // else if (tm & (oro==17'h17431))
           //$display("MACHINE IN TEST MODE \n SIGNATUER %h =17431 \nMACHINE IS NOT FAULTY ",oro);
       // $display("TEST MODE \n ",tp[15:0],tp[31:16],ao,oro,~(oro==17'h17431));
      //  #670000 $finish;
    end
    
    
 endmodule
