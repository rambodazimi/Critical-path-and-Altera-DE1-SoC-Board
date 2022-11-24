library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity rambod_azimi_rca_structural is
port ( A: in std_logic_vector (3 downto 0);
		 B: in std_logic_vector (3 downto 0);
		 S: out std_logic_vector (4 downto 0));
end rambod_azimi_rca_structural;


architecture rca of rambod_azimi_rca_structural is

signal c1: std_logic;
signal c2: std_logic;
signal c3: std_logic;

component rambod_azimi_half_adder_structural is
port (a: in std_logic;
		b: in std_logic;
		s: out std_logic;
		c: out std_logic);
end component;

component rambod_azimi_full_adder_structural is
port (a: in std_logic;
		b: in std_logic;
		c_in: in std_logic;
		s: out std_logic;
		c_out: out std_logic);
end component;

begin

HA1: rambod_azimi_half_adder_structural port map( A(0), B(0), S(0), c1);
FA1: rambod_azimi_full_adder_structural port map( A(1), B(1), c1, S(1), c2);
FA2: rambod_azimi_full_adder_structural port map( A(2), B(2), c2, S(2), c3);
FA3: rambod_azimi_full_adder_structural port map( A(3), B(3), c3, S(3), S(4));

end rca;
