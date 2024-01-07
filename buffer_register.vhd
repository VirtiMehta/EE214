library ieee;
use ieee.std_logic_1164.all;


entity buffer_register is
port (
A: in std_logic_vector(7 downto 0);
clock: in std_logic;
R : in std_logic;
E: in std_logic;
op : out std_logic_vector(23 downto 0) );

end buffer_register;

architecture bla_of_buffer_register of buffer_register is 


component register_block is
port (
A: in std_logic_vector( 7 downto 0);
clock: in std_logic;
R : in std_logic;
E: in std_logic;
op: out std_logic_vector( 7 downto 0)
);
end component;
type w_array is array(0 to 127) of std_logic_vector(7 downto 0);
signal what_array : w_array;
begin

--gate1: register_block port map ( A => A  , clock=> clock, R => R , E => E, op =>  what0 );
--gate2: register_block port map ( A => what0  , clock=> clock, R => R , E => E, op =>  what1 );
--gate3: register_block port map ( A => what1  , clock=> clock, R => R , E => E, op =>  what2 );
--gate4: register_block port map ( A => what2  , clock=> clock, R => R , E => E, op =>  what3 );
--gate5: register_block port map ( A => what3  , clock=> clock, R => R , E => E, op =>  what4 );
--gate6: register_block port map ( A => what4  , clock=> clock, R => R , E => E, op =>  what5 );
--gate7: register_block port map ( A => what5  , clock=> clock, R => R , E => E, op =>  what6 );
--gate8: register_block port map ( A => what6  , clock=> clock, R => R , E => E, op =>  what7 );
--
--op <= what7;
reg: for i in 0 to 127 generate
blk: if i = 0 generate 
    gate1: register_block port map (A => A, clock => clock, R => R, E => E, op => what_array(i));
    end generate blk;
dlk:if i> 0 and i<128 generate
    gate2: register_block port map (A => what_array(i-1), clock => clock, R => R, E => E, op => what_array(i));
  end generate dlk;
 end generate;

  -- Assign the final output
  op <= what_array(125)&what_array(126)&what_array(127);
end bla_of_buffer_register;
