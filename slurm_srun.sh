#!/bin/bash

srun --nodes=1 --partition=medium --gres=gpu:1 --cpus-per-task=4 --mem=16g --pty bash -i

source /etc/profile.d/lmod.sh
source /etc/profile.d/zz_hpcnow-arch.sh
source module load Anaconda3/2020.02
conda activate env
