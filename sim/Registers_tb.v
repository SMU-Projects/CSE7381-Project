//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: Registers_tb
// Description: Test Bench for Registers Module
// 
// Dependencies: Register
// Testing Module: Registers
// 
// Authors: Will Lacey
// Date Created: 11/11/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Registers_tb;
	reg regWrite; 
    reg [4:0] readReg1;
    reg [4:0] readReg2;
    reg [4:0] writeReg;
    reg [31:0] writeData;
    wire [31:0] readData1;
    wire [31:0] readData2;

endmodule



