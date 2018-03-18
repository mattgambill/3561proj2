----------------------------------------------------------------------------------
-- Company: Ohio State University
-- Engineer: Matt Gambill
-- 
-- Create Date:    22:38:36 03/17/2018 
-- Design Name: 
-- Module Name:    counter - counter_arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
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

entity counter is
    Port ( INPUT : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q0 : buffer  STD_LOGIC;
           Q1 : buffer  STD_LOGIC;
           RCO : out  STD_LOGIC);
end counter;

architecture counter_arch of counter is
	component tff is
		port( 
		CLK: in std_logic;
		CLR: in std_logic;
		CE: in std_logic;
		T: in std_logic;
		Q: buffer std_logic);
	end component;
signal T1: std_logic;
signal VC: std_logic :='1';
begin

T1 <= (INPUT and Q1) or (not(INPUT) and not(Q1));
RCO <= (Q1 and Q0 and INPUT) or (not(Q1) and not(Q0) and not(INPUT));
TFF0: component tff
	port map(
		CLK => CLK,
		CLR => CLR,
		CE => VC,
		T => T1,
		Q => Q0
		);
TFF1: component tff
	port map(
		CLK => CLK,
		CLR => CLR,
		CE => VC,
		T => VC,
		Q => Q1
		);

end counter_arch;
