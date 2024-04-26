// Code your design here
module OR (
  input a;
  input b;
  output reg c;
  );
  begin @(*)
    c = a|b;
  end
endmodule
