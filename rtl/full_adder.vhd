library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1bit is
  Port ( 
    i_A, i_B, i_Carry   :   in    std_logic;
    o_Sum, o_Carry      :   out   std_logic
  );
end full_adder_1bit;

architecture rtl of full_adder_1bit is
    
    signal tmp_sum : std_logic;
    
begin

    o_Sum   <=  i_A xor i_B xor i_Carry; 
    o_Carry <=  ( ( i_A xor i_B ) and i_Carry ) or ( i_A and i_B );


end rtl;
