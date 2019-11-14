//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: Register
// Description: Stores a 32 bit value
// 
// Dependencies: 
// Test Bench: Register_tb
// 
// Authors: Will Lacey
// Date Created: 11/08/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Register(clk, in, regWrite, out);

    input clk;                  // Clock Signal
    input [31:0] in;			// Input Data
    input regWrite;				// Write Signal
    output [31:0] out;			// Output Data

    reg [31:0] data;			// Register reserved for holding data
    reg [31:0] out;		

    always @(posedge clk)       // Only access register when clock is high
    begin
        if (regWrite)			// If regWrite, set register data equal to input
        begin
            data <= in;
            out <= in;
        end
        else					// Else, output saved register data
        begin   
            out <= data;
        end
    end
endmodule
