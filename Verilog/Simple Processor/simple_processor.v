`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2023 06:39:28 PM
// Design Name: 
// Module Name: simple_processor
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


module simple_processor(
    input clk,
    input reset
    );
    
    parameter RAM_WIDTH = 32;
    parameter RAM_ADDR_BITS = 9;
    reg [RAM_ADDR_BITS-1:0] program_count;          // Counter maximum value
    
    wire [RAM_WIDTH-1:0]  instr;                    // Program memory output
//    wire [31:0] program_regfile_output;
    wire [RAM_WIDTH-1 :0] data_out1;                          // Reg file output 1
    wire [RAM_WIDTH-1 :0] data_out2;                          // Reg file output 2                              
    
// -----------------------------------------------------------------------------------
//      ALU OPERATION CONNECTION
    reg [32:0] add;
    reg [32:0] subtract;
    reg [64:0] multiply;
    reg [31:0] nands;
// -----------------------------------------------------------------------------------
    reg [RAM_WIDTH-1 :0] processor_output;                      // The main simple processor output after ALU Mux.
    reg [RAM_WIDTH-1 :0] reg_input;                             // Reg file input after mux.
    wire [RAM_WIDTH-1 :0] data_mem_output;                      // Data memory output variable.

// -----------------------------------------------------------------------------------
//      Counter Code
always@(posedge clk)
    if(reset) program_count <= 0;
    else      program_count <= program_count +1;
    
    
// -----------------------------------------------------------------------------------
//      Program Memory Instance
bram
#(
	.RAM_WIDTH 		(RAM_WIDTH 		      ),
	.RAM_ADDR_BITS 	(RAM_ADDR_BITS        ),
	.DATA_FILE 		("D:\\vivado_projects\\Simple_Processor\\Simple_Processor.srcs\\sources_1\\new\\program.txt"        ),
	.INIT_START_ADDR(0				      ),
	.INIT_END_ADDR	(10				      )
)
prog_mem
(
	.clock			(clk              ),
	.ram_enable		(1'b1             ),
	.write_enable	(1'b0             ),
	.address		(program_count    ),
	.input_data		(0		          ),
	.output_data    (instr	          )
);
// -----------------------------------------------------------------------------------
//      Data Memory Instance
bram
#(
	.RAM_WIDTH 		(RAM_WIDTH 			 ),
	.RAM_ADDR_BITS 	(RAM_ADDR_BITS 	  	 ),
	.DATA_FILE 		("D:\\vivado_projects\\Simple_Processor\\Simple_Processor.srcs\\sources_1\\new\\data.txt"),
	.INIT_START_ADDR(0					 ),
	.INIT_END_ADDR	(10					 )	
)
data_mem
(
	.clock		       (clk                  ),
	.ram_enable        (1'b1                    ),
	.write_enable      (instr[31:27]==5      ),
	.address           (instr[15:0]           ),
	.input_data        (data_out1               ),
	.output_data       (data_mem_output      )
);
// -----------------------------------------------------------------------------------
//      Reg File Instance
processor_regfile regfile_inst(
    .clk            (clk            ),
    .reset          (reset          ),
    .write          (instr[31:27]!=5),
    .address        (instr [26:22]  ),
    .src1           (instr [21:17]  ),
    .src2           (instr [16:12]  ),
    .data_in        (reg_input),
    .data_out1       (data_out1),
    .data_out2       (data_out2)
    );    
//----------------------------------------------------------------------------------------------------
    //outside the regfile one mux & three alu operations.

always@(*)
    begin
       add  = data_out1 + data_out2; 
    end

always@(*)
    begin
       subtract  = data_out1 - data_out2; 
    end
    
always@(*)
    begin
       multiply  = data_out1 * data_out2; 
    end
always@(*)
    begin
        nands  = ~(data_out1 & data_out2); 
    end

// Alu Mux
always@(*)
    begin
        case(instr[28:27] )
        2'd0 : processor_output = add;
        2'd1 : processor_output = subtract;
        2'd2 : processor_output = multiply;
        2'd3 : processor_output = nands;
        endcase
    end
    
//----------------------------------------------------------------------------------------------------
    //Mux before Reg File which select to pass data memory value or alu operation value to Data_in of reg file.        
always@(*)
    begin
        case(instr[29])
        1'd0 : reg_input = processor_output;
        1'd1 : reg_input = data_mem_output;
    
        endcase
    end
endmodule
