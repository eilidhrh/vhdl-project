----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2020 12:06:46
-- Design Name: 
-- Module Name: scoreCounter - V1
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

entity scoreCounter is
    Port ( p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           reset : in STD_LOGIC;
           w1 : out STD_LOGIC;
           w2 : out STD_LOGIC;
           s1 : out STD_LOGIC_VECTOR (4 downto 0);
           s2 : out STD_LOGIC_VECTOR (4 downto 0));
end scoreCounter;

architecture V1 of scoreCounter is

signal has1won : boolean := false;
signal has2won : boolean := false;

begin

    
    --w1 <= '0';
    --w2 <= '0';
    --s1 <= "00000";
    --s2 <= "00000";
    
    count1: process(reset, p1)
    subtype bit5 is integer range 0 to 31;
    variable intS1 : bit5 := 0;

    begin
        if reset = '1' then
            intS1 := 0;
            w1 <= '0';
            has1won <= false;
        elsif p1 = '1' then
            if intS1 = 20 and has2won = false then
                intS1 := intS1 + 1;
                w1 <= '1';
                has1won <= true;
            elsif intS1 < 20 then
                intS1 := intS1 + 1;
            end if;
        end if;
        
        s1 <= std_logic_vector(to_unsigned(intS1, 5));
        
    end process;
    
    count: process(reset, p2)
    subtype bit5 is integer range 0 to 31;
    variable intS2 : bit5 := 0;
    
    begin
        if reset = '1' then
            intS2 := 0;
            w2 <= '0';
            has2won <= false;
        elsif p2 = '1' then
            if intS2 = 20 and has1won = false then
                intS2 := intS2 + 1;
                w2 <= '1';
                has2won <= true;
            elsif intS2 < 20 then
                intS2 := intS2 + 1;
            end if;
        end if;
        
        s2 <= std_logic_vector(to_unsigned(intS2, 5));
        
    end process;
       
end V1;
