`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bashar :)
// 
// Create Date: 09/24/2026 11:43:03 AM
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
    input logic sw[0:0],
    input logic sysclk,
    output logic led[3:0]
);

logic [3:0] counter;
logic count_enable_1Hz;

clockdivider Hz (.divider_constant (31'd62499999), .sysclk, .reset (sw[0]), .count_enable (count_enable_1Hz));

always_ff @ (posedge sysclk or negedge sw[0]) begin
    if (sw[0] == 1'b0)
        counter <= 4'b0;
    else begin 
        if (count_enable_1Hz == 1'b1)
            counter <= counter + 1'b1;
    end    
end

assign led[0] = counter[0];
assign led[1] = counter[1];
assign led[2] = counter[2];
assign led[3] = counter[3];

endmodule
