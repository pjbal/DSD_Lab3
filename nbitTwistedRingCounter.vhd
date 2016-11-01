----------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: 
-- 
-- Create Date:    17:33:06 10/28/2016 
-- Design Name: 		n-bit Twisted Ring Counter
-- Module Name:    nbitTwistedRingCounter - Behavioral 
-- Project Name: 	LAB 3
-- Target Devices: 
-- Tool versions: 
-- Description: single n-bit twisted ring counter made up of an inverter and n-bit shift regester
--
-- Dependencies: 
--						-Inverter_VHDL
--						-nbit_shiftreg
--							*nbitReg
--								*dFlipFlop
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--define inputs and outputs of device
entity nbitTwistedRingCounter is
	generic (n : positive := 8);
    Port ( CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           Q_outputs : inout  STD_LOGIC_VECTOR (n-1 downto 0));
end nbitTwistedRingCounter;

architecture Behavioral of nbitTwistedRingCounter is

--define components used in device I/O
component Inverter_VHDL is --not gate
    Port ( a : in  STD_LOGIC;
           b : out  STD_LOGIC);
end component;

component nbit_shiftreg is --n-bit shift regester
	 generic (n : positive := 8);
    Port ( shift_in : in std_logic;
           CLK : in std_logic;
           reset : in std_logic;
           preset : in std_logic;
           Q_shift : out std_logic_vector(n-1 downto 0));
end component;

signal sig_shift_in : std_logic := '0'; --signal to take inverted (n-1) to shift in input of the n-bit shift regester

begin

	initNOT: Inverter_VHDL port map(Q_outputs(n-1), sig_shift_in); --define connections of Not gate in device
	initShifter: nbit_shiftreg generic map (n) port map(sig_shift_in, CLK,  reset, preset, Q_outputs); --define connections of n-bit shifter in device
	


end Behavioral;

