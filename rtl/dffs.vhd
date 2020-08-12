library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dff is
    generic (
        WIDTH : positive
    );

    Port ( 
        din     : in std_logic_vector(WIDTH -1 downto 0);
        clk     : in std_logic;
        rest_1  : in std_logic;
        dout    : out std_logic_vector(WIDTH -1 downto 0)
    );
end dff;

architecture Behavioral of dff is
    signal zeros : std_logic_vector(WIDTH -1 downto 0) := (others => '0');
begin

    process (clk, rest_1)
    begin           
    if rest_1 = '0' then
        dout(WIDTH -1 downto 0) <= zeros;
    elsif rising_edge(clk) then
            dout(WIDTH -1 downto 0) <= din(WIDTH-1 downto 0);
    end if;    
    end process;

end Behavioral;






library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dffs is
    generic (
        WIDTH : positive
    );

    Port ( 
        din     : in std_logic_vector(WIDTH -1 downto 0);
        clk     : in std_logic;
        en      : in std_logic;
        rest_1  : in std_logic;
        dout    : out std_logic_vector(WIDTH -1 downto 0)
    );
end dffs;

architecture Behavioral of dffs is
    signal s_dout,s_temp : std_logic_vector(WIDTH -1 downto 0);
begin

    dout <= s_dout;
    
    with en select
    s_temp <= din when '0', 
              s_dout when '1';

    dffs0: entity work.dff(Behavioral)
        generic map(WIDTH => WIDTH)
        port map (
            
            din => s_temp,
            clk => clk,
            rest_1 => rest_1,
            dout => dout
        );

end Behavioral;
