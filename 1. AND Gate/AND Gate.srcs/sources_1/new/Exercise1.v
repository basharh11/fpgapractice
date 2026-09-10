`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 02:11:19 PM
// Design Name: 
// Module Name: Exercise1
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

// Module: when buttons 0 and 1 are pressed, turn on LED

module Exercise1(

    // Inputs
    input [1:0] btn,
    
    // Outputs 
    output [0:0] led
);

    // Continuous assignment: led[0] is always the logical AND of btn[0] and btn[1]
    // There is no sequencing or timing, the output switches as soon as the inputs switch
    // Assign statements are always active
    assign led[0] = btn[0] & btn[1]; // the buttons on the PYNQ-Z2 are active high
    
endmodule
