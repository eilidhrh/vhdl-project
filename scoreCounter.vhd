library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Declares entity score counter
--This entity keeps track of the players score and who has won
--These outputs are displayed to the user by the other entities
entity scoreCounter is
    Port ( p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           w1 : out STD_LOGIC;
           w2 : out STD_LOGIC;
           s1 : out STD_LOGIC_VECTOR (4 downto 0);
           s2 : out STD_LOGIC_VECTOR (4 downto 0));
end scoreCounter;

architecture V1 of scoreCounter is


--Initialise variables
--Keeps track of who has won and when the game is being reset after someone has won
signal has1won : std_logic := '0';
signal has2won : std_logic := '0';
signal gameOver : boolean := false;

subtype bit5 is integer range 0 to 31;
signal intS1 : bit5 := 0;
signal intS2 : bit5 := 0;

begin
    
    --This counts the player 1 score
    --It also resets it when someone wins or the reset button is pressed
    --It also changes w1 to high when player 1 wins, which will alert the LED display entity
    count1: process(reset, p1, gameOver)
     variable margin : integer := 0;
     begin
        if reset = '1' or gameOver = true then
            intS1 <= 0;
            has1won <= '0';
        elsif p1 = '1' and has1won = '0' and has2won = '0' then
             margin := intS1 - intS2;
             if intS1 >= 20 and (margin = 1) then
                    intS1 <= intS1 + 1;
                    has1won <= '1';
             elsif intS1 >= 29 then
                    intS1 <= intS1 + 1;
                    has1won <= '1';
             else
                    intS1 <= intS1 + 1;
                    has1won <= '0';
              end if;
          end if;
        
    end process;
    
    update1: process(intS1, has1won)
    
    begin
        s1 <= std_logic_vector(to_unsigned(intS1, 5));
        w1 <= has1won;
    end process;

    
    --This counts the player 2 score
    --It also resets it when someone wins or the reset button is pressed
    --It also changes w2 to high when player 2 wins, which will alert the LED display entity
    count2: process(reset, p2, gameOver)
    variable margin : integer := 0;
    begin
        if reset = '1' or gameOver = true then
            intS2 <= 0;
            has2won <= '0';
        elsif p2 = '1' and has1won = '0' and has2won = '0' then
             margin := intS2 - intS1;
             if intS2 >= 20 and (margin = 1) then
                    intS2 <= intS2 + 1;
                    has2won <= '1';
             elsif intS2 >= 29 then
                    intS2 <= intS2 + 1;
                    has2won <= '1';
             else
                    intS2 <= intS2 + 1;
                    has2won <= '0';
              end if;
          end if;

    end process;
    
    update2: process(intS2, has2won)
    begin
        s2 <= std_logic_vector(to_unsigned(intS2, 5));
        w2 <= has2won;
    end process;
    
    
    --When someone wins this counts to 5 seconds
    --It then sends a command to the other processes to reset
    gameIsOver : process(has1won, has2won, clk)
    variable count : integer := 0;
    begin
        if has1won = '1' or has2won = '1' then
            if rising_edge(clk) then
                if count < 5000 then
                    count := count + 1;
                else
                    count := 0;
                    gameOver <= true;
                end if;
            end if;
        else
            gameOver <= false;
            count := 0;
        end if;
    end process;
       
end V1;
