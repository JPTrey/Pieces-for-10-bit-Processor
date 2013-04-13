--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:58:24 04/09/2013
-- Design Name:   
-- Module Name:   /students/home/jsimonel/Desktop/Leo/Simonelli-ControlDecode/decode_tb.vhd
-- Project Name:  Simonelli-ControlDecode
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decode_tb IS
END decode_tb;
 
ARCHITECTURE behavior OF decode_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         Instruction : IN  std_logic_vector(9 downto 0);
         Opcode : OUT  std_logic_vector(3 downto 0);
         ReadI1WriteI : OUT  std_logic_vector(3 downto 0);
         fiveToOne : OUT  std_logic_vector(4 downto 0);
         ReadI2WriteDWriteData : OUT  std_logic_vector(5 downto 0);
         oneToZero : OUT  std_logic_vector(1 downto 0);
         Arg2 : OUT  std_logic;
         Bit0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal Opcode : std_logic_vector(3 downto 0);
   signal ReadI1WriteI : std_logic_vector(3 downto 0);
   signal fiveToOne : std_logic_vector(4 downto 0);
   signal ReadI2WriteDWriteData : std_logic_vector(5 downto 0);
   signal oneToZero : std_logic_vector(1 downto 0);
   signal Arg2 : std_logic;
   signal Bit0 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          Instruction => Instruction,
          Opcode => Opcode,
          ReadI1WriteI => ReadI1WriteI,
          fiveToOne => fiveToOne,
          ReadI2WriteDWriteData => ReadI2WriteDWriteData,
          oneToZero => oneToZero,
          Arg2 => Arg2,
          Bit0 => Bit0
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
