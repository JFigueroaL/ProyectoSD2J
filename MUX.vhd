library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Mux is
	generic ( n: integer:=2);--<-- nbits
	port (
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);
		sel : in std_logic;
		Q : out std_logic_vector(1 downto 0));
end Mux;

--Architecture
architecture solve of Mux is
	-- Signals,Constants,Variables,Components
	signal f: std_logic_vector(1 downto 0);
	begin
		with sel select 
		f<= A when '0',
			 B when '1';
		Q<= f;	 
end solve;