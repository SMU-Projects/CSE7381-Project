//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: Registers
// Description: Memory reading and writing module of the MIPS Architecture
// 
// Dependencies: 
// Test Bench: Register_tb
// 
// Authors: Will Lacey
// Date Created: 11/11/2019
//
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module Registers(clk, regWrite, writeAddress, readAddress1, readAddress2, writeData, readData1, readData2);

    input clk;  // clock signal 
    input regWrite;  // signal to write to the write register
    input [4:0] writeAddress;  // write address for register, location determined by the register MUX5
    input [4:0] readAddress1;  // first read address for register
    input [4:0] readAddress2;  // second read address for register
    input [31:0] writeData;  // write data for register
    output [31:0] readData1;  // first read data from register
    output [31:0] readData2;  // second read data from register

    reg [31:0] readData1;
    reg [31:0] readData2;

    reg [31:0] registers [31:0];  // 32 registers for Registers module 

    initial begin
        registers[0] <= 32'h00000000;  // TODO: condense to for loop 
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

    // write to registers on positive clock edge
    always @(posedge clk)
    begin
        if (regWrite == 1) 
        begin
            registers[writeAddress] <= writeData;
        end
    end

    // output read data on negative clock edge
    always @(negedge clk)
    begin
        readData1 <= registers[readAddress1];
        readData2 <= registers[readAddress2];
    end
endmodule


