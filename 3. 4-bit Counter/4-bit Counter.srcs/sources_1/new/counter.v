`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 12:09:31 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input [1:0] btn,
    output [3:0] led
    
    );
    
    wire rst;
    wire clk; // clk signal will be controlled by btn 0 (toggles high and low)
    
    assign rst = btn[0];
    assign clk = btn[1]; // buttons on the Pynq-Z2 are active high (pull-down resistors)
    
    always @ (posedge clk or posedge rst) // count up on clock button rising edge or reset button rising edge (if I were to use negedge, then the 
    
    
endmodule
