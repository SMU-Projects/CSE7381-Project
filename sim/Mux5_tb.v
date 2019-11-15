//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Mux_tb
// Description: Test Bench for Mux5 Module
// 
// Dependencies: 
// Testing Module: Mux5
// 
// Authors: Will Lacey
// Date Created: 11/08/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Mux_tb;
	reg sel;  // Selector For Which Output
	reg [4:0] in0;  // First Potential Output
	reg [4:0] in1;  // Second Potential Output
	wire [4:0] out;  // Calculated Output

	Mux5 mux(sel, in0, in1, out);

	initial
	begin
		in0 = 5'b00000;  // 0, these values will distinguish registers
		in1 = 5'b11111;  // 31
		sel = 0;
	end

	initial 
	begin
		#2 sel = 1;
		#2 in0 = 5'b11000;
		#2 in1 = 5'b00111;
		#2 sel = 0;
	end

	initial $monitor($time, " sel=%b in0=%b in1=%b out=%b", sel, in0, in1, out);
	initial #30 $stop;

endmodule