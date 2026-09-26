`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:08:55 PM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider(
        input logic [31:0] divider_constant, // if we want a 1 Hz 50% duty cycle clock from the PYNQ-Z2's 125 MHz clock, the divider constant must be 62.5 MHz (the output clock signal will be toggled every half a second)
        input logic sysclk,
        input logic reset,
        output logic count_enable
);

logic [31:0] clock_div_count;
logic clock;
logic clock_buffer;
    
always_ff @ (posedge sysclk or negedge reset) begin
    if (reset == 1'b0)
        clock_div_count <= 32'h0;
    else begin
        if (clock_div_count < divider_constant)
            clock_div_count <= clock_div_count + 32'h1; // count up 
        else 
            clock_div_count <= 32'h0; // once the counter is equal to the user defined divider constant, reset the counter
    end
end

always_ff @ (posedge sysclk or negedge reset) begin
    if (reset == 1'b0)
        clock <= 1'b1;
    else begin
        if (clock_div_count == 32'h0)
            clock <= ~clock; // when the counter resets, invert the output clock signal (for a 50% duty cycle, half of the cycle should be low and half of the cycle should be high)
    end
end

always_ff @ (posedge sysclk or negedge reset) begin
    if (reset == 1'b0)
        clock_buffer <= 1'b1;
    else
        clock_buffer <= clock; // update the buffer with the current value of the clock (gives us the ability to check the rising or falling edge of this clock)
end

assign count_enable = (clock == 1'b1 && clock_buffer == 1'b0); // checks if one_second_counter is on a rising edge

endmodule
