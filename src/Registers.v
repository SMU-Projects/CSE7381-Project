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

module Registers(clk, regWrite, writeAddress, readAddress1, readAddress2, writeData, readData1, readData2);

    input clk;                          
	input regWrite;                   
    input [4:0] writeAddress;
    input [4:0] readAddress1;
    input [4:0] readAddress2;
    input [31:0] writeData;
    output [31:0] readData1;
    output [31:0] readData2;

    reg [31:0] readData1;
    reg [31:0] readData2;

    reg [31:0] registers [31:0];

    initial begin
        registers[0] <= 32'h00000000;
        registers[1] <= 32'h00000000;
        registers[2] <= 32'h00000000;
        registers[3] <= 32'h00000000;
        registers[4] <= 32'h00000000;
        registers[5] <= 32'h00000000;
        registers[6] <= 32'h00000000;
        registers[7] <= 32'h00000000;
        registers[8] <= 32'h00000000;
        registers[9] <= 32'h00000000;
        registers[10] <= 32'h00000000;
        registers[11] <= 32'h00000000;
        registers[12] <= 32'h00000000;
        registers[13] <= 32'h00000000;
        registers[14] <= 32'h00000000;
        registers[15] <= 32'h00000000;
        registers[16] <= 32'h00000000;
        registers[17] <= 32'h00000000;
        registers[18] <= 32'h00000000;
        registers[19] <= 32'h00000000;
        registers[20] <= 32'h00000000;
        registers[21] <= 32'h00000000;
        registers[22] <= 32'h00000000;
        registers[23] <= 32'h00000000;
        registers[24] <= 32'h00000000;
        registers[25] <= 32'h00000000;
        registers[26] <= 32'h00000000;
        registers[27] <= 32'h00000000;
        registers[28] <= 32'h00000000;
        registers[29] <= 32'h00000000;
        registers[30] <= 32'h00000000;
        registers[31] <= 32'h00000000;
    end

    always @(posedge clk)
    begin
        
        if (regWrite == 1) 
        begin
            registers[writeAddress] <= writeData;
        end
    end

    always @(negedge clk)
    begin
        readData1 <= registers[readAddress1];
        readData2 <= registers[readAddress2];
    end
endmodule











