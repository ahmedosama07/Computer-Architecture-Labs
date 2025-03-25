library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file is
    Port (
        clk         : in  STD_LOGIC;
        RegWrite    : in  STD_LOGIC;
        read_reg1   : in  STD_LOGIC_VECTOR(4 downto 0);
        read_reg2   : in  STD_LOGIC_VECTOR(4 downto 0);
        write_reg   : in  STD_LOGIC_VECTOR(4 downto 0);
        write_data  : in  STD_LOGIC_VECTOR(31 downto 0);
        read_data1  : out STD_LOGIC_VECTOR(31 downto 0);
        read_data2  : out STD_LOGIC_VECTOR(31 downto 0)
    );
end register_file;

architecture Behavioral of register_file is
    type reg_array_type is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
    signal reg_array : reg_array_type := (others => (others => '0')); -- Initialize to 0
begin
    -- Write operation (on rising edge)
    process(clk)
    begin
        if rising_edge(clk) then
            if RegWrite = '1' then
                reg_array(to_integer(unsigned(write_reg))) <= write_data;
            end if;
        end if;
    end process;

    -- Read operation (on falling edge)
    process(clk)
    begin
        if falling_edge(clk) then
            read_data1 <= reg_array(to_integer(unsigned(read_reg1)));
            read_data2 <= reg_array(to_integer(unsigned(read_reg2)));
        end if;
    end process;
end Behavioral;