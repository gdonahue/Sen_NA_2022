#!/bin/bash
# Makes a BWA index for the human and mouse genomes
# Greg Donahue, 12-23-2021

module load bwa-0.7.10

bwa index -p hg19/hg19 -a bwtsw hg19/Homo_sapiens.GRCh37.75.dna.primary_assembly.RW.fa
bwa index -p mm10/mm10 -a bwtsw mm10/Mus_musculus.GRCm38.75.dna.primary_assembly.RW.fa

exit 0
