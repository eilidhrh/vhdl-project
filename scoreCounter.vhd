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
--Keeps track of who has won and when the game is being reset after someone has one
signal has1won : boolean := false;
signal has2won : boolean := false;
signal gameOver : boolean := false;

begin
    
    --This counts the player 1 score
    --It also resets it when someone wins or the reset button is pressed
    --It also changes w1 to high when player 1 wins, which will alert the LED display entity
    count1: process(reset, p1, gameOver)
    subtype bit5 is integer range 0 to 31;
    variable intS1 : bit5 := 0;

    begin
        if reset = '1' or gameOver = true then
            intS1 := 0;
            w1 <= '0';
            has1won <= false;
        elsif p1 = '1' then
            if intS1 = 20 and has2won = false then
                intS1 := intS1 + 1;
                w1 <= '1';
                has1won <= true;
            elsif intS1 < 20 then
                intS1 := intS1 + 1;
            end if;
        end if;
        
        s1 <= std_logic_vector(to_unsigned(intS1, 5));
        
    end process;
    
    --This counts the player 2 score
    --It also resets it when someone wins or the reset button is pressed
    --It also changes w2 to high when player 2 wins, which will alert the LED display entity
    count2: process(reset, p2, gameOver)
    subtype bit5 is integer range 0 to 31;
    variable intS2 : bit5 := 0;
    
    begin
        if reset = '1' or gameOver = true then
            intS2 := 0;
            w2 <= '0';
            has2won <= false;
        elsif p2 = '1' then
            if intS2 = 20 and has1won = false then
                intS2 := intS2 + 1;
                w2 <= '1';
                has2won <= true;
            elsif intS2 < 20 then
                intS2 := intS2 + 1;
            end if;
        end if;
        
        s2 <= std_logic_vector(to_unsigned(intS2, 5));
        
    end process;
    
    
    --When someone wins this counts to 5 seconds
    --It then sends a command to the other processes to reset
    gameIsOver : process(has1won, has2won, clk)
    variable count : integer := 0;
    begin
        if has1won = true or has2won = true then
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
        end if;
    end process;
       
end V1;
