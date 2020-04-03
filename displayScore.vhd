----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2020 12:08:05
-- Design Name: 
-- Module Name: displayScore - V1
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity displayScore is
    Port ( s1 : in STD_LOGIC_VECTOR (4 downto 0);
           s2 : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           anode: out STD_LOGIC_VECTOR(3 downto 0);
           segments: out STD_LOGIC_VECTOR(6 downto 0));
end displayScore;

architecture V1 of displayScore is

signal activate_counter : unsigned(1 downto 0) := "00";
signal integer1 : integer := 0;
signal integer2 : integer := 0;
type int_array is array(3 downto 0) of integer;
signal d: int_array;
signal cd: integer := 0;


begin


--Every clock pulse will change which LED is being activated
count : process(clk)
begin
    if(rising_edge(clk)) then
        activate_counter <= activate_counter + 1;
    end if;
end process;

--Every time the activate_counter changes will activate the correct LED
--Will also change the segment so the correct number is displayed
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
    end case;
end process;

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

findInt1 : process(s1)
begin
    integer1 <= to_integer(unsigned(s1));
    d(3) <= integer1 / 10;
    d(2) <= integer1 mod 10;
end process;

findInt2 : process(s2)
begin
    integer2 <= to_integer(unsigned(s2));
    d(1) <= integer1 / 10;
    d(0) <= integer1 mod 10;
end process;

end V1;
