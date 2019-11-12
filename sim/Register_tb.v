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

	reg clk;					// Clock Signal
	reg [31:0] in;				// Input Data
    reg regWrite;				// Write Signal
    wire [31:0] out;			// Output Data

	Register register(clk, in, regWrite, out);

	initial
	begin
		clk = 1;				// Begin when clock is high
		regWrite = 1; 			// First start by loading the data
		in = 32'h00000000;		// Zero off safed data
	end

	initial 
	begin
		#2 clk=0; regWrite=0;	
		#2 clk=1; in=32'hFFFFFFFF;	
		#2 clk=0; regWrite=1; in=32'hAAAAAAAA;
		#2 clk=1; 
	end

	initial $monitor($time, " clk=%b regWrite=%b in=%h out=%h", clk, regWrite, in, out);
	initial #30 $stop;

endmodule