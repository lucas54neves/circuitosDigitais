library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity divfreq1Hz is
    Port (
        input_clk: in  STD_LOGIC;
        output_clk : out STD_LOGIC
    );
end divfreq1Hz;
 
architecture Behavioral of divfreq1Hz is
    signal temporal: STD_LOGIC;
    signal counter: integer range 0 to 12587499 := 0;
begin
    divfreq: process (input_clk) begin
        if rising_edge(input_clk) then
            if (counter = 12587499) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter+1;
            end if;
        end if;
    end process;
     
    output_clk <= temporal;
end Behavioral;