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

		input [3:0] Opcode,
		input [3:0] ReadI1WriteI,
		input [4:0] FiveToOne,
		input [5:0] ReadI2WriteDWriteData,
		input [1:0] OneToZero,
		input Arg2,
		input Bit0,
		output reg ReadReg1,
		output reg ReadReg2,
		output reg WriteReg,
		output reg RegWriteData,
		output reg ALU1arg2,
		output reg MemRead,
		output reg MemWrite,
		output reg MemWriteData,
		output reg BranchDest,
		output reg RegWriteFlag,
		output reg MemReadFlag,
		output reg MemWriteFlag,
		output reg ALUop1,
		output reg ALUop2,
		output reg ALUop3,
		output reg ALUop4,
		output reg ALUop5
    );

	always @(Opcode)
		begin

		case(Opcode)
			0 :						//result
			begin
			 ReadReg1 = 3;
			 ReadReg2 = 0;
			 WriteReg = 10;
			 if (FiveToOne == 1)
				begin
					ALU1arg2 = 3;
					RegWriteData = 0;
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 2)
				begin
					RegWriteData = 0;
					ALU1arg2 = 4;
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 3)
				begin
					RegWriteData = 5;
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 4)
				begin
					BranchDest = 0;//set PC to 200 here
					RegWriteFlag = 0;
				end
			 MemRead = 0;
			 MemWrite = 2; //need to change diagram
			 MemWriteData = 1;//have to be able to get reg 15 to write to mem 10
			 MemReadFlag = 0;
			 MemWriteFlag = 1;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			end
			1 :						//setImmediate
			begin
			//param[1] isnt going anywhere atm, it needs to go to RegWriteData
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 RegWriteData = 0; //this needs to be param[1]
			 WriteReg = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			
			end
			2 :						//loadQuery
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 5;
			 RegWriteData = 1;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			
			end
			3 :						//compare
			begin
			 ReadReg1 = 3;
			 ReadReg2 = 2;
			 RegWriteData = 2;
			 WriteReg = 0;//need to be able to write to reg 5, can't currently
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;//based on the output of the ALU's we have to be able to branch to specific points.
			 RegWriteFlag = 1;
			 MemReadFlag = 1;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			
			end
			4 :						//jumpBackOrInit
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 4;
			 RegWriteData = 3;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 if (FiveToOne == 0)
				begin
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 1)
				begin
					RegWriteFlag = 0;
					BranchDest = 2;//set PC to 22
				end
			 else if (FiveToOne == 2)
				begin
					RegWriteFlag = 0;
					BranchDest = 0;//set PC to reg 0
				end
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			end
			5 :						//increment
			begin
			 ReadReg1 = 0;//have to be able to get param[1]
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 if (FiveToOne == 0)
				ALUop1 = 0;//add
			 else
				ALUop1 = 1;//sub
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			end
			6 :						//ifDone
			begin
			 ReadReg1 = 3;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 0;//needs to be 144
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;//have to set PC based on ALU output
			 RegWriteFlag = 0;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			end
			7 :						//storeToZero
			begin
				ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 0;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 
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
