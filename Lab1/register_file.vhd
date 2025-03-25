library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file is
    Port (
        clk         : in  STD_LOGIC;                          -- Clock signal
        RegWrite    : in  STD_LOGIC;                          -- Control signal to enable writing to the register file
        read_reg1   : in  STD_LOGIC_VECTOR(4 downto 0);       -- Address of the first register to read
        read_reg2   : in  STD_LOGIC_VECTOR(4 downto 0);       -- Address of the second register to read
        write_reg   : in  STD_LOGIC_VECTOR(4 downto 0);       -- Address of the register to write
        write_data  : in  STD_LOGIC_VECTOR(31 downto 0);      -- Data to write to the register
        read_data1  : out STD_LOGIC_VECTOR(31 downto 0);      -- Data read from the first register
        read_data2  : out STD_LOGIC_VECTOR(31 downto 0)       -- Data read from the second register
    );
end register_file;

architecture Behavioral of register_file is
    -- Define a 32x32 register file (32 registers, each 32 bits wide)
    type reg_array_type is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
    signal reg_array : reg_array_type := (others => (others => '0')); -- Initialize all registers to 0
begin
    -- Write operation: Updates the register file on the rising edge of the clock
    process(clk)
    begin
        if rising_edge(clk) then
            if RegWrite = '1' then
                -- Write data to the specified register
                reg_array(to_integer(unsigned(write_reg))) <= write_data;
            end if;
        end if;
    end process;

    -- Read operation: Outputs data from the register file on the falling edge of the clock
    process(clk)
    begin
        if falling_edge(clk) then
            -- Read data from the specified registers
            read_data1 <= reg_array(to_integer(unsigned(read_reg1)));
            read_data2 <= reg_array(to_integer(unsigned(read_reg2)));
        end if;
    end process;
end Behavioral;