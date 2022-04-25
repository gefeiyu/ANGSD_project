#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH -J hisat2
#SBATCH -e hisat22.err
#SBATCH -o hisat22.out
#SBATCH --mem=12G 
#SBATCH -t 24:00:00
#SBATCH -c 6
#SBATCH --nodes=1  
#SBATCH --ntasks=1 


spack load hisat2@2.1.0
spack load samtools@1.9%gcc@6.3.0

cd /athena/angsd/scratch/gyu4002/Project2/data

  
for file in Dmel_control_50_*_1.fastq.gz; do echo $file; r2=${file%_1.fastq.gz}_2.fastq.gz; echo $r2; hisat2 -q -p 24 -x /athena/angsd/scratch/gyu4002/Project2/ref/bdgp6_tran/genome_tran -1 $file  -2 $r2 | samtools view -@ 24 -b -h -F 4 - | samtools sort -o ${file%_1.fastq.gz}.sorted.bam;  done

echo "Done alignment"


for file in *.sorted.bam; do samtools index $file; done

echo "Done everything"
