// Code your design here
// Code your design here
module multiplier(a,b,c,clk);
  input [2:0] a;
  input clk;
  input [2:0] b;
  output reg [4:0]c;
  
  always @(*)
    begin
      c = a*b;
    end
endmodule


