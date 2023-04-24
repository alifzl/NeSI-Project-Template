#!/bin/bash -e
#SBATCH --job-name=YOUR_JOB_NAME        # job name
#SBATCH --account=YOUR_PROJECT_ID       # Project Account
#SBATCH --time=0-30:00:00               # Walltime
#SBATCH --gpus-per-node=A100:1          # GPU resources required per node
#SBATCH --cpus-per-task 4               # 4 CPUs per GPU
#SBATCH --mem 50G                       # 50G per GPU
#SBATCH --partition gpu                 # Must be run on GPU partition.
#SBATCH --mail-type=ALL
#SBATCH --mail-user=a.fazeli95@gmail.com

# load modules
module purge
module load CUDA/11.6.2
module load Miniconda3/22.11.1-1
source $(conda info --base)/etc/profile.d/conda.sh
export PYTHONNOUSERSITE=1

# display information about the available GPUs
nvidia-smi

# check the value of the CUDA_VISIBLE_DEVICES variable
echo "CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES}"

# activate conda environment
conda deactivate
conda activate ./venv
which python

# optional, used to peek under NCCL's hood
export NCCL_DEBUG=INFO 

# start training script

srun python main.py