`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 01:27:39 AM
// Design Name: 
// Module Name: mq_4bit
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


module mq_4bit(
    input [3:0] m,
    input q,
    output [3:0] mq
    );
    
    generate
        genvar i;
        
        for(i = 0; i < 4; i = i + 1)
        begin
            assign mq[i] = m[i] & q;
        end
    endgenerate
     
endmodule
