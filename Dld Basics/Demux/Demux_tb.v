
// Code your testbench here
// or browse Examples


// Code your testbench here
// or browse Examples
module example_tb;
  reg d_in,sel;
  wire d_out1,d_out2;
  // instantiate the module, map connecetions
  example exp( .d_in(d_in), .sel(sel), 								.d_out1(d_out1), .d_out2(d_out2));
  initial
    begin
       $dumpfile("dump.vcd");
  		$dumpvars(1);
    end
  
  initial
    begin
      $monitor($time,"  ",d_in," output= ", d_out1, d_out2);
      
      sel = 1'b0;
      d_in = 1'b0;
      #5
      d_in = 1'b0;
      sel = 1'b1;
      #5;
    end
endmodule