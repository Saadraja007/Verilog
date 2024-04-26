// Code your design here
// Code your design here
module addr(a,b,c,clk);
  input a;
  input clk;
  input b;
  output reg [2:0]c;
  
  always @(*)
    begin
      c = a+b;
    end
endmodule

