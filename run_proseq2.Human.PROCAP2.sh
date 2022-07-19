#!/bin/bash
# Runs ProSeq v2 on the human data
# Greg Donahue, 12-01-2021

module load bwa-0.7.10
module load fastx_toolkit-0.0.14
module load samtools-1.1

INDEX="/home/gdonahue/Berger.Sen/12232021_Remap/hg19/hg19"
GENOME="/home/gdonahue/Berger.Sen/12232021_Remap/hg19/hg19.chrom.sizes"

for folder in ./*
do
    if [ -d "$folder" ]
    then
	pushd "$folder"
	prefix=`basename "$folder"`
	TMPDIR="/home/gdonahue/Berger.Sen/12232021_Remap/Human/PROCAP2/$prefix/tmp"
	OUTDIR="/home/gdonahue/Berger.Sen/12232021_Remap/Human/PROCAP2/$prefix/out"
	mkdir -p "$TMPDIR" "$OUTDIR"
	bsub -M 64000 -n 32 -o proseq.log ../../../proseq2.0-master/proseq2.0.bsh -i "$INDEX" -PE -c "$GENOME" -I "$prefix" -T "$TMPDIR" -O "$OUTDIR" --RNA5=R1_5prime --RNA3=R2_5prime --ADAPT1=GATCGTCGGACTGTAGAACTCTGAAC --ADAPT2=TGGAATTCTCGGGTGCCAAGG --thread=32
	popd
    fi
done

exit 0
