//////////////////////////////////////////////////////////////////////////////////

// Module Name: RegsMux_tb
// Description: Test Bench for RegsMux Module
// 
// Dependencies: 
// Testing Module: 
// 
// Authors: Will Lacey
// Date Created: 
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RegsMux_tb
	reg [4:0] rt;			// First Potential Write Register Location
	reg [4:0] rd;			// Second Potential Write Register Location
	reg RegDst;				// Selector For wWich Write Register Location
	wire [4:0] writeReg;	// Calculated Write Register Location

	initial
	begin
	   rt = 5'b00000;  // 0, these values will distinguish registers
	   rd = 5'b11111;  // 31
	   RegDst = 0;
	end

	initial 
	begin
		#2 RegDst = 1;
		#2 rt = 5'b11000;
		#2 rd = 5'b00111;
		#2 RegDst = 0;
	end

	initial $monitor($time, " RegDst=%b rt=%b rd=%b writeReg=%b", RegDst, rt, rd, writeReg);
	initial #30 $stop;

endmodule