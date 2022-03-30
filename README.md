# ANGSD_project
Store scripts that were used for ANGSD's project

Contain:

download.sh

fastqc_trim.sh

hisat2_c50.sh  
hisat2_c5.sh  
hisat2_p50.sh  
hisat2_p5.sh  

hisat2_trim.sh  

trim.sh

featurecounts was performed by using command line for loop:


spack load subread
featureCounts -T 5 -f -O -t gene -a /athena/angsd/scratch/gyu4002/Project2/ref/Drosophila_melanogaster.BDGP6.84.gtf -o /athena/angsd/scratch/gyu4002/Project2/data/All_gene_count.txt *.sorted.bam 
