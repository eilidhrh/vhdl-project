library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity scoreCounterTB is
end entity scoreCounterTB;

architecture arch of scoreCounterTB is
component scoreCounter is
    Port ( p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           w1 : out STD_LOGIC;
           w2 : out STD_LOGIC;
           s1 : out STD_LOGIC_VECTOR (4 downto 0);
           s2 : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal p1, p2, reset, clk, w1, w2 : std_logic;
signal s1, s2 : std_logic_vector(4 downto 0);

begin
    DUT : scoreCounter port map(p1 => p1, p2 => p2, reset => reset, clk => clk,  w1 => w1, w2 => w2, s1 => s1, s2 => s2);
    
    clock : process is
    begin
        while(now < 12000ms) loop
            clk <= '1'; wait for 0.5ms;
            clk <= '0'; wait for 0.5ms;
        end loop;
        wait;
    end process;
    
    buttons: process is
    begin
        --initialises score
        p1 <= '0'; p2 <='0'; reset <='0'; wait for 10ms;
        
        --adds a couple points to each score
        p1 <= '1'; wait for 10ms;
        p2 <= '1'; wait for 10ms;
        p1<='0'; p2 <= '0'; wait for 10ms;
        p1 <= '1'; wait for 10ms;
        p1 <= '0'; wait for 10ms;
        p2 <= '1'; wait for 10ms;
        p2 <= '0'; wait for 10ms;
        
        --resets while p1 is high then p1 goes low
        p1 <='1'; wait for 10ms;
        reset <= '1'; wait for 10ms;
        reset <= '0'; wait for 10ms;
        p1 <= '0'; wait for 10ms;
        
        --makes score 20:20
        for i in 0 to 19 loop
            p1 <= '1'; wait for 10ms;
            p1 <= '0'; wait for 10ms;
            p2 <= '1'; wait for 10ms;
            p2 <= '0'; wait for 10ms;
        end loop;
        
        --makes player 1 win
        p1 <= '1'; wait for 10ms;
        p1 <= '0'; wait for 1000ms;
        
        --resets after 1s
        reset <= '1'; wait for 10ms;
        reset <= '0'; wait for 10ms;
        
        --makes score 20:20
        for i in 0 to 22 loop
            p1 <= '1'; wait for 10ms;
            p1 <= '0'; wait for 5ms;
            p2 <= '1'; wait for 5ms;
            p2 <= '0'; wait for 10ms;
        end loop;
        
        --makes player 2 win
        p2 <= '1'; wait for 10ms;
        p2 <= '0'; wait for 10ms;
        p2 <= '1'; wait for 10ms;
        p2 <= '0'; wait for 10ms;
        
        --simulates buttons being pressed
        --score should stay the same
        for i in 0 to 10 loop
            p1 <= '1'; wait for 10ms;
            p1 <= '0'; wait for 10ms;
            p2 <= '1'; wait for 10ms;
            p2 <= '0'; wait for 10ms;
        end loop;
        
        reset <= '1'; wait for 10ms;
        reset <= '0'; wait for 10ms;
        
        for i in 0 to 22 loop
            p1 <= '1'; wait for 10ms;
            p1 <= '0'; wait for 5ms;
            p2 <= '1'; wait for 5ms;
            p2 <= '0'; wait for 10ms;
            p2 <= '1'; wait for 5ms;
            p2 <= '0'; wait for 10ms;
            p1 <= '1'; wait for 10ms;
            p1 <= '0'; wait for 5ms;
        end loop;
        
        --waits - score should reset after 5 seconds
        
        wait;
    end process;
    
end arch;
