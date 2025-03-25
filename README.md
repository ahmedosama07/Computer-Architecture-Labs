# Computer Architecture Labs

This repository contains implementations and testbenches for various computer architecture labs. Each lab focuses on a specific component or concept in computer architecture, providing both theoretical and practical insights. Labs may use different programming or hardware description languages depending on the requirements.

## Lab Structure

Each lab is organized into its own directory and includes the following:

- **Implementation Files**: Code or hardware description files for the component being studied (e.g., VHDL, Verilog, or other languages).
- **Testbenches**: Test cases to verify the functionality of the components.
- **Simulation Scripts**: Shell scripts or other automation tools to run simulations and analyze results.
- **Documentation**: A `README.md` file in each lab directory explaining the purpose, usage, and structure of the lab.

## How to Use

1. Navigate to the specific lab directory (e.g., `Lab1`).
2. Follow the instructions in the lab's `README.md` file to run simulations or execute the code and analyze results.

## Tools Required

The tools required depend on the specific lab. Common tools include:

1. **GHDL**: A VHDL simulator for compiling and running VHDL code.
2. **GTKWave**: A waveform viewer for analyzing simulation results.

## Directory Structure

```
Labs/
├── Lab1/
│   ├── register_file.vhd       # Implementation file (e.g., VHDL)
│   ├── tb_register_file.vhd    # Testbench for the implementation
│   ├── run_simulation.sh       # Script to automate simulation and waveform viewing
│   ├── README.md               # Documentation for Lab1
│   └── build/                  # Directory for generated files (created automatically)
├── Lab2/
│   ├── implementation.py       # Example of a Python implementation
│   ├── test_cases.py           # Test cases for the implementation
│   ├── README.md               # Documentation for Lab2
├── .gitignore                  # Git ignore rules for the repository
└── README.md                   # General documentation for the labs
```
