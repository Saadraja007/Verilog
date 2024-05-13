
module tb_counter();
  reg increment; 
  reg decrement;
  reg clk;
  reg reset;
  wire [4:0] count;
  
  counter counter(.increment(increment), .decrement(decrement), .count(count), .clk(clk),. reset(reset));
  
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
      reset = 0;
    end
  initial 
    begin
      $monitor($time, " " , increment,decrement, " Output =",count);
      
      @(posedge clk)
      	reset <= 1;
      @(posedge clk)
      	reset <= 0;
      @(posedge clk)
        increment <= 1'b1;
        decrement <= 1'b0;

      @(posedge clk)
        increment <= 1'b1;
        decrement <= 1'b0;

      @(posedge clk)
        increment <= 1'b1;
        decrement <= 1'b0;

      @(posedge clk)
        increment <= 1'b1;
        decrement <= 1'b0;

      @(posedge clk)
        increment <= 1'b0;
        decrement <= 1'b1;

      @(posedge clk)
        increment <= 1'b0;
        decrement <= 1'b1;

      repeat(5)
      @(posedge clk);
      $finish;
    end
  
endmodule
