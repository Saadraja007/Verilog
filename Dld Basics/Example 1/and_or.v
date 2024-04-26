// Code your design here
module example (a,b,c);
  input a,b;
  output reg c;
  reg w;
  always @(*)
    begin
    w=a&b;
    c=w|b;
    end
  //assign w=a&b;
 //assign c=w|b;
endmodule
