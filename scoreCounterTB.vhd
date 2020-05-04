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
        while(now < 9000ms) loop
            clk <= '1'; wait for 0.5ms;
            clk <= '0'; wait for 0.5ms;
        end loop;
        wait;
    end process;
    
    buttons: process is
    begin
        p1 <= '0'; p2 <='0'; reset <='0'; wait for 10ms;
        
        p1 <= '1'; wait for 10ms;
        p2 <= '1'; wait for 10ms;
        p2 <= '0'; wait for 10ms;
        reset <= '1'; wait for 10ms;
        p1 <= '0'; wait for 10ms;
        reset <= '0'; wait for 10ms;
        
        for i in 0 to 20 loop
            p1 <= '1'; wait for 10ms;
            p1 <= '0'; wait for 10ms;
            p2 <= '1'; wait for 10ms;
            p2 <= '0'; wait for 10ms;
        end loop;
        
        p1 <= '1'; wait for 10ms;
        
        
        wait;
    end process;
    
end arch;
