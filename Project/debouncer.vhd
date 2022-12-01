--debouncer
--debouncer
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is  
generic (
    counter_size : integer := 12
  );
port (
    clock, reset : in std_logic;
    bouncy : in std_logic;
    pulse : out std_logic
    );
end debouncer;

architecture behavioral of debouncer is
    signal counter                  : unsigned(counter_size - 1 downto 0);
    signal candidate_value          : std_logic;
    signal stable_value             : std_logic;
    signal delayed_stable_value     : std_logic;

    begin
        process(clock, reset) begin
            if reset = '0' then
                counter <= (others => '1');
                candidate_value <= '0';
                stable_value <= '0';
            