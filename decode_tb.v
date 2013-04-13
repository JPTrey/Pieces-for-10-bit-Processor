`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:47 04/09/2013
// Design Name:   Decoder
// Module Name:   /students/home/jsimonel/Desktop/Leo/Simonelli-ControlDecode/decode_tb.v
// Project Name:  Simonelli-ControlDecode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decode_tb;

	// Inputs
	reg [9:0] Instruction;

	// Outputs
	wire [3:0] Opcode;
	wire [3:0] ReadI1WriteI;
	wire [4:0] fiveToOne;
	wire [5:0] ReadI2WriteDWriteData;
	wire [1:0] oneToZero;
	wire Arg2;
	wire Bit0;

	// Instantiate the Unit Under Test (UUT)
	Decoder uut (
		.Instruction(Instruction), 
		.Opcode(Opcode), 
		.ReadI1WriteI(ReadI1WriteI), 
		.fiveToOne(fiveToOne), 
		.ReadI2WriteDWriteData(ReadI2WriteDWriteData), 
		.oneToZero(oneToZero), 
		.Arg2(Arg2), 
		.Bit0(Bit0)
	);

	initial begin
		// Initialize Inputs
		Instruction = 15;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		Instruction = 20;
		#100;
		Instruction = 500;
	end
      
endmodule

