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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ledDisplay is
    Port ( w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           clk_in: in STD_LOGIC;
           res: in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR (15 downto 0));
end ledDisplay;

architecture V1 of ledDisplay is

constant max_count : integer := 3;           -- for simulation only (easier to check output!)
--constant max_count : integer := 125;         -- for real world application assuming 1 kHz clock, divide to 8 Hz to see output pattern

signal vclk : std_logic; --slower clock to use for LED sequence so it is visible

begin
-- clock divider process
  ---------------------------------
  clk_divide : process (clk_in) is
  
  variable count : unsigned(6 downto 0):= to_unsigned(0,7);      -- 7 bits required to count up to 125
  variable clk_proc : std_logic := '0';                          -- this is a clock internal to the process
  
  begin
    
    if rising_edge(clk_in) then
    
      if count < max_count-1 then     -- highest value count should reach is 6,249,999.
        count := count + 1;           -- increment counter
      else
        count := to_unsigned(0,7);      -- reset count to zero
        clk_proc := not clk_proc;       -- invert clock variable every time counter resets
      end if;
      
     vclk <= clk_proc;                 -- assign clock variable to internal clock signal
      
    end if;
    
  end process;
  

sequence_gen_w1: process(vclk, res) is
    variable count : unsigned(2 downto 0) := "000";
    variable count_two : unsigned(2 downto 0) := "000";
    
   begin 
     if (res = '1' OR (w1 = '0' AND w2 = '0') OR (w1 = '1' AND w2 ='1')) then  
          --w1 and w2 first condition are to prevent undefined LEDS at the start
          --second to prevent undefined beahviour if (for some reason) they both go HIGH
               LEDs <= "0000000000000000";                                          
               count := to_unsigned(0, 3);
               count_two := to_unsigned(0, 3);
     elsif rising_edge(vclk) then       
             if (w1 = '1') then
                      count := count+1;
  
             elsif (w2 = '1') then                      --elsif prevents w1 and w2 patterns executing at the same time         
                    count_two := count_two+1;
             end if;
     end if;
   
    if (w1 = '1') then                              --if statements to separate w1 and w2 cases
     case to_integer(count) is                    
         when 0 =>
            LEDs <= "0000000000000000";   
    
         when 1 =>
            LEDs <= "1000000100000000";           --pattern on left side if player 1 wins
       
         when 2 =>
            LEDs <= "1100001100000000";
       
         when 3 =>
            LEDs <= "1110011100000000";
   
          when 4 =>
            LEDs <= "1111111100000000";
            count := to_unsigned(1, 3);       -- loops the pattern back around
        
          when others =>
             LEDs <= (others => '1');   -- in case of unexpected input
     end case;
    end if;
    
    if (w2 = '1') then
     case to_integer(count_two) is 
     
        when 0 =>
           LEDs <= "0000000000000000";
    
        when 1 =>
           LEDs <= "0000000010000001";           --pattern on right side if p2 wins
       
        when 2 =>
           LEDs <= "0000000011000011";
        
         when 3 =>
           LEDs <= "0000000011100111";
    
         when 4 =>
          LEDs <= "0000000011111111";
          count_two := to_unsigned(1, 3);       -- loops the pattern back around
    
        when others =>
         LEDs <= (others => '1');   -- in case of unexpected input
      end case;
    end if;
end process;



end V1;