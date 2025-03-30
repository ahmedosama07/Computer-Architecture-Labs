library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_register_file is
end tb_register_file;

architecture Behavioral of tb_register_file is
    -- Testbench signals
    signal clk          : STD_LOGIC := '0';                  -- Clock signal
    signal RegWrite     : STD_LOGIC := '0';                  -- Control signal to enable writing
    signal read_reg1    : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Address of the first register to read
    signal read_reg2    : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Address of the second register to read
    signal write_reg    : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Address of the register to write
    signal write_data   : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- Data to write
    signal read_data1   : STD_LOGIC_VECTOR(31 downto 0);     -- Data read from the first register
    signal read_data2   : STD_LOGIC_VECTOR(31 downto 0);     -- Data read from the second register
    
    constant CLK_PERIOD : time := 10 ns;                     -- Clock period (100 MHz)
begin
    -- Instantiate the register file (Unit Under Test)
    uut: entity work.register_file
        port map (
            clk => clk,
            RegWrite => RegWrite,
            read_reg1 => read_reg1,
            read_reg2 => read_reg2,
            write_reg => write_reg,
            write_data => write_data,
            read_data1 => read_data1,
            read_data2 => read_data2
        );

    -- Clock generation process
    clk_process: process
    begin
        -- Generate a clock signal with a 50% duty cycle
        while now < CLK_PERIOD * 6 loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process: Defines test cases to verify the functionality of the register file
    stim_proc: process
    begin
        -- Test Case 1: Write to register 5 and verify read
        RegWrite <= '1';                -- Enable writing
        write_reg <= "00101";           -- Write to register 5
        write_data <= X"12345678";      -- Data to write
        read_reg1 <= "00101";           -- Read from register 5
        read_reg2 <= "00101";           -- Read from register 5
        wait until falling_edge(clk);   -- Wait for falling edge of the clock
        wait for 0 ns;                  -- Allow signals to update
        assert read_data1 = X"12345678" and read_data2 = X"12345678"
            report "Test Case 1 Failed: Write/read mismatch for reg 5" severity error;

        -- Test Case 2: Attempt to write with RegWrite=0 (no write should occur)
        RegWrite <= '0';                -- Disable writing
        write_data <= X"87654321";      -- New data (should not be written)
        wait until falling_edge(clk);
        wait for 0 ns;
        assert read_data1 = X"12345678" and read_data2 = X"12345678"
            report "Test Case 2 Failed: Unintended write during RegWrite=0" severity error;

        -- Test Case 3: Verify initial state of registers 0 and 1 (both should be 0)
        read_reg1 <= "00000";           -- Read from register 0
        read_reg2 <= "00001";           -- Read from register 1
        wait until falling_edge(clk);
        wait for 0 ns;
        assert read_data1 = X"00000000" and read_data2 = X"00000000"
            report "Test Case 3 Failed: Registers not initialized to 0" severity error;

        -- Test Case 4: Verify $zero is read-only and always returns 0
        RegWrite <= '1';                -- Enable writing
        write_reg <= "00000";           -- Write to register 0
        write_data <= X"BEEEEEEB";      -- Data to write
        read_reg1 <= "00000";           -- Read from register 0
        wait until falling_edge(clk);
        wait for 0 ns;
        assert read_data1 = X"00000000"
            report "Test Case 4 Failed: $zero modified by write" severity error;

        -- Test Case 5: Verify $zero works alongside other registers
        write_reg <= "00001";            -- Write to reg 1
        write_data <= X"DEADBEAF";
        read_reg1 <= "00000";            -- Read $zero
        read_reg2 <= "00001";            -- Read reg 1
        wait until falling_edge(clk);
        wait for 0 ns;
        assert read_data1 = X"00000000" and read_data2 = X"DEADBEAF"
            report "Test Case 5 Failed: $zero or reg 1 malfunction" severity error;

        -- Finish simulation
        REPORT "Simulation completed."; -- Indicate simulation completion
        wait;
    end process;
end Behavioral;