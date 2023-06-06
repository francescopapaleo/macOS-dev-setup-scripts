# SLURM Cheatsheet

```bash
# Start session
interactive -g 1 -p high -m 16 GB -c 4 --pty bash -i

srun --nodes=1 --partition=medium --gres=gpu:1 --cpus-per-task=8 --mem=32g --pty bash -i

# Setup
source /etc/profile.d/lmod.sh
source /etc/profile.d/zz_hpcnow-arch.sh
module load Anaconda3/2020.02

eval "$(conda shell.bash hook)"

conda create -n env python=3.9

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

conda config --set channel_priority flexible


Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: | 
The environment is inconsistent, please check the package plan carefully
The following packages are causing the inconsistency:

  - defaults/linux-64::libstdcxx-ng==11.2.0=h1234567_1
  - defaults/linux-64::jinja2==3.1.2=py310h06a4308_0
  - defaults/linux-64::mpc==1.1.0=h10f8cd9_1
  - defaults/linux-64::zlib==1.2.13=h5eee18b_0
  - pytorch/linux-64::torchaudio==2.0.2=py310_cpu
  - defaults/linux-64::libgcc-ng==11.2.0=h1234567_1
  - defaults/linux-64::tbb==2021.8.0=hdb19cb5_0
  - defaults/linux-64::wheel==0.38.4=py310h06a4308_0
  - defaults/linux-64::mkl-service==2.4.0=py310h5eee18b_1
  - defaults/linux-64::mpmath==1.3.0=py310h06a4308_0
  - pytorch/linux-64::pytorch==2.0.1=py3.10_cpu_0
  - defaults/linux-64::numpy==1.25.2=py310h5f9d8c6_0
  - defaults/linux-64::gmp==6.2.1=h295c915_3
  - defaults/linux-64::sympy==1.11.1=py310h06a4308_0
  - defaults/linux-64::xz==5.4.2=h5eee18b_0
  - defaults/linux-64::ncurses==6.4=h6a678d5_0
  - defaults/linux-64::sqlite==3.41.2=h5eee18b_0
  - defaults/linux-64::mkl_fft==1.3.6=py310h1128e8f_1
  - defaults/linux-64::markupsafe==2.1.1=py310h7f8727e_0
  - defaults/linux-64::libffi==3.4.4=h6a678d5_0
  - defaults/linux-64::openssl==3.0.10=h7f8727e_2
  - defaults/linux-64::mkl==2023.1.0=h213fc3f_46343
  - defaults/linux-64::filelock==3.9.0=py310h06a4308_0
  - defaults/linux-64::tk==8.6.12=h1ccaba5_0
  - defaults/linux-64::gmpy2==2.1.2=py310heeb90bb_0
  - defaults/linux-64::numpy-base==1.25.2=py310hb5e798b_0
  - defaults/linux-64::typing_extensions==4.7.1=py310h06a4308_0
  - defaults/linux-64::mpfr==4.0.2=hb69a4c5_1
  - defaults/linux-64::libuuid==1.41.5=h5eee18b_0
  - defaults/linux-64::networkx==3.1=py310h06a4308_0
  - defaults/linux-64::bzip2==1.0.8=h7b6447c_0
  - defaults/linux-64::pip==23.2.1=py310h06a4308_0
  - defaults/linux-64::setuptools==68.0.0=py310h06a4308_0
  - defaults/linux-64::python==3.10.12=h955ad1f_0
  - defaults/linux-64::mkl_random==1.2.2=py310h1128e8f_1
  - defaults/linux-64::intel-openmp==2023.1.0=hdb19cb5_46305
  - defaults/linux-64::readline==8.2=h5eee18b_0
failed with initial frozen solve. Retrying with flexible solve.
Solving environment: \ 
Found conflicts! Looking for incompatible packages.
```
