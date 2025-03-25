# Register File Implementation and Testbench

This project implements a 32x32 register file in VHDL and provides a testbench to verify its functionality. The register file is a critical component in computer architecture, used to store and retrieve data during instruction execution.

## Files in the Project

### 1. `register_file.vhd`
This file contains the VHDL implementation of the register file. It supports:
- **Write Operation**: Data is written to a specified register on the rising edge of the clock when the `RegWrite` signal is enabled.
- **Read Operation**: Data is read from two specified registers on the falling edge of the clock.

### 2. `tb_register_file.vhd`
This file contains the testbench for the register file. It verifies the functionality of the register file through several test cases:
- Writing to a register and reading it in the same cycle.
- Ensuring no write occurs when `RegWrite` is disabled.
- Reading from registers initialized to zero.
- Writing to and reading from register 0.

### 3. `run_simulation.sh`
This shell script automates the simulation process using GHDL and GTKWave. It supports:
- Running the full simulation (compilation, elaboration, simulation, and waveform generation).
- Opening the waveform file (`build/wave.vcd`) in GTKWave if it exists.
- Cleaning up generated files.
- Displaying help information.

## Dependencies

To use the `run_simulation.sh` script, ensure the following tools are installed on your system:

1. **GHDL**: A VHDL simulator for compiling, elaborating, and running VHDL code.
   - Installation instructions: [GHDL Installation Guide](https://ghdl.github.io/ghdl/).
2. **GTKWave**: A waveform viewer for analyzing simulation results.
   - Installation instructions: [GTKWave Installation Guide](http://gtkwave.sourceforge.net/).

Ensure both tools are added to your system's PATH so they can be accessed from the terminal.

## How to Run the Simulation

### Using the Shell Script

1. **Run Full Simulation**:
   ```bash
   ./run_simulation.sh
   ```
   This will:
   - Compile the VHDL files.
   - Elaborate the testbench.
   - Run the simulation and generate a waveform file (`build/wave.vcd`).
   - Open the waveform in GTKWave for analysis.

2. **Run Simulation Only**:
   ```bash
   ./run_simulation.sh --simulate
   ```
   This will:
   - Compile the VHDL files (if not already compiled).
   - Run the simulation and generate a waveform file (`build/wave.vcd`).

3. **Open Waveform Only**:
   ```bash
   ./run_simulation.sh --waveform
   ```
   This will:
   - Check if the waveform file (`build/wave.vcd`) exists.
   - Open it in GTKWave if it exists. If not, the script will notify you to run the simulation first.

4. **Clean Up Generated Files**:
   ```bash
   ./run_simulation.sh --clean
   ```
   This will:
   - Remove all generated files, including the compiled testbench and waveform file, from the `build` directory.

5. **Display Help**:
   ```bash
   ./run_simulation.sh --help
   ```
   This will:
   - Display usage instructions for the script.

### Manual Steps

1. **Open a VHDL Simulation Tool**: Use a tool like ModelSim, Vivado, or GHDL.
2. **Compile the Files**:
   - Compile `register_file.vhd` to create the register file entity.
   - Compile `tb_register_file.vhd` to create the testbench.
3. **Run the Simulation**:
   - Execute the testbench (`tb_register_file`) to simulate the register file.
   - Observe the output in the waveform viewer or console logs.
4. **Verify the Results**:
   - Ensure all assertions in the testbench pass without errors.
   - Check the console for the message: `Simulation completed.`

## Project Structure

```
Lab1/
├── register_file.vhd       # Register file implementation
├── tb_register_file.vhd    # Testbench for the register file
├── run_simulation.sh       # Script to automate simulation and waveform viewing
├── README.md               # Project documentation
├── build/                  # Directory for generated files (created automatically)
```

## Key Features

- **32 Registers**: Each register is 32 bits wide.
- **Synchronous Write**: Data is written on the rising edge of the clock.
- **Asynchronous Read**: Data is read on the falling edge of the clock.
- **Testbench**: Comprehensive test cases to validate the design.
- **Automation**: Shell script for running simulations, viewing waveforms, cleaning up files, and displaying help.