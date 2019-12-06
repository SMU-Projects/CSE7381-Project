//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Pipeline_tb
// Description: Test Bench for Pipeline Module
// 
// Dependencies: SignExt, Mux5, Registers
// Testing Module: Pipeline
// 
// Authors: Will Lacey
// Date Created: 11/23/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// MIPS Instruction Decode Outputs
	reg clk;
	reg [31:0] instruction32;
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] extendedImm;

	// MIPS Instruction Decode Control Signals
	reg regDst;
	reg regWrite;

	// Additional MIPS ID Pipeline output for testing purposes
	wire [5:0] opcode;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] shamt;
	wire [5:0] funct;
	wire [15:0] immediate;
	wire [25:0] address;

	Pipeline pipeline (
		clk, instruction32, readData1, readData2, extImmediate, 
		regDst, regWrite, 
		opcode, rs, rt, rd, shamt, funct, immediate, address
	);

	// Initialize testbench
	initial
	begin
		clk = 1;
		instruction32 = 32'hFFFFFFFF;
		regDst = 1;
		regWrite = 1;
	end

	// The following test bench code verifies the functionality of the Registers module
	initial 
	begin
		#1 clk=0; instruction32=32'h00000000; regDst=0; regWrite=1;
		#1 clk=1; instruction32=32'h11111111; regDst=0; regWrite=1;
		#1 clk=0; instruction32=32'h22222222; regDst=0; regWrite=1;
		#1 clk=1; instruction32=32'h33333333; regDst=0; regWrite=1;
		#1 clk=0; instruction32=32'h44444444; regDst=0; regWrite=1;
		#1 clk=1; instruction32=32'h55555555; regDst=0; regWrite=1;
		#1 clk=0; instruction32=32'h66666666; regDst=0; regWrite=1;
		#1 clk=1; instruction32=32'h77777777; regDst=0; regWrite=1;
		#1 clk=0; instruction32=32'h88888888; regDst=0; regWrite=1;
		#1 clk=1; instruction32=32'h99999999; regDst=0; regWrite=1;
		#1 clk=0; instruction32=32'hAAAAAAAA; regDst=1; regWrite=1;
		#1 clk=1; instruction32=32'hBBBBBBBB; regDst=0; regWrite=1;
	end

	initial $monitor($time, " Inputs: clk=%b instruction32=%h regDst=%b regWrite=%b \n\t\t\t Output: readData1=%h readData2=%h extImmediate=%h \n\t\t\t Decode: opcode=%b rs=%b rt=%b rd=%b shamt=%b funct=%b immediate=%b address=%b", clk, instruction32, regDst, regWrite, readData1, readData2, extImmediate, opcode, rs, rt, rd, shamt, funct, immediate, address);
	initial #30 $stop;

endmodule









