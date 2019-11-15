//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Mux5
// Description: 5 bit MUX; Selects input in0 or in0 given selector, sel
// 
// Dependencies: 
// Test Bench: Mux5_tb
// 
// Authors: Will Lacey
// Date Created: 11/08/2019
//
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module Mux5 (sel, in0, in1, out);
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