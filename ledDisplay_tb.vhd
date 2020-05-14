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
           LEDs : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal w1, w2, clk_tb : std_logic;
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
	
	     w1<='0'; w2<='0'; wait for 82 ns;       
    	 w1<='1'; w2<='0'; wait for 2000 ns;                   --check 1st pattern continues while w1 is 1
         w1<='0'; w2<='0'; wait for 200 ns;                    --check 2nd pattern
    	 w1<='0'; w2<='1'; wait for 10 ns;

    --test 2   
           
--	     w1<= '0'; w2<='0'; wait for 82 ns;        
--	     w1<= '1'; w2<='1'; wait for 300 ns;        --check w1 and w2 does nothing
--	     w1<= '1'; w2<='1'; wait for 300 ns;        --should still do nothing with reset up
--	     w1<= '1'; w2<='0'; wait for 300 ns;        --w1 should start pattern
--	     w1<= '1'; w2<='1'; wait for 300 ns;     
--	     w1<= '0'; w2<='1'; wait for 300 ns;        --w2 should start pattern   
--                                                            --in final design the signals sending to w1/w2 would go low on reset
                                                              
                                
	wait;                                                     
	end process;

DUT: ledDisplay port map(w1=>w1, w2=>w2, clk_in=>clk_tb, LEDs=>LEDs);
end Behavioral;
