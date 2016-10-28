--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   13:03:01 10/28/2016
-- Design Name:   D flip flop Test Bench
-- Module Name:   H:/Documents/DSD/LAB3/dFlipFlop/dFlipFlop_tb.vhd
-- Project Name:  dFlipFlop
-- Target Device:  
-- Tool versions:  
-- Description:   test bench to test possible input combinations for D flip flop
-- 
-- VHDL Test Bench Created by ISE for module: dFlipFlop
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
 
ENTITY dFlipFlop_tb IS
END dFlipFlop_tb;
 
ARCHITECTURE behavior OF dFlipFlop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dFlipFlop
    PORT(
         D : IN  std_logic;
         reset : IN  std_logic;
         preset : IN  std_logic;
         CLK : IN  std_logic;
         Q : INOUT  std_logic;
         Q_bar : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal reset : std_logic := '0';
   signal preset : std_logic := '0';
   signal CLK : std_logic := '0';

	--BiDirs
   signal Q : std_logic;
   signal Q_bar : std_logic;

   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dFlipFlop PORT MAP (
          D => D,
          reset => reset,
          preset => preset,
          CLK => CLK,
          Q => Q,
          Q_bar => Q_bar
        );

   CLK <= not CLk after 50ns;
 

   -- Stimulus process
   stim_proc: process
	
	
   begin		
      -- hold reset state for 100 ns.
      wait for 175 ns;	

		

		--loops to go through all possible 
      floop0: for l in std_logic range '0' to '1' loop--loop through all possible values of d
			d <= l; --apply new stimulus of d
			floop1: for i in std_logic range '0' to '1' loop--loop through all possible values of reset
				reset <= i; --apply new stimulus of reset
				floop2: for j in std_logic range '0' to '1' loop--loop through all possible values of preset
						
						preset <= j; --apply new stimulus of preset
											
						wait for 100ns;
					
				end loop;
			end loop; 
		end loop; 

      wait;
   end process;

END;
