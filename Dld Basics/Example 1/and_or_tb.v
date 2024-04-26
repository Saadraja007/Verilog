
// Code your testbench here
// or browse Examples
module example_tb;
  reg data_1,data_2;
  wire data_out;
  // instantiate the module, map connecetions
  example exp( .a(data_1), .b(data_2), .c(data_out) );
  initial
    begin
       $dumpfile("dump.vcd");
  		$dumpvars(1);
    end
  
  initial
    begin
      $monitor($time,"  ",data_1,data_2," output= ", data_out);
      
      data_1 = 1'b0;
      data_2 = 1'b0;
      
      #3
      data_1 = 1'b0;
      data_2 = 1'b1;
      
      #3
      data_1 = 1'b1;
      data_2 = 1'b0;
      
      #3
      data_1 = 1'b1;
      data_2 = 1'b1;
      
      #3
      $display("Saksham");
    end
endmodule
