--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   16:13:09 10/28/2016
-- Design Name:   n-bit regeister test bech
-- Module Name:   H:/Documents/DSD/LAB3/nbitReg/nbitReg_tb.vhd
-- Project Name:  nbitReg
-- Target Device:  
-- Tool versions:  
-- Description:   test bench for n-bit register
-- 
-- VHDL Test Bench Created by ISE for module: nbitReg
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
 
ENTITY nbitReg_tb IS
END nbitReg_tb;
 
ARCHITECTURE behavior OF nbitReg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nbitReg
    PORT(
         CLK : IN  std_logic;
         D_inputs : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         preset : IN  std_logic;
         Q_outputs : INOUT  std_logic_vector(3 downto 0);
         Q_bar_outputs : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal D_inputs : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal preset : std_logic := '0';

	--BiDirs
   signal Q_outputs : std_logic_vector(3 downto 0);
   signal Q_bar_outputs : std_logic_vector(3 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nbitReg PORT MAP (
          CLK => CLK,
          D_inputs => D_inputs,
          reset => reset,
          preset => preset,
          Q_outputs => Q_outputs,
          Q_bar_outputs => Q_bar_outputs
        );


   CLK <= not CLk after 50ns;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 175 ns;	

      -- insert stimulus here
		
		--1st test case
		D_inputs <= "0000";
		reset <= '0';
		preset <= '0';
		
		wait for 100 ns;	
		
		--2nd test case
		D_inputs <= "1111";
		reset <= '0';
		preset <= '0';
		
		wait for 100 ns;	
		
		--3rd test case
		D_inputs <= "0101";
		reset <= '0';
		preset <= '0';
		
		wait for 100 ns;	
		
		--4th test case
		D_inputs <= "1000";
		reset <= '0';
		preset <= '0';
		
		wait for 100 ns;	
		
		--5th test case
		D_inputs <= "0101";
		reset <= '1';
		preset <= '1';
		
		wait for 100 ns;	
		
		--6th test case
		D_inputs <= "0101";
		reset <= '0';
		preset <= '1';
		
		wait for 100 ns;	
		
		--7th test case
		D_inputs <= "1001";
		reset <= '0';
		preset <= '0';
		
		wait for 100 ns;	
		
		--8th test case
		D_inputs <= "0001";
		reset <= '0';
		preset <= '0';
		
		wait for 100 ns;	
		
		--9th test case
		D_inputs <= "0000";
		reset <= '0';
		preset <= '1';
		
		wait for 100 ns;	
		
		--10th test case
		D_inputs <= "0110";
		reset <= '1';
		preset <= '1';
		
		wait for 100 ns;	
		

      wait;
   end process;

END;
