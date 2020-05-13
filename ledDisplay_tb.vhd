----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2020 17:52:01
-- Design Name: 
-- Module Name: ledDisplay_tb - Behavioral
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

entity ledDisplay_tb is
--  Port ( );
end ledDisplay_tb;





architecture Behavioral of ledDisplay_tb is
component ledDisplay is
 Port (    w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           clk_in: in STD_LOGIC;
           res: in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal w1, w2, clk_tb, res, en : std_logic;
signal LEDs : std_logic_vector(15 downto 0);

begin

clockgen : process
	begin
		while now <= 5000ns loop
			CLK_TB <= '1';
			wait for 5 ns;
			CLK_TB <= '0';
			wait for 5 ns;	
		end loop;
		wait;
	end process;

stimuli: process                                        
	begin
	--test 1
	
--	     w1<='0'; w2<='0'; res<='0'; wait for 82 ns;       
--    	 w1<='1'; w2<='0'; wait for 4000 ns;                   --check 1st pattern continues while w1 is 1
--    	 w1<='0'; w2<='0'; wait for 450 ns;
	 
	 --test 2
	 
--	     w1<='0'; w2<='0'; res<='0'; wait for 82 ns;         --check reset doesn't allow w1 up
--	     w1<='1'; w2<='0'; res<='1'; wait for 100 ns;        
--	     w1<='1'; w2<='0'; res<='0'; wait for 1000 ns;
--	     w1<='1'; w2<='0'; res<='1'; wait for 450 ns;        --check reset stops w1 asynchronously 
--	     w1<='1'; w2<='0'; res<='0'; wait for 450 ns;        --after reset pattern should go on

      --test 3   
           
--	     w1<= '0'; w2<='0'; res<='0'; wait for 82 ns;        
--	     w1<= '1'; w2<='1'; res<='0'; wait for 300 ns;        --check w1 and w2 does nothing
--	     w1<= '1'; w2<='1'; res<='1'; wait for 300 ns;        --should still do nothing with reset up
--	     w1<= '1'; w2<='0'; res<='0'; wait for 300 ns;        --w1 should start pattern
--	     w1<= '1'; w2<='0'; res<='1'; wait for 300 ns;        --reset should stop pattern
                                                              --in final design the signals sending to w1/w2 would go low on reset
	     
	   --test 4
	   
--	     w1<= '1'; w2<='0'; res<='0'; wait for 102 ns;        
--	     w1<= '1'; w2<='1'; res<='0'; wait for 300 ns;        --when w1 and w2 are up LEDs should turn off
--	     w1<= '1'; w2<='0'; res<='0'; wait for 300 ns;        --when w2 goes down w1 should proceed
	     
--	     w1<= '1'; w2<='1'; res<='0'; wait for 100 ns;        
--	     w1<= '0'; w2<='1'; res<='0'; wait for 400 ns;         --w2 pattern should proceed in this case
	     
--	     w1<= '1'; w2<='1'; res<='0'; wait for 100 ns;         --should stop again
	     
--	     w1<= '1'; w2<='0'; res<='0'; wait for 100 ns;         --w1 should proceed


-- First 3 tests but for w2

       --test 1/w2

--	     w1<='0'; w2<='0'; res<='0'; wait for 82 ns;       
--    	 w1<='0'; w2<='1'; res<='0'; wait for 4000 ns;                  
--    	 w1<='0'; w2<='0'; res<='0'; wait for 450 ns;
	 
	   --test 2/w2
	 
--	     w1<='0'; w2<='0'; res<='0'; wait for 82 ns;         
--	     w1<='0'; w2<='1'; res<='1'; wait for 100 ns;        
--	     w1<='0'; w2<='1'; res<='0'; wait for 1000 ns;
--	     w1<='0'; w2<='1'; res<='1'; wait for 450 ns;        
--	     w1<='0'; w2<='1'; res<='0'; wait for 450 ns;       

       --test 3/w2  
        
--	     w1<= '0'; w2<='0'; res<='0'; wait for 82 ns;        
--	     w1<= '1'; w2<='1'; res<='0'; wait for 300 ns;       
--	     w1<= '1'; w2<='1'; res<='1'; wait for 300 ns;        
--	     w1<= '0'; w2<='1'; res<='0'; wait for 300 ns;        
--	     w1<= '0'; w2<='1'; res<='1'; wait for 300 ns;        
	     
	wait;                                                     
	end process;


DUT: ledDisplay port map(w1=>w1, w2=>w2, clk_in=>clk_tb, res=>res, LEDs=>LEDs);
end Behavioral;
