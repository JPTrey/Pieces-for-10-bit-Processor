`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:48 04/07/2013 
// Design Name: 
// Module Name:    Control
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
module Control(
//    input [9:0] Instruction,
//    output [4:0] Opcode,
//    output [4:0] ReadI1|WriteI,
//    output [5:0] 5-1,
//    output [6:0] ReadI2|WriteD|WriteData,
//    output Arg2,
//    output Flag(Bit0)

		input [3:0] Opcode,
		input [3:0] ReadI1WriteI,
		input [4:0] FiveToOne,
		input [5:0] ReadI2WriteDWriteData,
		input [1:0] OneToZero,
		input Arg2,
		input Bit0,
		output reg ReadI1,
		output reg ReadI2,
		output reg WriteI,
		output reg WriteD,
		output reg WriteData,
		output reg SomeOutputWire,
		output reg SomeOtherOutputWire,
		output reg SomeThirdWire
    );

	always @(Opcode)
		begin

		case(Opcode)
			0 :						//result
			begin
			
			end
			1 :						//setImmediate
			begin
			
			end
			2 :						//loadQuery
			begin
			
			end
			3 :						//compare
			begin
			
			end
			4 :						//jumpBackOrInit
			begin
			
			end
			5 :						//increment
			begin
			
			end
			6 :						//ifDone
			begin
			
			end
			7 :						//storeToZero
			begin
			
			end
			8 :						//setArg
			begin
			
			end
			9 :						//jumpOrInitFp
			begin
			
			end
			10 :						//skipIfNotOne
			begin
			
			end
			11 : 						//push
			begin
			
			end
			12 :						//pop
			begin
			
			end
			13 :						//setTemp
			begin
			
			end
			14 :						//return	
			begin
			
			end
			
		endcase
	end		
endmodule
