// Code your testbench here
// or browse Examples

// Code your testbench here
// or browse Examples
module example_tb;
  reg d1,d2,sel;
  wire d_out;
  // instantiate the module, map connecetions
  example exp( .d1(d1), .d2(d2), .sel(sel), 								.d_out(d_out));
  initial
    begin
       $dumpfile("dump.vcd");
  		$dumpvars(1);
    end
  
  initial
    begin
      $monitor($time,"  ",d1,d2," output= ", d_out);
      
      sel = 1'b0;
      d1 = 1'b0;
      d2 = 1'b0;
         #5
      d1 = 1'b0;
      d2 = 1'b1;
      sel = 1'b0;
      #5
      d1 = 1'b1;
      d2 = 1'b0;
      sel = 1'b0;
      #5
      d1= 1'b1;
      d2 = 1'b1;
      sel = 1'b0;
      #5
      d1= 1'b0;
      d2 = 1'b0;
      sel = 1'b1;
      #5
      d1 = 1'b0;
      d2 = 1'b1;
      sel = 1'b1;
      #5
      d1 = 1'b1;
      d2 = 1'b0;
      sel = 1'b1;
      #5
      d1 = 1'b1;
      d2 = 1'b1;
      sel = 1'b1;
      #5;
    end
endmodule