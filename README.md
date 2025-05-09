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

1. **VHDL Labs (Lab1)**:
   - GHDL (VHDL simulator)
   - GTKWave (Waveform viewer)

2. **GPU Performance Lab (Lab3)**:
   - Python 3.x + Jupyter
   - PyCUDA + CUDA Toolkit (minimum version 11.0)
   - NVIDIA GPU with compute capability 3.0+ (e.g., GTX 600 series or newer)
   - Compatible NVIDIA drivers (minimum version 450.80)

## Directory Structure

```
Labs/
├── Lab1/                       # Register file implementation
│   ├── register_file.vhd       # Implementation file
│   ├── tb_register_file.vhd    # Testbench for the implementation
│   ├── run_simulation.sh       # Script to automate simulation and waveform viewing
│   ├── README.md               # Documentation for Lab1
│   └── build/                  # Directory for generated files (created automatically)
├── Lab3/                       # GPU vs CPU performance comparison
│ ├── GPU_lab.ipynb             # CUDA/Python analysis notebook
│ └── README.md                 # Documentation for Lab3
│
└── README.md # Main documentation
```
