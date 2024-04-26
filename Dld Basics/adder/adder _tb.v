
module tb_addr();
  reg a,b,clk;
  wire [2:0]c;
  
  addr add(.a(a), .b(b), .c(c),.clk(clk));
  
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
      a = 1'b0;
      b = 1'b0;

      @(posedge clk)
      a = 1'b0;
      b = 1'b1;

      @(posedge clk)
      a = 1'b0;
      b = 1'b0;

      @(posedge clk)
      a = 1'b1;
      b = 1'b1;

      repeat(5)
      @(posedge clk);
      $finish;
    end
  
endmodule
