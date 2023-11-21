# How to set up a conda env on HPC

## SSH Login
username@hpc.s.upf.edu
**********************

### Start session from the login shell
There are 3 option to start an interactive session from which we can install the necessary packages and run our code.

```bash
interactive -g 1 -p high -c 4  -m 16 GB --pty bash -i
salloc --nodes=1 --partition=high --gres=gpu:tesla:1 --cpus-per-task=4 --mem=16g
srun --nodes=1 --partition=high --gres=gpu:tesla:1 --cpus-per-task=4 --mem=16g --pty bash -i
```

## Load basic modules
Lmod is the software that manages module loading on the HPC. It is already installed and configured on the HPC. 
But first we need to initialize it:

```bash
source /etc/profile.d/lmod.sh
source /etc/profile.d/zz_hpcnow-arch.sh
```

Then we can load the Anaconda module:

```bash
module load Anaconda3/2020.02
```

## Create a conda environment 
```bash
conda create -n myenv python=3.9
conda init bash
conda activate myenv
```

In some cases we can now use pip to install packages inside the conda env.
Execute this while your newly created conda env is activated.

```bash
pip install -r requirements.txt 
```

**Avoid modifying or installing packages in the (base) environment**


## Other conda commands as memo:

```bash
conda install -c conda-forge 

conda config --set channel_priority flexible
```

## SLURM commands

### partition details
scontrol show partition short/medium/high

### monitor user jobs
squeue -u <your_user_name>

### job details
scontrol show job <job_id>

### monitor gpu usage
watch -n 1 nvidia-smi


curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz

tar -xf vscode_cli.tar.gz

./code

./code tunnel

configs_dir="models/configs"

for config in "$configs_dir"/*.yaml; do
    printf "Training config: %s\n" "$config"
    
    python main.py train --init "$config"
    
    printf "Done.\n\n"
done