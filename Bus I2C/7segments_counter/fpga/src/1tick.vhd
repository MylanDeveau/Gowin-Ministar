library ieee;
use ieee.std_logic_1164.all;

entity tick is
port(
    clk, usr_in : in std_logic;
    usr_out : out std_logic
);
end entity;

architecture bhv of tick is
    signal tmp : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if usr_in = '1' and tmp = '0' then
                usr_out <= '1';
                tmp <= '1';
            elsif usr_in = '1' and tmp = '1' then
                usr_out <= '0';
                tmp <= '1';
            else
                usr_out <= '0';
                tmp <= '0';
            end if;
        end if;
    end process;
end architecture;   