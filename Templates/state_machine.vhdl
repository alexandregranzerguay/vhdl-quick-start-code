library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Add more if required

entity state_machine is
port(
	-- Add all your required ports here
    -- I highly recommend grouping them in types and subtypes if need be

    -- GENERIC
    reset, clk: in std_logic -- Standard reset and clock signal
);
end state_machine;

architecture rtl of state_machine is
	-- Internal signal declaration goes HERE
    -- For state machine it is rare that you will need internal signals
    
	-- State signal declaration goes HERE
	type state_type is (); -- Add all possible states
	signal state, next_state : state_type; 

begin
	-- NOTE: THIS DESIGN CAN WORK FOR BOTH MEALY AND MOORE FINITE STATE MACHINES

	-- Process Description: Change state to next state on rising clock edge
	-- Process is synchronous
	-- Additional details: Add additional details if needed
	sync_state: process (clk) -- synchronous processes should only have reset and clk in their sensitivity list
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				-- Reset the state machine
			else
				-- Update state of state machine
				state <= next_state;
			end if;
		end if;
	end process sync_state; -- Naming the process to end is not necessary but helps readibility of code
	
	-- Process Description: Update output signals based on current state
	-- Process is asynchronous
	-- Additional details: Add additional details if needed
	state_output: process (state) -- Add list of input signals to process sensitivity list
	begin
		-- Insert logic HERE
	end process state_output;
	
	-- Process Description: Update next state based on input signals and current state
	-- Process is asynchronous
    -- Additional details: Add additional details if needed
	next_state_proc : process (state)
	begin
		-- Insert logic HERE
	end process next_state_proc;
	
end rtl;
