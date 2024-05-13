`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Saad Shabbir
// 
// Create Date: 03/13/2024 03:07:09 PM
// Design Name: 
// Module Name: reg_file
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


module processor_regfile(
    input clk,
    input reset,
    input write,
    input [4:0] address,
    input [4:0] src1,
    input [4:0] src2,
    input [31:0] data_in,
    output reg [31:0] data_out1,
    output reg [31:0] data_out2
    );
//----------------------------------------------------------------------------------------------------
    // Inside the block connection
    reg [31:0] reg_0;
    reg [31:0] reg_1;
    reg [31:0] reg_2;
    reg [31:0] reg_3;
    
    reg en0;
    reg en1;
    reg en2;
    reg en3;
    
    reg [32:0] add;
    reg [32:0] sub;
    reg [63:0] mult;
    reg [31:0] data_out1;
    reg [31:0] data_out2;
//----------------------------------------------------------------------------------------------------
  
    // register 1
    always@(posedge clk)
        begin
            if(reset) reg_0 <= 0;
            else if(en0) reg_0 <= data_in;
        end
    // register 2
   always@(posedge clk)
        begin
            if(reset) reg_1 <= 0;
            else if(en1) reg_1 <= data_in;
        end
    // register 3
    always@(posedge clk)
        begin
            if(reset) reg_2 <= 0;
            else if(en2) reg_2 <= data_in;
        end
    // register 4
    always@(posedge clk)
        begin
            if(reset) reg_3 <= 0;
            else if(en3) reg_3 <= data_in;
        end
//----------------------------------------------------------------------------------------------------

    // Demux ( which gives enable to the registers).
    always@(*)
    begin
        case(address)
            2'd0 :{en0,en1,en2,en3} = {write,3'd0};
            2'd1 :{en0,en1,en2,en3} = {1'd0,write,2'd0};
            2'd2 :{en0,en1,en2,en3} = {2'd0,write,1'd0};
            2'd3 :{en0,en1,en2,en3} = {3'd0,write};
        endcase
    end
//----------------------------------------------------------------------------------------------------
    // Mux 1
    always@(*)
        begin
            case(src1)
                2'd0 :  data_out1 = reg_0;
                2'd1 :  data_out1 = reg_1;
                2'd2 :  data_out1 = reg_2;
                2'd3 :  data_out1 = reg_3;
            endcase
        end
//----------------------------------------------------------------------------------------------------
    // Mux 2
    always@(*)
        begin
            case(src2)
                2'd0 :  data_out2 = reg_0;
                2'd1 :  data_out2 = reg_1;
                2'd2 :  data_out2 = reg_2;
                2'd3 :  data_out2 = reg_3;
            endcase
        end
    
endmodule


