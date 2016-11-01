--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   11:20:29 10/31/2016
-- Design Name:   n-bit Twisted Ring Counter
-- Module Name:   H:/Documents/DSD/LAB3/nbitTwistedRingCounter/nbitTwistedRingCounter_tb.vhd
-- Project Name:  nbitTwistedRingCounter
-- Target Device:  
-- Tool versions:  
-- Description:   Test bench to test an n-bit twisted ring counter 
-- 
-- VHDL Test Bench Created by ISE for module: nbitTwistedRingCounter
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
 
ENTITY nbitTwistedRingCounter_tb IS
END nbitTwistedRingCounter_tb;
 
ARCHITECTURE behavior OF nbitTwistedRingCounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nbitTwistedRingCounter
    PORT(
         CLK : IN  std_logic;
         reset : IN  std_logic;
         preset : IN  std_logic;
         Q_outputs : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';
   signal preset : std_logic := '0';

	--BiDirs
   signal Q_outputs : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nbitTwistedRingCounter PORT MAP (
          CLK => CLK,
          reset => reset,
          preset => preset,
          Q_outputs => Q_outputs
        );

   CLK <= not CLk after 50ns;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 125 ns;	

		--1st test case
		reset <= '1';
		preset <= '0';
		
		wait for 100ns;
		
		
		--2nd test case
		reset <= '0';
		
		wait for 800ns;
		
		--3rd case
		preset <= '1';
		
		wait for 100ns;
		
		preset <= '0';
		
		wait for 100ns;
		
		--3rd case
		
		      

      wait;
   end process;

END;
