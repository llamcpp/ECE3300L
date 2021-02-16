`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 03:36:37 AM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
    input [3:0] X, Y,
    input [1:0] op_sel,
    output reg [7:0] result,
    output reg carry_out, overflow
    );
    
    wire [3:0] w0;
    wire [7:0] w1;
    wire c, o;
    
    //can not put modules in case statements
    adder_subtractor ad0 (
        .x(X),
        .y(Y),
        .add_n(op_sel[0]),
        .s(w0),
        .c_out(c),
        .overflow(o)
    );
    
    csa_multiplier m0 (
        .m(X),
        .q(Y),
        .P(w1)
    );
    
    //display what  
    always @(X, Y, op_sel) 
    begin       
        case(op_sel[1])
            1'b0:
            begin
                result = {4'b0,w0};  
                carry_out = c;
                overflow = o;  
            end
                
            1'b1:
            begin
                result = w1;
                carry_out = 1'b0;
                overflow = 1'b0;
            end  
        endcase
    end
endmodule
