entity decodificador is
port(
    signed_int: IN BIT_VECTOR(3 DOWNTO 0);
    digit1: OUT BIT_VECTOR(6 DOWNTO 0);
    digit2: OUT BIT_VECTOR(6 DOWNTO 0));
end decodificador;
 
architecture behavioral of decodificador is
begin
    WITH signed_int SELECT
                     
        digit2 <=
            -- Positive values:
            NOT("1111110") WHEN "0000",
            NOT("0110000") WHEN "0001",
            NOT("1101101") WHEN "0010",
            NOT("1111001") WHEN "0011",
            NOT("0110011") WHEN "0100",
            NOT("1011011") WHEN "0101",
            NOT("1011111") WHEN "0110",
            NOT("1110000") WHEN "0111",
                 
            -- Negative values:
            NOT("0110000") WHEN "1111",
            NOT("1101101") WHEN "1110",
            NOT("1111001") WHEN "1101",
            NOT("0110011") WHEN "1100",
            NOT("1011011") WHEN "1011",
            NOT("1011111") WHEN "1010",
            NOT("1110000") WHEN "1001",
            NOT("1111111") WHEN "1000";
               
    digit1(0) <= NOT(signed_int(3));
    digit1(6 DOWNTO 1) <= "111111";
                 
end behavioral;