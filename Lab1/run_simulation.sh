#!/bin/bash

# Ensure the build directory exists
prepare_build_directory() {
    mkdir -p build
}

# Function to compile VHDL files
compile() {
    prepare_build_directory
    echo "Compiling VHDL files..."
    ghdl -a --workdir=build register_file.vhd tb_register_file.vhd

    echo "Elaborating the testbench..."
    ghdl -e --workdir=build tb_register_file
}

# Function to check if files are compiled
check_compilation() {
    if [ ! -f build/tb_register_file ]; then
        echo "Compiled files not found. Compiling now..."
        compile
    else
        echo "Compiled files found. Skipping compilation."
    fi
}

# Function to run the simulation
run_simulation() {
    check_compilation
    echo "Running the simulation..."
    ghdl -r --workdir=build tb_register_file --vcd=build/wave.vcd

    open_waveform

    echo "Simulation complete."
}

# Function to open waveform
open_waveform() {
    if [ -f build/wave.vcd ]; then
        echo "Opening waveform in GTKWave..."
        gtkwave build/wave.vcd
    else
        echo "Waveform file 'build/wave.vcd' not found. Please run the simulation first."
    fi
}

# Function to clean up generated files
clean() {
    echo "Cleaning up generated files..."
    rm -rf build
    echo "Cleanup complete."
}

# Function to display help
show_help() {
    echo "Usage:"
    echo "  ./run_simulation.sh                 # Run full simulation and open waveform"
    echo "  ./run_simulation.sh --simulate      # Run simulation only"
    echo "  ./run_simulation.sh --waveform      # Open waveform only if it exists"
    echo "  ./run_simulation.sh --clean         # Clean up generated files"
    echo "  ./run_simulation.sh --help          # Display this help message"
}

# Main script logic
if [ "$#" -eq 0 ]; then
    # No arguments provided, run full simulation
    compile
    run_simulation
elif [ "$1" == "--simulate" ]; then
    # Run simulation only
    run_simulation
elif [ "$1" == "--waveform" ]; then
    # Open waveform only
    open_waveform
elif [ "$1" == "--clean" ]; then
    # Clean up generated files
    clean
elif [ "$1" == "--help" ]; then
    # Display help
    show_help
else
    echo "Invalid argument. Use --help for usage instructions."
fi
