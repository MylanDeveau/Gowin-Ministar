library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity divider1Hz is
port(
    clock_in, reset : in std_logic;
    clock_out : out std_logic
);
end entity;

architecture bhv of divider1Hz is
    signal count : integer := 1;
    signal tmp : std_logic := '0';
begin
    process(clock_in, reset, tmp)
    begin
        if (reset = '0') then
            count <= 1;
            tmp <= '0';
        elsif (rising_edge(clock_in)) then
            count <= count + 1;
            if (count = 2500000) then
                tmp <= NOT tmp;
                count <= 1;
            end if;
        end if;
        clock_out <= tmp;
    end process; 
end bhv;