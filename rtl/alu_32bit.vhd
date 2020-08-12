library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_32bit is
    generic (
        WIDTH   :   positive := 32
    );
    port (
        a, b        :   in  std_logic_vector(WIDTH -1 downto 0);        -- alu inputs
        i_carry     :   in  std_logic;                                  -- carry in
        opcode      :   in  std_logic_vector(2 downto 0);               -- opcode to select operation
        o_result    :   out std_logic_vector(WIDTH -1 downto 0);        -- result
        o_carry     :   out std_logic                                   -- carry out
    );
end entity alu_32bit;


architecture rtl of alu_32bit is
    
    signal s_carry      :   std_logic_vector(WIDTH downto 0) := (others => '0');
    signal s_result     :   std_logic_vector(WIDTH -1 downto 0) := (others => '0');     

begin

    s_carry(0) <= i_carry;
    
    alu_gen: for i in 0 to WIDTH-1 generate
        alu_32bits: entity work.alu_1bit(rtl)
            port map (
                a           =>  a(i),
                b           =>  b(i),
                i_carry     =>  s_carry(i),
                opcode      =>  opcode,
                o_result    =>  s_result(i),
                o_carry     =>  s_carry(i+1)
            );
    end generate;

    o_carry <=  not s_carry(WIDTH) when opcode = "001" else s_carry(WIDTH);

    process(a, b, opcode, s_result)
    begin
        case opcode is
            when "110" =>
                if a < b then
                    o_result    <=  (0 => '1', others => '0');
                else
                    o_result    <=  (others => '0');
                end if;
            when others =>
                o_result    <=  s_result;
        end case;
    end process;   
end architecture rtl;