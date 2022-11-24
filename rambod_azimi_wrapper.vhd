library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rambod_azimi_wrapper is
Port ( A, B : in std_logic_vector(3 downto 0);	-- two BCD numbers
decoded_A : out std_logic_vector(6 downto 0);	-- show A in one LED
decoded_B : out std_logic_vector(6 downto 0);	-- show B in one LED
decoded_AplusB : out std_logic_vector(13 downto 0));	-- show the result in two LEDs
end rambod_azimi_wrapper;


architecture wrapper of rambod_azimi_wrapper is

-- Component
component rambod_azimi_seven_segment_decoder is
	port(
		 code : in std_logic_vector(3 downto 0);
	    segments_out : out std_logic_vector(6 downto 0)
	);
end component;

-- Component
component rambod_azimi_bcd_adder_behavioral is
    port(
        A: in std_logic_vector(3 downto 0);
		  B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(3 downto 0); 
        C: out std_logic
		  );
end component;


signal sum1: std_logic_vector(3 downto 0);	-- right digit
signal sum2: std_logic_vector(3 downto 0);	-- left digit

signal result_led1: std_logic_vector(6 downto 0);
signal result_led2: std_logic_vector(6 downto 0);

signal carry : std_logic;


begin

Sum2(1) <= '0';
Sum2(2) <= '0';
Sum2(3) <= '0';
Sum2(0) <= carry;


LED1: rambod_azimi_seven_segment_decoder port map (A, decoded_A);	-- represent the first BCD digit (A) in the first 7-segment LED
LED2: rambod_azimi_seven_segment_decoder port map (B, decoded_B); -- represent the second BCD digit (B) in the second 7-segment LED
BCD1: rambod_azimi_bcd_adder_behavioral port map (A, B, sum1, carry); -- represent the second BCD digit (B) in the second 7-segment LED

LED3: rambod_azimi_seven_segment_decoder port map (sum1, result_led1);	-- represent the first digit of A+B in the third 7-segment LED
LED4: rambod_azimi_seven_segment_decoder port map (sum2, result_led2); -- represent the second digit of A+B in the fourth 7-segment LED

decoded_AplusB <= result_led1 & result_led2;


end wrapper;