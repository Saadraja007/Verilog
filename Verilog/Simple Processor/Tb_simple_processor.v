`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 03:45:33 PM
// Design Name: 
// Module Name: Tb_simple_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Tb_simple_processor();
    reg clk;
    reg reset;
    
    simple_processor uut(.clk(clk),.reset(reset));
    
    initial
        begin
            clk = 0;
            forever
            #5  clk= ~clk;
        end
          initial
        begin
                reset = 0;  
            @(posedge clk)
               #1 reset = 1;
            @(posedge clk)
               #1 reset = 0;
          repeat(15) @(posedge clk);
          $finish;
            
            
        end
    
endmodule












