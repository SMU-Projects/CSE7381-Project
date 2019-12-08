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
// Authors: Will Lacey, Mike Xiao
// Date Created: 11/23/2019
//
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module Pipeline (
	clk, instruction32, readData1, readData2, extendedImm, 
	regDst, regWrite, 
	opcode, rs, rt, rd, shamt, funct, immediate, address
);

	// MIPS Instruction Decode Outputs
	input clk;
	input [31:0] instruction32;
	output [31:0] readData1;
	output [31:0] readData2;
	output [31:0] extendedImm;

	// MIPS Instruction Decode Control Signals
	input regDst;
	input regWrite;

	// Additional MIPS ID Pipeline output for testing purposes
	output [5:0] opcode;
	output [4:0] rs;
	output [4:0] rt;
	output [4:0] rd;
	output [4:0] shamt;
	output [5:0] funct;
	output [15:0] immediate;
	output [25:0] address;

	// Intermediate signals
	wire [4:0] writeAddress;

	// First, decode 32 bit instruction....

	// R instruction
	assign opcode = instruction32[31:26];
	assign rs = instruction32[25:21];
	assign rt = instruction32[20:16];
	assign rd = instruction32[15:11];
	assign shamt = instruction32[10:6];
	assign funct = instruction32[5:0];

	// I instruction
	assign immediate = instruction32[15:0];

	// I instruction
	assign address = instruction32[25:0];


	// Now, wire hardware inside of MIPS Pipeline stage...
	Mux5 mux5 (
		.sel(regDst), .in0(instruction32[25:21]), .in1(instruction32[20:16]), .out(writeAddress) 
	);

	Registers registers(
		.clk(clk), .regWrite(regWrite), .writeAddress(writeAddress), .readAddress1(instruction32[25:21]), 
		.readAddress2(instruction32[20:16]), .writeData(32'hFFFFFFFF), .readData1(readData1), .readData2(readData2)
	);

	SignExt signExt(
		.imm(instruction32[15:0]), .extendedImm(extendedImm)
	);

endmodule




