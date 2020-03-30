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
    when "01" =>
        anode <= "1011";
    when "10" =>
        anode <= "1101";
    when "11" =>
        anode <= "1110";
    end case;
end process;

findInt1 : process(s1)
begin
    
end process;

end V1;
