
// Code your testbench here
// or browse Examples
// Code your testbench here
module example_tb();
  reg [2:0] d_in1;
  reg [2:0] d_in2;
  reg en,clk,reset,sel;
  wire [2:0] d_out1;
  // instantiate the module, map connecetions
  example exp( .clk(clk), .reset(reset), .sel(sel),
              .d_in1(d_in1), .d_in2(d_in2), .en(en), .d_out1(d_out1));
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
  //clock generation
  
  initial
  begin
    forever
      #5 clk = ~clk;
  end
  initial 
    begin
    clk = 0;
    reset = 0;
  	end
  
  initial
    begin
      $monitor($time,"  ",d_in1,d_in2," output= ", d_out1);
     reset <= 0; 
      @(posedge clk)
         reset <= 1;
      @( posedge clk) 
         reset <=  0; 
      @( posedge clk)
         en = 1'b1;
      	sel = 1'b0;
        d_in1  = 2'b10;
      d_in2  = 2'b11;
      @( posedge clk)
         en = 1'b1;
      	sel = 1'b0;
        d_in1  = 2'b10;
      d_in2  = 2'b11;
      @( posedge clk)
         en = 1'b1;
      	sel = 1'b1;
         d_in1  = 2'b00;
      d_in2  = 2'b11;
      
      repeat(5)
        @( posedge clk);
      $finish;
    end  
endmodule