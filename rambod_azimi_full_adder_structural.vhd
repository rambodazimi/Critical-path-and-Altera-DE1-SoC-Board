library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rambod_azimi_full_adder_structural is
port (
a: in std_logic;
b: in std_logic;
c_in: in std_logic;
s: out std_logic;
c_out: out std_logic);
end rambod_azimi_full_adder_structural;

--Architecture (Structural)
architecture fulladder of rambod_azimi_full_adder_structural is

signal y_output: std_logic;	-- a xor b
signal x_output: std_logic;	-- a and b
signal z_output: std_logic;


component rambod_azimi_half_adder_structural is
port (a: in std_logic;
		b: in std_logic;
		s: out std_logic;
		c: out std_logic);
end component rambod_azimi_half_adder_structural;

begin

HA: rambod_azimi_half_adder_structural port map (a, b, y_output, x_output);
HA_2: rambod_azimi_half_adder_structural port map (y_output, c_in, s, z_output);
c_out <= (x_output or z_output);

end fulladder;