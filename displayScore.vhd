library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Declares the displayScore entity
--This will display the score from the scoreCounter on the 7-segment display
entity displayScore is
    Port ( s1 : in STD_LOGIC_VECTOR (4 downto 0);
           s2 : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           anode: out STD_LOGIC_VECTOR(3 downto 0);
           segments: out STD_LOGIC_VECTOR(6 downto 0));
end displayScore;

architecture V1 of displayScore is

--Initialising variables
--This keeps track of the active display unit
signal activate_counter : unsigned(1 downto 0) := "00";
--This keeps track of the digits to be displayed
type int_array is array(3 downto 0) of integer;
signal d: int_array;
--This keeps track of the current digit being displayed
signal cd: integer := 0;


begin


--Every clock pulse will change which display unit is being activated
--This counts from 0 to 3 and then rolls back to 0 after every clock pulse
count : process(clk)
begin
    if(rising_edge(clk)) then
        activate_counter <= activate_counter + 1;
    end if;
end process;

--Every time the activate_counter changes will activate the correct display unit
--Will also change the current digit to the correct digit from d
--This depends on which display unit is being activated
display: process(activate_counter)
begin
    case activate_counter is
    when "00" =>
        anode <= "0111";
        cd <= d(3);
    when "01" =>
        anode <= "1011";
        cd <= d(2);
    when "10" =>
        anode <= "1101";
        cd <= d(1);
    when "11" =>
        anode <= "1110";
        cd <= d(0);
    when others =>
        anode <= "0111";
        cd <= d(3);
    end case;
end process;

--Sets segments to display the current digit
setSegments: process(cd)
begin
    case cd is
    when 0 => segments <= "0000001";
    when 1 => segments <= "1001111";
    when 2 => segments <= "0010010";
    when 3 => segments <= "0000110";
    when 4 => segments <= "1001100";
    when 5 => segments <= "0100100";
    when 6 => segments <= "0100000";
    when 7 => segments <= "0001111";
    when 8 => segments <= "0000000";
    when 9 => segments <= "0000100";
    when others => segments <= "1111110";
    end case;
end process;

--Splits player 1 score into two seperate integer digits
--These are saved in d(3) and d(2)
findInt1 : process(s1)
    variable integer1 : integer := 0;
begin
    
    integer1 := to_integer(unsigned(s1));
    d(3) <= integer1 / 10;
    d(2) <= integer1 mod 10;
end process;


--Splits the player 2 score into two seperate integer digits
--These are saved in d(1) and d(0)
findInt2 : process(s2)
    variable integer2 : integer := 0;
begin
    integer2 := to_integer(unsigned(s2));
    d(1) <= integer2 / 10;
    d(0) <= integer2 mod 10;
end process;

end V1;