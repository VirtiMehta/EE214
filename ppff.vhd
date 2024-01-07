library ieee;
use ieee.std_logic_1164.all;
entity ppff is
   port (J,K,E,R,P,clock: in std_logic; Q: out std_logic);
end entity ppff;


architecture behav of ppff is
begin
jk: process (J,K,E,R,P,clock)
variable V1 : std_logic:='0'; 
begin

if(R='1')then 
Q <='0'; 
elsif (P='1') then
Q <= '1' ;
elsif ( E ='1') then 
  if(clock'event and (clock='1'))then 
  if (J='0' and K='0') then
  Q<= V1;
  V1 := V1;
  elsif (J='1' and K='0') then
  Q<= '1';
  V1:='1';
  elsif (J='0' and K='1') then
  Q<= '0';
  V1 := '0';
  elsif (J='1' and K='1') then
  Q<= (not V1);
  V1 := (not V1);
  end if;
  end if; 
end if ;

end process ;
end behav;
  
  