//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: Registers
// Description: Memory reading and writing module of the MIPS Architecture
// 
// Dependencies: Register
// Test Bench: Register_tb
// 
// Authors: Will Lacey
// Date Created: 11/11/2019
//
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module Registers(regWrite, readReg1, readReg2, writeReg, writeData, readData1, readData2);

	input regWrite; 
    input [4:0] readReg1;
    input [4:0] readReg2;
    input [4:0] writeReg;
    input [31:0] writeData;
    output [31:0] readData1;
    output [31:0] readData2;

endmodule