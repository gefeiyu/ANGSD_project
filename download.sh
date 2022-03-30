#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH -J download
#SBATCH -e download4.err
#SBATCH -o download4.out
#SBATCH --mem=36G 
#SBATCH -t 24:00:00
#SBATCH -c 6
#SBATCH --nodes=1  
#SBATCH --ntasks=1 

cd /athena/angsd/scratch/gyu4002/Project2/data
count=0
echo "start"

while read line; do  
ERR=$( echo $line | cut -d$' ' -f2  );  
echo $ERR;
r1=$( echo $line | cut -d$' ' -f3 | cut -d$';' -f1);  
r2=$( echo $line | cut -d$' ' -f3 | cut -d$';' -f2);  
treat=$( echo $line | cut -d$' ' -f6); 
hr=$( echo $line | cut -d$' ' -f7); 
wget -O Dmel_${treat}_${hr}_${ERR}_1.fastq.gz $r1; 
wget -O Dmel_${treat}_${hr}_${ERR}_2.fastq.gz $r2; 
echo "Done Dmel_${treat}_${hr}_${ERR}";
let count++;
echo $count;
done  < /athena/angsd/scratch/gyu4002/Project2/Dmel_filereport_read_run_PRJEB15540_tsv4.txt

echo "Done ALL"

