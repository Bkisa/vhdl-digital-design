library IEEE;
use IEEE.std_logic_1164.all;


entity adder4 is
    port (
        a, b        : in std_logic_vector(3 downto 0);      -- a, b are 4-bits input
        cin         : in std_logic;                         -- cin is carry-in
        s           : out std_logic_vector(3 downto 0);     -- s is sum output
        v, cout     : out std_logic                         -- v is overflow, count is carry out
    );
end entity adder4;

architecture rtl of adder4 is
 
    signal c : std_logic_vector(3 downto 0) := (others => '0');

begin

    
    f_ad:for i in 0 to 3 generate
        f_adder: entity work.full_adder(rtl)
            port map ( a => a(i), b => b(i), cin => cin,  s => s(i), cout => c(i) );
    end generate;

--    f0 : entity work.full_adder(rtl)
 --       port map ( a => a(0), b => b(0), cin => cin,  s => s(0), cout => c(0) );
 --   f1 : entity work.full_adder(rtl)
 --       port map ( a => a(1), b => b(1), cin => c(0), s => s(1), cout => c(1) );
 --   f2 : entity work.full_adder(rtl)
   --     port map ( a => a(2), b => b(2), cin => c(1), s => s(2), cout => c(2) );
   -- f3 : entity work.full_adder(rtl)
     --   port map ( a => a(3), b => b(3), cin => c(2), s => s(3), cout => c(3) );
    
    cout <= c(3);
    v    <= c(2) xor c(3);
    
    
end architecture rtl;

