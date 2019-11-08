//////////////////////////////////////////////////////////////////////////////////

// Module Name: RegsMux
// Description: Registers chip MUX to select the write register
// 
// Dependencies: 
// Test Bench: 
// 
// Authors: Will Lacey
// Date Created: 
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RegsMux ();
	input RegDst;			// Selector For Which Write Register Location
	input [4:0] rt;			// First Potential Write Register Location
	input [4:0] rd;			// Second Potential Write Register Location
	output [4:0] writeReg;	// Calculated Write Register Location

	always @(RegDst or rt or rd)
	begin
		case (RegDst)
			0: writeReg <= rt;
			1: writeReg <= rd;			
			default: writeReg <= 0; 	// This Should never happen
		endcase
	end
endmodule