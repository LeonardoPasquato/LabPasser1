library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Definizione entita' ALU: gli ingressi devono ternere conto del segno!
entity alu is
  Port (
    a, b : in signed( 31 downto 0 );
    add, subtract, multiply, divide : in std_logic;
    r : out signed( 31 downto 0 )
    );
end alu;

-- Definizione architettura ALU
architecture Behavioral of alu is

  signal moltiplica : signed( 63 downto 0 );

begin

  -- Processo viene eseguito ad ogni variazione su operandi e operazione selezionata
  process ( a, b, add, subtract, multiply, divide, moltiplica ) begin
    -- assegnazione di default
    r <= a;
    if add = '1' then
     r <= a + b;
    elsif subtract = '1' then
     r <= a - b;
    elsif multiply = '1' then
     r <= moltiplica( 31 downto 0 );
    elsif divide = '1' then
    -- semplificazione
     r <= a + b;
    end if;
  end process;

   -- L'FPGA genera il prodotto a 64bit, l uscita e' cmq limitata a meta' range (32bit).
   -- L'assegnazione avviene durante l esecuzione del processo.
   moltiplica <= a * b;

end Behavioral;