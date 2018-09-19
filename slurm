#overview of system resources
#A partition is a set of compute nodes (computers dedicated to... computing) grouped logically. 
sinfo

#job queue
squeue

#cancel job
scancel <jobid>

#creating a job script (submission script)
#one CPU for 10 minutes with 100MB RAM
#first job step is hostname

*******SCCRIPT********
#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=res.txt
##use partition 'p'
#SBATCH -p p
##use gpu resource
#SBATCH  --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=100

srun hostname
srun sleep 60
************************


#submitting a job
sbatch submit.sh

#job status
squeue --user <username>

#allocate resources
salloc -p <partition_name>

#allocate a node with gpu
salloc -p p --gres=gpu:1

#interactive jobs
srun --pty bash

#cancel a job
scancel --user <username>
scancel <jobid>

