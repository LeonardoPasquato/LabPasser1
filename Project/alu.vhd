library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Definizione entita' ALU: gli ingressi devono ternere conto del segno!
entity alu is
  Port (
    a, b : in signed( 31 downto 0 );
    add, subtract, multiply, divide : in std_logic;
    overflow : out std_logic;
    r : out signed( 31 downto 0 )
    );
end alu;

architecture behavioral of alu is
    signal moltiplica : signed(63 downto 0);
    begin
        process(a, b, add, substract, multiply, moltiplica) begin
            r <= a;
            if add = '1' then
                r <= a + b;
            elsif substract = '1' then
                r <= a - b
            elsif multiply = '1' then
                r <= moltiplica(31 downto 0);
            end if;

            --se il risultato è maggiore di 2 alla 32 allora si accende il led di overflow
            if r > 0111111111111111111111111111111 then
                overflow <= '1';
            elsif r < 1000000000000000000000000000000  then
                overflow <= '1';
            elsif
                overflow <= '0';
            end if;
        end process;

        motliplica <= a * b;
    end behavioral;



