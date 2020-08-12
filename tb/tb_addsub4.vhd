library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_addsub4 is
end entity tb_addsub4;

architecture behavioral of tb_addsub4 is
    
    signal a, b     :   std_logic_vector(3 downto 0);
    signal  m       :   std_logic_vector(0 downto 0);
    signal  sum     :   std_logic_vector(3 downto 0);
    signal  v, cout :   std_logic;

begin

    as4: entity work.addsub4(rtl)
        port map (
            a       =>  a,
            b       =>  b,
            m       =>  m(0),
            s       =>  sum,
            v       =>  v,
            cout    =>  cout
        );
    
    process
    begin
        wait for 100 ns;
        for sel in 0 to 1 loop
            m <= std_logic_vector(to_unsigned(sel, 1));
            for i in 0 to 15 loop
                for j in 0 to 15 loop
                    a <= std_logic_vector(to_unsigned(i, 4));
                    b <= std_logic_vector(to_unsigned(j, 4));
                    wait for 1 ns;
                end loop;
            end loop;
            wait for 10 ns;
        end loop;
        wait;
    end process;
    
end architecture behavioral;