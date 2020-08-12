library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_8bit_ripple is
  Port (
    i_A, i_B             :   in  std_logic_vector( 7 downto 0 );
    i_Carry              :   in  std_logic;
    o_Carry              :   out  std_logic;
    o_Sum                :   out std_logic_vector( 7 downto 0 )   
   );
end FA_8bit_ripple;

architecture Behavioral of FA_8bit_ripple is
    
    signal s_carry : std_logic_vector( 7 downto 0 );

begin

    
    fa0: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(0), i_B => i_B(0), i_Carry => i_Carry, o_Sum => o_Sum(0), o_Carry => s_carry(0) );
    fa1: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(1), i_B => i_B(1), i_Carry => s_carry(0), o_Sum => o_Sum(1), o_Carry => s_carry(1) );   
    fa2: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(2), i_B => i_B(2), i_Carry => s_carry(1), o_Sum => o_Sum(2), o_Carry => s_carry(2) );
    fa3: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(3), i_B => i_B(3), i_Carry => s_carry(2), o_Sum => o_Sum(3), o_Carry => s_carry(3) );   
    fa4: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(4), i_B => i_B(4), i_Carry => s_carry(3), o_Sum => o_Sum(4), o_Carry => s_carry(4) );    
    fa5: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(5), i_B => i_B(5), i_Carry => s_carry(4), o_Sum => o_Sum(5), o_Carry => s_carry(5) );    
    fa6: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(6), i_B => i_B(6), i_Carry => s_carry(5), o_Sum => o_Sum(6), o_Carry => s_carry(6) );    
    fa7: entity work.full_adder_1bit(rtl)
        port map ( 
            i_A => i_A(7), i_B => i_B(7), i_Carry => s_carry(6), o_Sum => o_Sum(7), o_Carry => s_carry(7) );    
    
    o_Carry <= s_carry(7);

end Behavioral;
