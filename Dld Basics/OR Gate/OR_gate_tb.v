// Code your testbench here
// or browse Examples
module tb_or;
  wire c;
  reg a,b;
  OR mydate(
    a.(a);
    b.(b);
    c.(c);
  )
  initial 
    begin
      $monitor(a,b,c);
      a=1'b0;
      b=1'b0;
      #5
      a=1'b0;
      b=1'b1;
      #5
      a=1'b1;
      b=1'b0;
      #5
      a=1'b1;
      b=1'b1;
      #5
      
    end
endmodule