`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:24 04/07/2013 
// Design Name: 
// Module Name:    Decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Decoder(
    input[9:0] Instruction,
    output reg [3:0] Opcode,
    output reg [3:0] ReadI1WriteI,
    output reg [4:0] fiveToOne,
    output reg [5:0] ReadI2WriteDWriteData,
	 output reg [1:0] oneToZero,
    output reg Arg2,
    output reg Bit0
	 );

	always @(Instruction)
		begin
		
		assign Opcode = Instruction[9:6];
		assign ReadI1WriteI = Instruction[5:2];
		assign fiveToOne = Instruction[5:1];
		assign ReadI2WriteDWriteData = Instruction[5:0];
		assign oneToZero = Instruction[1:0];
		assign Arg2 = Instruction[1:1];
		assign Bit0 = Instruction[0:0];
		
		end
endmodule
