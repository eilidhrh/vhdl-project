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
		while now <= 3000ns loop
			clk <= '1';
			wait for 5 ns;
			clk <= '0';
			wait for 5 ns;	
		end loop;
		wait;
	end process;

stimuli: process
	begin
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 2 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='1'; p2btn<='0'; reset<='0'; wait for 5 ns;
	p1btn<='0'; p2btn<='0'; reset<='0'; wait for 5 ns;
	
	reset<='1'; wait for 30 ns;
	reset<='0'; wait for 10 ns;
	
	
	wait;
	end process;


DUT: badmintonScore port map(p1btn=>p1btn, p2btn=>p2btn, anode=>anode, segments=>segments, LEDs=>LEDs, reset=>reset, clk=>clk);


end Behavioral;
