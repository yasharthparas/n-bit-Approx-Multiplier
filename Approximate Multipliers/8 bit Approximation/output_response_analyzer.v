module ora(input clk,input rst,input [15:0] o,output [15:0] q);
  genvar i;
  generate
    
      for(i=15;i>=0;i=i-1) 
      begin:gen_loop
          if(i==15||i==0) begin
          dff a(clk,rst,(o[i]^q[0]),q[i]);
        end
        else begin
          dff a(clk,rst,(o[i]^q[0]^q[i-1]),q[i]);
        end
      end
  endgenerate
endmodule
