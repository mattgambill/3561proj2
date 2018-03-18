-- Vhdl test bench
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY sequential_tb IS
END sequential_tb;
ARCHITECTURE behavioral OF sequential_tb IS

	COMPONENT counter
		PORT (
			Q0 : BUFFER STD_LOGIC;
			CLK : IN STD_LOGIC;
			INPUT : IN STD_LOGIC;
			RCO : OUT STD_LOGIC;
			Q1 : BUFFER STD_LOGIC;
			CLR : IN STD_LOGIC
		);
	END COMPONENT;

	SIGNAL Q0 : STD_LOGIC;
	SIGNAL CLK : STD_LOGIC;
	SIGNAL INPUT : STD_LOGIC := '0';
	SIGNAL RCO : STD_LOGIC;
	SIGNAL Q1 : STD_LOGIC;
	SIGNAL CLR : STD_LOGIC := '0';
	SIGNAL TEMPORAL : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000"; --Add the Temporal Signal variable HERE!!!
BEGIN
	UUT : counter
	PORT MAP(
		Q0 => Q0, 
		Q1 => Q1, 
		CLK => CLK, 
		INPUT => INPUT, 
		RCO => RCO, 
		CLR => CLR
	);

	-- *** Test Bench - User Defined Section ***
	tb : PROCESS
	BEGIN
		FOR i IN 0 TO 50 LOOP
			CLK <= TEMPORAL(0);
			TEMPORAL <= std_logic_vector(UNSIGNED(TEMPORAL) + 1);
			IF (TEMPORAL = "010111") THEN
				INPUT <= '1'; --set INPUT=1 when TEMPORAL ="010110"
			END IF;
			WAIT FOR 50 ns;
			IF (TEMPORAL = "000001") THEN
				CLR <= '1';
			END IF;
			IF (TEMPORAL = "000010") THEN
				CLR <= '0';
			END IF;
 
		END LOOP;
		WAIT; -- will wait forever
	END PROCESS;
	-- *** End Test Bench - User Defined Section ***

END;