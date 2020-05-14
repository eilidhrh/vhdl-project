library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity badmintonScore is
    Port ( p1btn : in STD_LOGIC;
           p2btn : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           anode: out STD_LOGIC_VECTOR(3 downto 0);
           segments: out STD_LOGIC_VECTOR(6 downto 0);
           LEDs : out STD_LOGIC_VECTOR (15 downto 0));
           
end badmintonScore;

architecture V1 of badmintonScore is

component scoreCounter      --main module controlling scoring
port ( p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           w1 : out STD_LOGIC;
           w2 : out STD_LOGIC;
           s1 : out STD_LOGIC_VECTOR (4 downto 0);
           s2 : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component ledDisplay        --module controlling LEDs
 Port ( w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           clk_in: in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component displayScore      --module controlling 7 seg display
  Port ( s1 : in STD_LOGIC_VECTOR (4 downto 0);
           s2 : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           anode: out STD_LOGIC_VECTOR(3 downto 0);
           segments: out STD_LOGIC_VECTOR(6 downto 0));
end  component;

signal w1sig, w2sig, resetsig, clksig: std_logic;
signal s1sig, s2sig : std_logic_vector(4 downto 0);

begin


ScoreModule: scoreCounter port map(p1=>p1btn, p2=>p2btn, reset=>reset, clk=>clk, w1=>w1sig, w2=>w2sig, s1=>s1sig, s2=>s2sig);

LEDModule: ledDisplay port map(w1=>w1sig, w2=>w2sig, clk_in=>clk, LEDs=>LEDs);

sevenSegModule: displayScore port map(s1=>s1sig, s2=>s2sig, clk=>clk, anode=>anode, segments=>segments);


end V1;