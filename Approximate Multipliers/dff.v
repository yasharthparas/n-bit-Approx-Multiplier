module dff(input clk,
           input rst,
           input in,
           output reg r);
    always @(posedge clk) begin
        if(rst) begin
            r<=1;
        end
        else begin
            r<=in;
        end
    end
endmodule
