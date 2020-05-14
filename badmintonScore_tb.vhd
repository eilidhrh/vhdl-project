library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;



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
		while now <= 10000 ns loop                --using faster clock due to hardware limitations
			clk <= '1';
			wait for 5 ns;
			clk <= '0';
			wait for 5 ns;	
		end loop;
		wait;
	end process;

stimuli: process
	begin
	
	 --initialise score
	 p1btn <= '0'; p2btn <= '0'; reset <= '0'; wait for 10ns;    --use this for each test	 
	 
-----------TEST 1 - buttons only--------------------------------------------
	
--        p1btn <= '1'; wait for 10ns;                     --adds a couple points to each score
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
--        p1btn <= '0'; p2btn <= '0'; wait for 40 ns;      --wait full cycle of anode
--        reset <= '1'; wait for 10 ns;
--        reset <= '0'; wait for 40 ns;                    --reset score and wait for anode to update   
        
--        for i in 0 to 16 loop                            --run up score to 17:17
--         p1btn <= '1'; wait for 10ns;
--         p1btn <= '0'; wait for 10ns;
--         p2btn <= '1'; wait for 10ns;
--         p2btn <= '0'; wait for 10ns;
       
--        end loop;
        
--        p1btn <= '1'; wait for 10 ns;
--        p1btn <= '0'; wait for 10 ns;
--        p1btn <= '1'; wait for 10 ns;
--        p1btn <= '0'; wait for 10 ns;                    --have player 1 win, observe pattern
--        p1btn <= '1'; wait for 10 ns;
--        p1btn <= '0'; wait for 70 ns;                    --hold to check segments
--        p1btn <= '1'; wait for 10 ns;
--        p1btn <= '0'; wait for 10 ns;
--                                                           -- uncomment either of these depending on p1 or p2 to win
--        p2btn <= '1'; wait for 10 ns;
--        p2btn <= '0'; wait for 10 ns;
--        p2btn <= '1'; wait for 10 ns;
--        p2btn <= '0'; wait for 10 ns;                    --have player 2 win, observe pattern
--        p2btn <= '1'; wait for 10 ns;
--        p2btn <= '0'; wait for 10 ns;
--        p2btn <= '1'; wait for 10 ns;
--        p2btn <= '0'; wait for 10 ns;                    --don't forget final wait statement
        
----------------------------------------------------------------------------	     

-----------TEST 2 - testing reset and margin--------------------------------
  
--        p1btn <= '1'; p2btn <= '0'; reset <= '1'; wait for 20ns;        --reset preventing p1 or p2
--        p1btn <= '1'; p2btn <= '1'; reset <= '1'; wait for 20ns;
--        p1btn <= '0'; p2btn <= '1'; reset <= '1'; wait for 20ns;
--        p1btn <= '1'; p2btn <= '1'; reset <= '1'; wait for 20ns;        
--        p1btn <= '0'; p2btn <= '0'; reset <= '0'; wait for 40ns;        --wait full cycle of anode
 
--        p1btn <= '1'; p2btn <= '1'; reset <= '0'; wait for 40ns;        -- wait full cycle of anode
        
--        for i in 0 to 22 loop                                           --run score up to 26:26 to check margin win condition             
--          p1btn <= '1'; wait for 10ns;  
--          p1btn <= '0'; wait for 10ns;
--          p2btn <= '1'; wait for 10ns;
--          p2btn <= '0'; wait for 10ns;
--        end loop;
        
----          p1btn <= '1'; wait for 10 ns;
----          p1btn <= '0'; wait for 60 ns;
----          p1btn <= '1'; wait for 10 ns;                                 --player 1 should win on 28:26
----          p1btn <= '0'; wait for 10 ns;
----                                                                uncomment either for p1 or p2
--          p2btn <= '1'; wait for 10 ns;
--          p2btn <= '0'; wait for 60 ns;                               --player 2 should win on 26:28
--          p2btn <= '1'; wait for 10 ns;                                 
--          p2btn <= '0'; wait for 10 ns;

----------------------------------------------------------------------------


--------TEST 3 - win 1, reset, win 1 again, wait full 5 seconds-------------
        
      
--          for i in 0 to 19 loop                     --get to 20:20
--            p1btn <= '1'; wait for 5ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 10 ns;
--            p1btn <= '1'; wait for 10 ns;          -- win on 22:20 and wait for pattern
--            p1btn <= '0'; wait for 125 ns;
--            reset <= '1'; wait for 20 ns;           -- reset    
--            reset <= '0'; wait for 80 ns;

----            p2btn <= '1'; wait for 10 ns;
----            p2btn <= '0'; wait for 10 ns;
----            p2btn <= '1'; wait for 10 ns;          -- same code if p2 win
----            p2btn <= '0'; wait for 125 ns;
----            reset <= '1'; wait for 20 ns;           -- reset    
----            reset <= '0'; wait for 80 ns;



            
--           for i in 0 to 19 loop                    -- repeat
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 10 ns;
--            p1btn <= '1'; wait for 10 ns;           --code for p1 win
--            p1btn <= '0'; wait for 10 ns;

--            p2btn <= '1'; wait for 10 ns;           --same code if p2 win
--            p2btn <= '0'; wait for 10 ns;
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 10 ns;

----------------------------------------------------------------------------


----------------TEST 4 - first p1 wins then p2------------------------------

--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 10 ns;
            
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 125 ns;          --wait for sequence
          
--            reset <= '1'; wait for 20 ns;           --reset
--            reset <= '0'; wait for 80 ns;
            
            
--           for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 10 ns;           --2 wins
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 10 ns;

----------------------------------------------------------------------------


--------------TEST 5 - repeat test 4 without reset and reversed-------------

--          for i in 0 to 18 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;            
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 50 ns;               -- wait for score
--            p2btn <= '1'; wait for 10 ns;
--            p2btn <= '0'; wait for 500 ns;              --p2 win and wait 500 ns for sequence
        
--           for i in 0 to 18 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;                
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
        
--            p1btn <= '1'; wait for 10 ns;
--            p1btn <= '0'; wait for 50 ns;               --wait for score
--            p1btn <= '1'; wait for 10 ns;               --p1 win
--            p1btn <= '0'; wait for 10 ns;

----------------------------------------------------------------------------           
        
        
 --------------TEST 6 - check score isn't being added during w1--------------

--          for i in 0 to 19 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--            p2btn <= '0'; wait for 10ns;
--          end loop;
          
--          p2btn <= '1'; wait for 10ns;
--          p2btn <= '0'; wait for 10ns;
--          p2btn <= '1'; wait for 10ns;
--          p2btn <= '0'; wait for 10ns;                  --player 2 wins
          
--           for i in 0 to 18 loop
--            p1btn <= '1'; wait for 5ns; 
--            p1btn <= '0'; wait for 5ns;                 --score  points during sequence
--            p2btn <= '1'; wait for 5ns;
--           p2btn <= '0'; wait for 5ns;
--          end loop;
            
       
--          wait for 400 ns;  -- waiting for led sequence to complete
          
--          for i in 0 to 9 loop
--            p1btn <= '1'; wait for 10ns;
--            p1btn <= '0'; wait for 10ns;
--          end loop;
          
--          for i in 0 to 9 loop
--            p2btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--          end loop;
          
--          for i in 0 to 9 loop
--            p2btn <= '0'; wait for 10ns;
--            p2btn <= '1'; wait for 10ns;
--          end loop;
        
           
--          p2btn <= '1'; wait for 10ns;
--          p2btn <= '0'; wait for 10ns;
--          p2btn <= '1'; wait for 10ns;
--          p2btn <= '0'; wait for 10ns;
         
----------------------------------------------------------------------------
        
        
 --------------------Test 7 - checking >1 margin and going to 30------------
     
--        for i in 0 to 28 loop
--           p1btn <= '1'; wait for 10ns;
--           p1btn <= '0'; wait for 10ns;     --player 1
--           p2btn <= '1'; wait for 10ns;
--           p2btn <= '0'; wait for 10ns;
--        end loop;    
            
--        p1btn <= '1'; wait for 10ns;
--        p1btn <= '0'; wait for 10ns;


        for i in 0 to 28 loop                       
           p1btn <= '1'; wait for 10ns;
           p1btn <= '0'; wait for 10ns;     --player 2
           p2btn <= '1'; wait for 10ns;
           p2btn <= '0'; wait for 10ns;
        end loop;    
            
           p2btn <= '1'; wait for 10ns;
           p2btn <= '0'; wait for 10ns;
	
	
	wait;
	end process;


DUT: badmintonScore port map(p1btn=>p1btn, p2btn=>p2btn, anode=>anode, segments=>segments, LEDs=>LEDs, reset=>reset, clk=>clk);


end Behavioral;
