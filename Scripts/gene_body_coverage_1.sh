#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH -J rseqc1
#SBATCH -e rseqc1.err
#SBATCH -o rseqc1.out
#SBATCH --mem=72G 
#SBATCH -t 48:00:00
#SBATCH -c 6
#SBATCH --nodes=1  
#SBATCH --ntasks=1 

spack load -r py-rseqc@2.6.4

cd /athena/angsd/scratch/gyu4002/Project2/data

for bam in Dmel_control_*.trimmed.sorted.bam; do sample=${bam%%.*}; echo $sample; geneBody_coverage.py  -i $bam -r /athena/angsd/scratch/gyu4002/Project2/ref/annot.bed  -o /athena/angsd/scratch/gyu4002/Project2/data/rseqc_geneBody_coverage/output/${sample}_rseqc_geneBody_coverage.out; done

echo "Done ALL"
