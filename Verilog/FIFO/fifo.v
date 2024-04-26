/ Code your design here
// Code your design here


module fifo(
  input push,
  input pop,
  input [3:0] data_in,
  input clk,
  input reset,
  
  output reg [3:0] data_out,
  output reg  fifo_full,
  output reg  fifo_empty,
  output reg [2:0] sel_num
);
  reg enable;
  reg [2:0] count;
  reg [3:0] reg1_out;
  reg [3:0] reg2_out;
  reg [3:0] reg3_out;
  reg [3:0] reg4_out;
  reg [2:0] mux_out;
  
  // counters code
  always @(*)
    begin
      enable = push | pop;
    end
  always @(*)
    begin
      case (push)
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
/// fifo registers
  
  always @(posedge clk)
    begin
      if(reset)
        reg1_out <= 0;
      else if(push)
        reg1_out  <= data_in;
    end
  always @(posedge clk)
    begin
      if(reset)
        reg2_out <= 0;
      else if(push)
        reg2_out <= reg1_out;
    end
  
  always @(posedge clk)
    begin
      if(reset)
        reg3_out <= 0;
      else if(push)
        reg3_out <= reg2_out;
    end
  
  always @(posedge clk)
    begin
      if(reset)
        reg4_out <= 0;
      else if(push)
        reg4_out <= reg3_out;
    end
  // fifo mux
  
  always @(*)
 	begin 
   		case(count)
     		2'b00 : data_out = reg1_out;
     		2'b01 : data_out = reg2_out;
          	2'b10 : data_out = reg3_out;
          	2'b11 : data_out = reg4_out;
   		endcase
 	end
// countrt value check
  always@(*)
    begin
   sel_num <= count;
    end
  
  always@(*)
    begin
      if(count == 3'd4)
        begin
   		fifo_full <= 1'b1;
      	fifo_empty <= 1'b0;
        end
      else if (count == 3'd0) 
        begin
        fifo_empty <= 1'b1;
      	fifo_full <= 1'b0;
        end
      else
        begin
        fifo_empty <= 1'b0;
      	fifo_full <= 1'b0;
        end
    end
  
endmodule


