
// Code your testbench here
// or browse Examples

module tb_fifo();
  reg push;
  reg pop;
  reg [3:0] data_in;
  reg clk;
  reg reset;
  
  wire [3:0] data_out;
  wire  fifo_full;
  wire  fifo_empty; 
  
  
  fifo fifo_tb(.push(push), .pop(pop), .data_in(data_in), .clk(clk),. reset(reset),. data_out(data_out),. fifo_full(fifo_full),. fifo_empty(fifo_empty) );
  
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
      push = 0;
      pop = 0;
      
    end
  initial 
    begin
      $monitor($time, " " , push,pop, " Output =",data_out);
  
      // reset would be 1
      @(posedge clk)
      	reset <= 1;
      
      // reset would be 0
      @(posedge clk)
      	reset <= 0;
      
      // push the data 3
      // output shows 0
      @(posedge clk)
        push <= 1'b1;
        pop <= 1'b0;
      data_in <= 3'b011;

      
      // push the data 2
      // output shows 0
      @(posedge clk)
      	data_in <= 3'b010;
      
      // push the data 4
      // output shows 0
      @(posedge clk)
      	data_in <= 3'b100;
      
      // push the data 5
      // output shows 0
      @(posedge clk)
      	data_in <= 3'b101;
      
      // pop the data.
      @(posedge clk)
        push <= 1'b0;
        pop <= 1'b1;
      
      // pop the data.
      @(posedge clk);
      
      // pop the data.
      @(posedge clk);
      
      // pop the data.
      @(posedge clk);
      
      // push the data 7.
      @(posedge clk);
      	push <= 1'b1;
        pop <= 1'b0;
      	data_in <= 3'b111;
      
      // push the data 5.
      @(posedge clk);
      	push <= 1'b1;
        pop <= 1'b0;
      	data_in <= 3'b101;
      
      // pop the data.
      // input is 3 now.
      @(posedge clk);
      	push <= 1'b0;
        pop <= 1'b1;
      	data_in <= 3'b011;
      
      // pop the data.
      // input is 3 now.
      @(posedge clk);
      	push <= 1'b0;
        pop <= 1'b1;
      	data_in <= 3'b111;
	
      // pop the data.
      // input is 5 now.
      @(posedge clk);
      	push <= 1'b0;
        pop <= 1'b0;
      	data_in <= 3'b101;

      
      repeat(10)
      @(posedge clk);
      $finish;
    end
  
endmodule
