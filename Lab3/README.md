# Using GPU in Matrix Operations

This Lab compares the performance of matrix operations (multiplication and addition) between CPU and GPU implementations using CUDA and PyCUDA. The lab includes CUDA kernel implementations, CPU/GPU execution time comparisons, and visualization of speedup factors.

## Files in the Project

### 1. `GPU_lab.ipynb`
Jupyter notebook containing:
- CUDA kernel implementations for matrix multiplication and addition
- CPU vs GPU performance comparison functions
- Performance testing across matrix sizes (64x64 to 1024x1024)
- Execution time and speedup factor visualizations
- Verification of computation results between CPU and GPU

## Key Findings
- GPU shows significant speedup (2.09x) over CPU for 1024x1024 matrices
- CPU performs better for smaller matrices (<256x256)
- Results validation ensures computational accuracy between implementations

## Dependencies

- Python 3.x
- Jupyter Notebook
- PyCUDA
- numpy
- matplotlib
- CUDA-compatible GPU with drivers installed

## How to Run

### Local Execution with pip
1. **Install dependencies**:
```bash
pip install pycuda numpy matplotlib jupyter
```
2. **Ensure CUDA toolkit is installed** and compatible with your GPU
3. **Launch Jupyter Notebook:**
```bash
jupyter notebook GPU_lab.ipynb
```
### Using Conda
1. **Create and activate conda environment:**
```bash
conda create -n gpu-lab python=3.9
conda activate gpu-lab
```
2. **Install dependencies:**
```bash
conda install numpy matplotlib jupyter
pip install pycuda
```
3. **Launch Jupyter Notebook:**
```bash
jupyter notebook GPU_lab.ipynb
```

### Using Google Colab
1. **Upload notebook to Colab:**
    - Open [Google Colab](https://colab.research.google.com/)
    - Click "File" > "Upload notebook"
    - Select `GPU_lab.ipynb`
2. **Enable GPU acceleration:**
    - Runtime > Change runtime type
    - Select "GPU" under Hardware accelerator
3. **Install PyCUDA:**
```bash
!pip install pycuda
!sudo apt-get install nvidia-cuda-toolkit
%env CUDA_ROOT=/usr/bin
```
