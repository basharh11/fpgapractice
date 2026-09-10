`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2026 04:54:19 PM
// Design Name: 
// Module Name: FullAdder
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

// Module: Perform addition on the logical output of the buttons and display the sum and carry using the LEDs

module FullAdder(
    
    input [2:0] btn,
    output [1:0] led
    
    );
    
    wire a, b, c;
    
    assign a = btn[0] ^ btn[1];
    assign b = a & btn[2];
    assign c = btn[0] & btn[1];
    assign led[0] = a ^ btn[2];
    assign led[1] = b | c;
    
endmodule
