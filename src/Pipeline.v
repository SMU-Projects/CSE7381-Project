//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Pipeline
// Description: This module is a conglomeration of the modules SignExtend, Mux5, 
//				and Registers; together these components make up the Instruction 
//				Decode Pipeline of the MIPS architecture
// 
// Dependencies: SignExt, Mux5, Registers
// Test Bench: Pipeline_tb
// 
// Authors: Will Lacey
// Date Created: 11/23/2019
//
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module Pipeline (clk, instruction32);
	input sel;  // Selector For Which Output
	input [4:0] in0;  // First Potential Output
	input [4:0] in1;  // Second Potential Output
	output [4:0] out;  // Calculated Output

	reg [4:0] out;

	always @(sel or in0 or in1)
	begin
		case (sel)
			0: out <= in0;
			1: out <= in1;			
			default: out <= 0;  // This should never happen
		endcase
	end
endmodule