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

	reg clk;
	reg regWrite; 
	reg [4:0] writeAddress;
    reg [4:0] readAddress1;
    reg [4:0] readAddress2;
    reg [31:0] writeData;
    wire [31:0] readData1;
    wire [31:0] readData2;

    Registers registers(clk, regWrite, writeAddress, readAddress1, readAddress2, writeData, readData1, readData2);

    initial
	begin
	   clk = 1;
	   regWrite = 1;
	   writeAddress = 5'b00000;
	   readAddress1 = 5'b00000;
	   readAddress2 = 5'b00000;
	   writeData = 32'hFFFFFFFF;
	end

	initial 
	begin
		#1 clk=0; regWrite=1; writeAddress=0; readAddress1=0; readAddress2=0; writeData=32'hAAAAAAAA;
		#1 clk=1; regWrite=1; writeAddress=1; readAddress1=1; readAddress2=1; writeData=32'hAAAAAAAA;
		#1 clk=0; regWrite=1; writeAddress=2; readAddress1=1; readAddress2=1; writeData=32'h12345678;
		#1 clk=1; regWrite=1; writeAddress=2; readAddress1=2; readAddress2=2; writeData=32'hBBBBBBBB;
		#1 clk=0; regWrite=1; writeAddress=2; readAddress1=2; readAddress2=2; writeData=32'h12345678;
		#1 clk=1; regWrite=0; writeAddress=2; readAddress1=2; readAddress2=2; writeData=32'h12345678;
		#1 clk=0; regWrite=0; writeAddress=2; readAddress1=2; readAddress2=2; writeData=32'h12345678;
		#1 clk=1; regWrite=0; writeAddress=30; readAddress1=30; readAddress2=31; writeData=32'hFFFFFFFF;
		#1 clk=0; regWrite=0; writeAddress=30; readAddress1=30; readAddress2=31; writeData=32'hFFFFFFFF;
	end

	initial $monitor($time, " clk=%b regWrite=%b writeAddress=%d readAddress1=%d readAddress2=%d writeData=%h readData1=%h readData2=%h", clk, regWrite, writeAddress, readAddress1, readAddress2, writeData, readData1, readData2);
	initial #30 $stop;

endmodule


