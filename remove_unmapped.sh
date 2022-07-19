#!/bin/bash
# Gets rid of unmapped reads in the BAM files
# Greg Donahue, 11-21-2021

module load samtools-1.1

for file in BAMs/hg19/*.bam
do
    bsub -N -o "${file//.bam/.RMU.bam}" -M 32000 samtools view -F 4 -bS "$file"
done

for file in BAMs/mm10/*.bam
do
    bsub -N -o "${file//.bam/.RMU.bam}" -M 32000 samtools view -F 4 -bS "$file"
done

exit 0
