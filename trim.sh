#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH -J trim
#SBATCH -e trim.err
#SBATCH -o trim.out
#SBATCH --mem=36G 
#SBATCH -t 24:00:00
#SBATCH -c 6
#SBATCH --nodes=1  
#SBATCH --ntasks=1 

spack load -r trimgalore

cd /athena/angsd/scratch/gyu4002/Project2/data

for file in *.fastq.gz; do trim_galore --illumina $file ;  done

echo "Done ALL"

