library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
  generic (WIDTH2 : positive := 32);
  Port ( 
        din_1     : in std_logic_vector(WIDTH2 -1 downto 0);
        clk     : in std_logic;
        en      : in std_logic;
        rest_1  : in std_logic;
        dout    : out std_logic_vector(WIDTH2 -1 downto 0)
    );
end top;

architecture Behavioral of top is
    
    signal s_din, s_dout : std_logic_vector(WIDTH2 -1 downto 0);
    
begin

    dff32: entity  work.dffs(Behavioral)
        generic map (
            WIDTH => WIDTH2
        )        
        port map (            
            din => din_1,
            clk => clk,
            rest_1 => rest_1,
            dout => dout,
            en => en
        );

end Behavioral;
