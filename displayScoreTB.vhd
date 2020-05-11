library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity displayScoreTB is
end entity displayScoreTB;

architecture arch of displayScoreTB is
component displayScore is
    Port ( s1 : in STD_LOGIC_VECTOR (4 downto 0);
           s2 : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           anode: out STD_LOGIC_VECTOR(3 downto 0);
           segments: out STD_LOGIC_VECTOR(6 downto 0));
end component;

signal clk : STD_LOGIC;
signal s1, s2 : STD_LOGIC_VECTOR(4 downto 0);
signal anode : STD_LOGIC_VECTOR(3 downto 0);
signal segments: STD_LOGIC_VECTOR(6 downto 0);


begin
    DUT : displayScore port map(clk => clk, s1 => s1, s2 => s2, anode => anode, segments => segments);
    
    clkPulse : process is
    begin
        while now <= 70ms loop
            clk <= '1'; wait for 0.5ms;
            clk <= '0'; wait for 0.5ms;
        end loop;
        wait;
    end process;
    
    scoreChanging : process is
    begin
        s1 <= "00000"; s2 <= "00000"; wait for 10ms; --0:0
        s1 <= "01011"; s2 <= "00111"; wait for 10ms; --11:7
        s1 <= "11111"; s2 <= "11111"; wait for 10ms; --31:31
        s1 <= "00101"; s2 <= "01000"; wait for 10ms; --5:8
        s1 <= "10101"; s2 <= "01110"; wait for 10ms; --21:14
        s1 <= "11010"; s2 <= "11101"; wait for 10ms; --26:29
        s1 <= "UUUUU"; s2 <= "XXXXX"; wait for 10ms; --"--:--"
        wait;
    end process;
    
end arch;