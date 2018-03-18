----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Matt Gambill
-- 
-- Create Date:    02:32:51 03/18/2018 
-- Design Name: 
-- Module Name:    tff - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY tff IS
	PORT (
		CLK : IN STD_LOGIC;
		CLR : IN STD_LOGIC;
		CE : IN STD_LOGIC;
		T : IN STD_LOGIC;
		Q : BUFFER STD_LOGIC
	);
END tff;

ARCHITECTURE tff_arch OF tff IS
	SIGNAL tmp : std_logic;
BEGIN
	PROCESS (CLK, CLR)
	BEGIN
		IF CLK'EVENT AND CLK = '1' THEN
			IF CLR = '1' THEN
				tmp <= '0';
			ELSIF CE = '1' THEN
				tmp <= T XOR tmp;
			END IF;
		END IF;
	END PROCESS;
	Q <= tmp;
END tff_arch;