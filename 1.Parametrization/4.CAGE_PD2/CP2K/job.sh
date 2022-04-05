#!/bin/bash
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4    # number of MPI ranks per node (better to set equal gpus per node)     
#SBATCH --ntasks-per-socket=2  # number of MPI ranks per socket 
#SBATCH --cpus-per-task=32     # number of HW threads per task 
#SBATCH --gres=gpu:4           # number of requested gpus per node, can vary between 1 and 4
#SBATCH --mem=230000MB
#SBATCH --time 1:00:00         # format: HH:MM:SS
#SBATCH -A iscrb_polyfuel 
#SBATCH -p m100_usr_prod

module purge
module load profile/chem-phys
module load autoload cp2k
export OMP_NUM_THREADS=8

mpirun -np 16 --map-by socket:PE=8 --rank-by core cp2k.psmp -i resp_constr.inp -o  resp_constr.out
