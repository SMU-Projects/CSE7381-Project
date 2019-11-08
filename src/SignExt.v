//////////////////////////////////////////////////////////////////////////////////

// Module Name: SignExt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
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
