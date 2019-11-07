//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2019 06:01:28 PM
// Design Name: 
// Module Name: SignExt_tb
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


module SignExt_tb;
    reg [15:0] imm;
    wire [31:0] extendedImm;
    
    SignExt DUT(imm, extendedImm);
    
    initial
    begin
        imm = 16'b0000000000000000;  // 0
    end
    
    initial
    begin
        #2 imm = 16'b0000000000001100;  // 12
        #2 imm = 16'b0000000000010000;  // 16
        #2 imm = 16'b1111111111111111;  // -1
        #2 imm = 16'b1111111111110001;  // -15
    end
    
    initial $monitor($time, " imm=%b extended=%b", imm, extendedImm);
    initial #30 $stop;
endmodule
