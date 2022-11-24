library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rambod_azimi_bcd_adder_behavioral is

port ( A: in std_logic_vector (3 downto 0);
		 B: in std_logic_vector (3 downto 0);
		 S   : out std_logic_vector (3 downto 0);
		 C   : out std_logic);
		 
end rambod_azimi_bcd_adder_behavioral;

architecture bcd of rambod_azimi_bcd_adder_behavioral is

	signal sum  : std_logic_vector(4 downto 0);
	signal sum2  : std_logic_vector(4 downto 0);
	signal carry: std_logic;

	begin
	
	sum <= ('0' & A) + ('0' & B);
	
	sum2 <= (sum + 6);
	
	carry <= '1' when sum > 9 else '0';
	
	S <= sum(3 downto 0) when (carry = '0') else sum2(3 downto 0);
	
	C <= sum(4) when (carry = '0') else sum2(4);
	
end bcd;