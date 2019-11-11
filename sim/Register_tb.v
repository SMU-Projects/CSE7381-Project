//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: Register_tb
// Description: Test Bench for Register Module
// 
// Dependencies: 
// Testing Module: Register
// 
// Authors: Will Lacey
// Date Created: 11/08/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Register_tb;
	reg [31:0] in;				// Input Data
    reg regWrite;				// Write Signal
    wire [31:0] out;			// Output Data

	Register register(in, regWrite, out);

	initial
	begin
	   regWrite = 1; 			// First start by loading the data
	   in = 32'h00000000;		// Zero off safed data
	end

	initial 
	begin
		#2 regWrite = 0;		
		#2 in = 32'hFFFFFFFF;
		#2 regWrite = 1; in = 32'hAAAAAAAA;
	end

	initial $monitor($time, " regWrite=%b in=%h out=%h", regWrite, in, out);
	initial #30 $stop;

endmodule