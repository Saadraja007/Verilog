// Code your design here
// Code your design here
module example (d1,d2,sel,d_out);
  input d1,d2,sel;
  output reg d_out;
  reg w1,w2;
  always @(*)
    begin
    w1=d1&d2;
    w2=d1|d2;
    end
 always @(*)
 begin 
   case(sel)
     1'b0 : d_out = w1;
     1'b1 : d_out = w2;
   endcase
 end
  //assign w=a&b;
 //assign c=w|b;
endmodule
