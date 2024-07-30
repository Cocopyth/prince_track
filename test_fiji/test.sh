#!/bin/bash
#Set job requirements
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --partition=rome
#SBATCH --time=01:00:00
apptainer exec --bind $PATH_WHERE_TO_DOWNLOAD:$PATH_WHERE_TO_DOWNLOAD $CODE_BASE_PATH/myimage.sif /bin/bash -c "$CODE_BASE_PATH/test_fiji/run_fiji.sh; echo 'Fiji has finished running'" 

