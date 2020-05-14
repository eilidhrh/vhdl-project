library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ledDisplay is
    Port ( w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           clk_in: in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR(15 downto 0));
           
end ledDisplay;

   architecture V1 of ledDisplay is

begin


  

sequence_gen_w1: process(clk_in, w1, w2) is
    variable count : unsigned(1 downto 0) := "00";          --controlling player 1 pattern
    variable count_two : unsigned(1 downto 0) := "00";      --controlling player 2 pattern
    
   begin 
     if ((w1 = '0' AND w2 = '0') OR (w1 = '1' AND w2 ='1')) then    --set LEDs to 0 when no one's won or unexpected output (w1 and w2) 
               LEDs <= "0000000000000000";             
               count := to_unsigned(0, 2);
               count_two := to_unsigned(0, 2);
     elsif rising_edge(clk_in) then       
             if (w1 = '1') then
                      count := count+1;
  
             elsif (w2 = '1') then                      --elsif prevents w1 and w2 patterns executing at the same time         
                    count_two := count_two+1;
             end if;
     end if;
   
     if (w1 = '1') then                         --if statements prevent the two counts affecting LEDs independently
     case to_integer(count) is   
     
         when 0 =>
            LEDs <= "1000000100000000";           --pattern on left side if player 1 wins
       
         when 1 =>
            LEDs <= "1100001100000000";
       
         when 2 =>
            LEDs <= "1110011100000000";
            
         when 3 =>
            LEDs <= "1111111100000000";                   

          
          when others =>
             LEDs <= (others => '1');   -- in case of unexpected input
             
     end case;
    end if;
    
    if (w2 = '1') then 
     case to_integer(count_two) is 
     
        when 0 =>
           LEDs <= "0000000010000001";           --pattern on right side if p2 wins
       
        when 1 =>
           LEDs <= "0000000011000011";
        
         when 2 =>
           LEDs <= "0000000011100111";
    
         when 3 => 
         LEDs <= "0000000011111111";
    
        when others =>
         LEDs <= (others => '1');   -- in case of unexpected input
         
      end case;
    end if;
end process;



end V1;