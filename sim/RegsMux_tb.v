//////////////////////////////////////////////////////////////////////////////////

// Module Name: RegsMux_tb
// Description: Test Bench for RegsMux Module
// 
// Dependencies: 
// Testing Module: 
// 
// Authors: Will Lacey
// Date Created: 11/08/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RegsMux_tb;
	reg RegDst;				// Selector For wWich Write Register Location
	reg [4:0] rt;			// First Potential Write Register Location
	reg [4:0] rd;			// Second Potential Write Register Location
	wire [4:0] writeReg;	// Calculated Write Register Location

	RegsMux regsMux(RegDst, rt, rd, writeReg);


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