#!/bin/bash
#SBATCH --job-name=corr_Paper_run_SO_v2f
#SBATCH --account=nih@cpu          # use CPU allocation
#SBATCH --qos=qos_cpu-dev          # dev qos (10 jobs, 2h max.)
#SBATCH --mail-user=magdy.morshed.fr@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --nodes=4
#SBATCH --ntasks=4                 # nbr of MPI processes
#SBATCH --ntasks-per-node=1       # Nombre de processus MPI par noeud
#SBATCH --cpus-per-task=40          # nbr of OpenMP threads
#SBATCH --hint=nomultithread       # 1 thread / physical core (no hyperthreading)
#SBATCH --time=02:00:00            # default: 10 minutes on cpu_p1

# go to submit directory (where the .slurm file is)
cd ${SLURM_SUBMIT_DIR}

# clean up modules that have been launched in interactive session
module purge

# load intel modules
# module load intel-all/2021.9.0

# load python modules
module load python

source /gpfswork/rech/nih/ube74zo/MICMAC/.bash_env


export PYSM_LOCAL_DATA=/gpfswork/rech/nih/commun/micmac_soft/pysm-data

echo $PYSM_LOCAL_DATA

# number of OpenMP threads
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
# OpenMP binding
export OMP_PLACES=cores


# export VER=corr_cutsky_SO_d1s1_nside1_v1091b_v1a3
# export additional_config_file=add_corr_cutsky_SO_d1s1_nside1_v1a.toml

export VER=corr_cutsky_SO_d7s0_nside0_v1091b_v2c7
export additional_config_file=add_corr_cutsky_SO_d7s0_nside0_v2c.toml

export SRC_PATH=/gpfswork/rech/nih/ube74zo/MICMAC/MICMAC/test_playground/Paper_runs_v2

srun python $SRC_PATH/script_v109_v5.py $additional_config_file  1> $SRC_PATH/logs/log_$VER.log 2> $SRC_PATH/errs/err_$VER.log

echo "Run finished !"
