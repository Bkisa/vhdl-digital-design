library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_adder4 is
end entity tb_adder4;

architecture behavioral of tb_adder4 is
    
    signal  a, b        :  std_logic_vector(3 downto 0);
    signal  s           :  std_logic_vector(3 downto 0);
    signal  cin, cout   :   std_logic;

begin

    adder4_0:   entity work.adder4(rtl)
        port map (
            a       =>  a,
            b       =>  b,
            s       =>  s,
            cin     =>  cin,
            cout    =>  cout
        );
    
    process
    begin
        wait for 100 ns;
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                a   <=  std_logic_vector(to_unsigned(i, 4));
                b   <=  std_logic_vector(to_unsigned(j, 4));
                wait for 1 ns;
                cin <=  '1';
                wait for 1 ns;
                cin <=  '0';
            end loop;
        end loop;
        wait for 10 ns;
        wait;
    end process;
    
end architecture behavioral;