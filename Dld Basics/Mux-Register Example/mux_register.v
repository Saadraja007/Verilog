// Code your design here
//Code your design here
module example (
  input clk,
  input reset,
  input [2:0] d_in1,
  input [2:0] d_in2,
  input en,sel,
  output reg [2:0] d_out1
  );
  reg [2:0] x;
  always @(*)
    begin
      case(sel)
        1'b0 : x = d_in1;
        1'b1 : x = d_in2;
      endcase
    end
  always @(posedge clk)
    begin 
    if(reset)
      d_out1 <= 0 ;
    else if(en)
      d_out1 <= x ;
    else
      d_out1 <= x ;  
  end
endmodule

