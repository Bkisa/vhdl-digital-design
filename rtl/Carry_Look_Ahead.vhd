library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Carry_Look_Ahead is
    Port ( 
        i_A : in STD_LOGIC_VECTOR (7 downto 0);
        i_B : in STD_LOGIC_VECTOR (7 downto 0);
       
        o_S : out STD_LOGIC_VECTOR (8 downto 0)       
    );
end Carry_Look_Ahead;
 
architecture Behavioral of Carry_Look_Ahead is
     
    signal s_G      : std_logic_vector( 7 downto 0 );    --  Generate
    signal s_P      : std_logic_vector( 7 downto 0 );    --  Propagate
    signal s_C      : std_logic_vector( 8 downto 0 );    --  Carry
    signal s_Sum    : std_logic_vector( 7 downto 0 );
 
begin

    -- Generate Full Adders
    fa_ahead: for i in 0 to 7 generate
        fA: entity work.full_adder_1bit(rtl)
        port map(
            i_A     => i_A(i),
            i_B     => i_B(i),
            i_Carry => s_C(i),
            o_Sum   => s_Sum(i),
            o_carry => OPEN
        );
    end generate;
    
    -- Generate (G) : Gi = Ai * Bi
    -- Generate (P) : Pi = Ai + Bi;
    -- Generate Carry
    GEN_PGS: for k in 0 to 7 generate
        s_G(k)      <= i_A(k) and i_B(k);
        s_P(k)      <= i_A(k) or i_B(k);
        s_C(k+1)    <= s_G(k) or ( s_P(k) and s_C(k) );
    end generate;

    s_C(0) <= '0';
    
    o_S <= s_C(7) & s_Sum;               
    
 
end Behavioral;