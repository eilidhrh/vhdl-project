----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2020 12:08:52
-- Design Name: 
-- Module Name: ledDisplay - V1
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ledDisplay is
    Port ( w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           clk: in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR (0 downto 0));
end ledDisplay;

architecture V1 of ledDisplay is

begin


end V1;
