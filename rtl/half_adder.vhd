library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
port (
    x : in  std_logic;  -- x, y are inputs of the adder
    y : in  std_logic;
    s : out std_logic;
    c : out std_logic
    -- s (sum), c (carry) are outputs of the adder
);
end half_adder;


architecture rtl of half_adder is
    
begin
    
    s <= x xor y;
    c <= x and y;
    
    
end architecture rtl;