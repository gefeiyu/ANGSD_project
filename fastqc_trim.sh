#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH -J fastqc
#SBATCH -e fastqc.err
#SBATCH -o fastqc.out
#SBATCH --mem=36G 
#SBATCH -t 24:00:00
#SBATCH -c 6
#SBATCH --nodes=1  
#SBATCH --ntasks=1 

spack load fastqc

cd /athena/angsd/scratch/gyu4002/Project2/data

for file in *_trimmed.fq.gz ; do echo $file;  fastqc -o /athena/angsd/scratch/gyu4002/Project2/data/fastqc_trim_output $file --extract;  echo "Done"; done

echo "Done ALL"
