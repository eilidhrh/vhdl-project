----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 09:58:09
-- Design Name: 
-- Module Name: badmintonScore_tb - Behavioral
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

entity badmintonScore_tb is
--  Port ( );
end badmintonScore_tb;

architecture Behavioral of badmintonScore_tb is
component badMintonScore is
 Port ( p1btn : in STD_LOGIC;
           p2btn : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           anode: out STD_LOGIC_VECTOR(3 downto 0);
           segments: out STD_LOGIC_VECTOR(6 downto 0);
           LEDs : out STD_LOGIC_VECTOR (15 downto 0));
 end component;

signal p1btn, p2btn, reset, clk : std_logic;
signal anode: std_logic_vector(3 downto 0);
signal segments: std_logic_vector(6 downto 0);
signal LEDs : std_logic_vector(15 downto 0);

begin
clockgen : process
	begin
		while now <= 10000 ns loop
			clk <= '1';
			wait for 5 ns;
			clk <= '0';
			wait for 5 ns;	
		end loop;
		wait;
	end process;

stimuli: process
	begin
	 p1btn <= '0'; p2btn <= '0'; reset <= '0'; wait for 10ns;    --use this for each test
	 
	--expand me for tests
	--test 1 - buttons only
	  --initialises score
       
        
--        --adds a couple points to each score
--        p1btn <= '1'; wait for 10ns;
--        p2btn <= '1'; wait for 10ns;
--        p1btn<= '0'; p2btn <= '0'; wait for 10ns;
--        p1btn <= '1'; wait for 10ns;
--        p1btn <= '0'; wait for 10ns;
--        p2btn <= '1'; wait for 10ns;
--        p2btn <= '0'; wait for 10ns;
        
--        p1btn <= '1'; p2btn <= '1'; wait for 10 ns;      --simultaneous push
--        p1btn <= '0'; p2btn <= '0'; wait for 10 ns;      --simultaneus release
--        p1btn <= '1'; p2btn <= '1'; wait for 10 ns;      
--        p1btn <= '0'; p2btn <= '1'; wait for 10 ns;      --release p1 first
--        p1btn <= '0'; p2btn <= '0'; wait for 10 ns;
--        p1btn <= '1'; p2btn <= '1'; wait for 10 ns;
--        p1btn <= '1'; p2btn <= '0'; wait for 10 ns;      --release p2 first
--        p1btn <= '0'; p2btn <= '0'; wait for 10 ns;

----------------------------------------------------------------------------	
	
        
  	
	--test 2 - testing reset
--	  --initialises score
--        p1btn <= '0'; p2btn <='0'; reset <='0'; wait for 10ns; 
    
--        p1btn <= '1'; reset <= '1'; wait for 10ns;        --reset preventing p1 or p2
--        p2btn <= '1'; wait for 10ns;
--        p1btn <= '0'; p2btn <= '0'; wait for 40ns;        --wait full cycle of anode
        
--        p1btn <= '1'; p2btn <= '1'; reset <= '0'; wait for 10ns;
--        p1btn <= '0'; p2btn <= '0'; reset <= '0'; wait for 10ns;
--        p1btn <= '1'; p2btn <= '1'; reset <= '0'; wait for 10ns;
--        p1btn <= '0'; p2btn <= '0'; reset <= '0'; wait for 10ns;
--        p1btn <= '1'; p2btn <= '1'; reset <= '0'; wait for 58 ns;            --add a few points, wait full cycle and reset right before clock edge
--        p1btn <= '0'; p2btn <= '0'; reset <= '1'; wait for 10ns;
--        reset <= '0'; 
----------------------------------------------------------------------------


--------TEST 3 - win 1, reset, win 1 again, wait full 5 seconds------------------
        
       --initialises score
--          p1btn <= '0'; p2btn <= '0'; reset <= '0'; wait for 10ns;
          
--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 125 ns;
--            reset <= '1'; wait for 20 ns;
--            reset <= '0'; wait for 80 ns;
            
--           for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 10 ns;

----------------------------------------------------------------------------        

          
--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 125 ns;
--            reset <= '1'; wait for 20 ns;
--            reset <= '0'; wait for 80 ns;
            
--           for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 10 ns;
----------------------------------------------------------------------------


----------------TEST 4 - first p1 wins then p2

--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 125 ns;
--            reset <= '1'; wait for 20 ns;
--            reset <= '0'; wait for 80 ns;
            
--           for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 10 ns;





--------------TEST 5 - repeat test 4 without reset

--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 500 ns;
      
--           for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 10 ns;
            
            
 --------------TEST 6 - check score isn't being added during w1

--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--           for i in 0 to 26 loop
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 5ns;
--            p2btn <= '1'; wait for 5ns;
--            p2btn <= '0'; wait for 5ns;
--          end loop;
            
       
--         -- wait for 400 ns;  -- waiting for led sequence to complete
          
--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--         end loop;
        
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 10 ns;

	
	
	wait;
	end process;


DUT: badmintonScore port map(p1btn=>p1btn, p2btn=>p2btn, anode=>anode, segments=>segments, LEDs=>LEDs, reset=>reset, clk=>clk);


end Behavioral;
