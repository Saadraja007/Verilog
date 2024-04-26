// Code your design here
//Code your design here
module example (
  input clk,
  input reset,
  input [2:0] d_in,
  input en,
  output reg [2:0] d_out1
  );
  always @(posedge clk)begin 
    if(reset)
      d_out1 <= 0 ;
    else if(en)
      d_out1 <= d_in ;
    else
      d_out1 <= d_out1 ;  
  end
endmodule