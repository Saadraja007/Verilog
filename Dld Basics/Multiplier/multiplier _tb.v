
// Code your testbench here
// or browse Examples

module tb_multiplier();
  reg [2:0] a; 
  reg [2:0] b;
  reg clk;
  wire [4:0]c;
  
  multiplier mult(.a(a), .b(b), .c(c),.clk(clk));
  
  initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial
    begin
      forever
      # 5 clk = ~clk;
    end
  initial
    begin
      clk = 0;
    end
  initial 
    begin
      $monitor($time, " " , a,b, " Output =",c);
      
      @(posedge clk)
      a = 2'b00;
      b = 2'b00;

      @(posedge clk)
      a = 2'b01;
      b = 2'b00;

      @(posedge clk)
      a = 2'b10;
      b = 2'b10;

      @(posedge clk)
      a = 2'b11;
      b = 2'b11;

      repeat(5)
      @(posedge clk);
      $finish;
    end
  
endmodule
