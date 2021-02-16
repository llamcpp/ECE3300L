`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 01:51:51 AM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
    input [3:0] m,q,
    output [7:0] P
    );
    
    //q{which row}[which m]
    wire [3:0] q0,q1,q2,q3;
    
    mq_4bit row0 (
        .m(m),
        .q(q[0]),
        .mq(q0)
    );
    
    mq_4bit row1 (
        .m(m),
        .q(q[1]),
        .mq(q1)
    );
    
    mq_4bit row2 (
        .m(m),
        .q(q[2]),
        .mq(q2)
    );      
      
    mq_4bit row3 (
        .m(m),
        .q(q[3]),
        .mq(q3)
    );
        
    assign P[0] = q0[0];
    
    //right to left, top to bot
    wire [16:0] w;
    //right to left, top to bot
    full_adder fa0 (
        .x(q0[1]),
        .y(q1[0]),
        .c_in(1'b0),
        .s(P[1]),
        .c_out(w[0])
    );
    
    full_adder fa1 (
        .x(q0[2]),
        .y(q1[1]),
        .c_in(q2[0]),
        .s(w[1]),
        .c_out(w[2])
    );
    
    full_adder fa2 (
        .x(q0[3]),
        .y(q1[2]),
        .c_in(q2[1]),
        .s(w[3]),
        .c_out(w[4])
    );
    
    full_adder fa3 (
        .x(1'b0),
        .y(q1[3]),
        .c_in(q2[2]),
        .s(w[5]),
        .c_out(w[6])
    );
    
    full_adder fa4 (
        .x(w[1]),
        .y(1'b0),
        .c_in(w[0]),
        .s(P[2]),
        .c_out(w[7])
    );
    
    full_adder fa5 (
        .x(w[3]),
        .y(q3[0]),
        .c_in(w[2]),
        .s(w[8]),
        .c_out(w[9])
    );
    
    full_adder fa6 (
        .x(w[5]),
        .y(q3[1]),
        .c_in(w[4]),
        .s(w[10]),
        .c_out(w[11])
    );
    
    full_adder fa7 (
        .x(q2[3]),
        .y(q3[2]),
        .c_in(w[6]),
        .s(w[12]),
        .c_out(w[13])
    );
    
    full_adder fa8 (
        .x(w[8]),
        .y(w[7]),
        .c_in(1'b0),
        .s(P[3]),
        .c_out(w[14])
    );
    
    full_adder fa9 (
        .x(w[10]),
        .y(w[9]),
        .c_in(w[14]),
        .s(P[4]),
        .c_out(w[15])
    );
    
    full_adder fa10 (
        .x(w[12]),
        .y(w[11]),
        .c_in(w[15]),
        .s(P[5]),
        .c_out(w[16])
    );
    
    full_adder fa11 (
        .x(q3[3]),
        .y(w[13]),
        .c_in(w[16]),
        .s(P[6]),
        .c_out(P[7])
    );
endmodule
