module counter(increment,decrement,count,clk,reset);
  input increment;
  input clk;
  input reset;
  input decrement;
  output reg [4:0] count;
  reg enable;
  reg [4:0] mux_out;
  
  always @(*)
    begin
      enable = increment | decrement;
    end
  always @(*)
    begin
      case (increment)
        1'b0 : mux_out <= count - 1;
        1'b1 : mux_out <= count + 1;
      endcase
    end
  always @(posedge clk)
    begin
      if(reset)
        count <= 0;
      else if(enable)
        count <= mux_out;
    end
    
endmodule
