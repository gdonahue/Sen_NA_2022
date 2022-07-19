#!/bin/bash
# Gets AUCs for nascent RNA peaks
# Greg Donahue, 02-02-2022

for locus_file in *.Peaks.bed
do
    for signal_file in *.Pooled.bed
    do
	rpm=$(get_rpm.sh "$signal_file")
	bsub -M 32000 -N -o AUCs/"${locus_file//.Peaks.bed/}"."${signal_file//.bed/.txt}" auc.lnorm.single.py "$locus_file" "$signal_file" "$rpm"
    done
done
