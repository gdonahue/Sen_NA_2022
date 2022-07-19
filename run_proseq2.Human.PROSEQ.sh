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
	TMPDIR="/home/gdonahue/Berger.Sen/12232021_Remap/Human/PROSEQ1/$prefix/tmp"
	OUTDIR="/home/gdonahue/Berger.Sen/12232021_Remap/Human/PROSEQ1/$prefix/out"
	mkdir -p "$TMPDIR" "$OUTDIR"
	bsub -M 64000 -n 32 -o proseq.log ../../../proseq2.0-master/proseq2.0.bsh -i "$INDEX" -SE -c "$GENOME" -I "$prefix" -T "$TMPDIR" -O "$OUTDIR" -P --ADAPT_SE=TGGAATTCTCGGGTGCCAAGG --thread=32
	popd
    fi
done

exit 0
