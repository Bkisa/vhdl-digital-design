library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity alu_1bit is
    port (        
        a, b        :   in  std_logic;                      -- alu inputs
        i_carry     :   in  std_logic;                      -- carry in
        opcode      :   in  std_logic_vector(2 downto 0);   -- opcode to select operation
        o_result    :   out std_logic;                      -- result
        o_carry     :   out std_logic                       -- carry out
    );
end entity alu_1bit;


architecture rtl of alu_1bit is
    
begin
    
    process(opcode, a, b, i_carry) is
    begin
        
        o_carry <= '0';
        case opcode is
            when "000" =>   -- 1 bit full-adder
                o_result    <=  a xor b xor i_carry;
                o_carry     <=  ( a and b ) or ( (a xor b) and i_carry );
            
            when "001" =>   -- 1 bit full-subtractor
                o_result    <=  a xor b xor i_carry;
                o_carry     <=  ( (not a) and b ) or ( not (a xor b) and i_carry );

            when "010" =>   --  1 bit 'and'
                o_result    <= a and b;
            
            when "011" =>   -- 1 bit 'or'
                o_result    <= a or b;

            when "100" =>   -- 1 bit 'nor'
                o_result    <=  a nor b;
            
            when "101" =>   -- 1 bit 'xor'
                o_result    <=  a xor b;
            
            when "110" =>   -- 1 bit comparision
                if a = '0' and b = '1' then
                    o_result    <=  '1';
                else
                    o_result    <=  '0';
                end if;
            
            when "111" =>   -- 1 bit not for a
                o_result    <=  not a;
            
            when others =>
                o_result    <=  '0';

        end case;
    end process;
end architecture rtl;