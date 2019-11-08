//////////////////////////////////////////////////////////////////////////////////

// Module Name: SignExt
// Description: Extends the sign for the Immediate in an I-Instruction; Extends
//					a 16 bit value to a 32 bit
// 
// Dependencies: 
// Test Bench: SignExt_tb
// 
// Authors: Mike Xiao
// Date Created: 11/06/2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SignExt(imm, extendedImm);
    input[15:0] imm;
    output [31:0] extendedImm;
    
    reg[31:0] extendedImm;
    wire[15:0] imm;
    
    always @(imm)
    begin
        extendedImm[31:0] <= {{16{imm[15]}}, imm[15:0]};
    end
endmodule
