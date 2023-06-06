# SLURM Cheatsheet

```bash
# Start session
interactive -g 1 -p high -m 16 GB
srun --nodes=1 --partition=medium --gres=gpu:1 --cpus-per-task=4 --mem=16g --pty bash -i

# Setup
source /etc/profile.d/lmod.sh
source /etc/profile.d/zz_hpcnow-arch.sh
module load Anaconda3/2020.02

## 
conda create -n env python=3.9
conda init bash
source activate env



./code tunnel

# partition details
scontrol show partition short/medium/high

# monitor user jobs
squeue -u <your_user_name>

# monitor gpu usage
watch -n 1 nvidia-smi

# install pytorch
pip install torch==1.11.0+cu102 torchvision==0.12.0+cu102 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu102


```
