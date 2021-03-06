library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity frequency_divider is
port(
	-- INPUTS
	-- input data received
	CLOCK, RESET : in std_logic;
	
	-- OUTPUTs
	-- output signals to Transmitter
	NEW_CLOCK : out std_logic
);
end frequency_divider;

architecture rtl of frequency_divider is
	-- Internal signal declaration goes HERE
	
	-- the frequency of the input CLOCK
	signal division_factor : integer := 3;
	
	-- counter is updated based on CLOCK
	signal counter : integer := 1;
	
	-- placeholder for output clock value
	signal new_clock_temp: std_logic;
begin
	
	-- Process Description: Updates Counter
	-- Process is synchronous
	-- Additional details:
	CLK_recovery: process (RESET, CLOCK)
	begin
		if(RESET = '1') then
			counter <= 1;
			new_clock_temp <= '0';
		elsif(rising_edge(CLOCK))then
			if(counter = division_factor) then
				new_clock_temp <= not(new_clock_temp);
				counter <= 1;
			else
				counter <= counter + 1;
			end if;
		end if;
		NEW_CLOCK <= new_clock_temp;
	end process CLK_recovery;

end rtl;