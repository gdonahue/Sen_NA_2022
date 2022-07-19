#!/bin/bash
# Gets specific peaks in 3' half of genes, with no promoter presence
# Greg Donahue, 02-03-2022

THREEPRIME="../Anno/RefSeq.ThreePrimeHalf.hg19.bed"
GENCODE="../Anno/GENCODE_3.5kb.hg19.bed"
REFSEQ="../Anno/RefSeq.TSS_7kb.hg19.bed"

BED="$1"
OPP="$2"
if [ -z "$OPP" ]
then
    echo "USAGE: ./filter_cryptic.sh BED OTHER"
    exit 0
fi

bedtools intersect -wa -v -a "$BED" -b "$OPP" > tmp.bed
bedtools intersect -wa -u -a tmp.bed -b "$THREEPRIME" > tmp2.bed
bedtools intersect -wa -v -a tmp2.bed -b "$GENCODE" > tmp3.bed
bedtools intersect -wa -v -a tmp3.bed -b "$REFSEQ" > "${BED//.bed/.Cryptic.bed}"
rm tmp.bed tmp2.bed tmp3.bed

exit 0
