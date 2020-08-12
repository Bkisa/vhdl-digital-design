library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addsub4 is
    port (
        a, b    :   in  std_logic_vector(3 downto 0);   --  4-bits input
        m       :   in  std_logic;                      --  adder / subtractor select bit
        s       :   out std_logic_vector(3 downto 0);   --  sum output
        v, cout :   out std_logic                       --  v is overflow
    );
end entity addsub4;


architecture rtl of addsub4 is
    
    signal bt, bt2, bt_temp   :   std_logic_vector(3 downto 0)    := (others => '0');

begin

    sub: for i in 0 to 3 generate
        begin
           bt(i) <= b(i) xor m;                      
       end generate;


    add4:   entity  work.adder4(rtl)
        port map (
            a   =>  a,
            b   =>  bt,
            cin =>  m,
            s   =>  s,
            v   =>  v,
            cout    =>  cout
        );
    
    
    
end architecture rtl;