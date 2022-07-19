#!/bin/bash
# Makes tracks for all data types
# Greg Donahue, 02-02-2022

G="/home/gdonahue/indexes/hg19/hg19.chrom.sizes"
#for file in Pooled/Human/PROSEQ1/*noRNA.bed
#do
#    rpm=$(get_rpm.sh "$file")
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.M.bed}" "$G" -"$rpm"
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.P.bed}" "$G" "$rpm"
#done

#for file in Pooled/Human/PROCAP1/*Pooled.bed
#do
#    rpm=$(get_rpm.sh "$file")
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.M.bed}" "$G" -"$rpm"
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.P.bed}" "$G" "$rpm"
#done

#for file in Pooled/Human/PROCAP2/*Pooled.bed
#do
#    rpm=$(get_rpm.sh "$file")
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.M.bed}" "$G" -"$rpm"
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.P.bed}" "$G" "$rpm"
#done

G="/home/gdonahue/indexes/mm10/mm10.chrom.sizes"
#for file in Pooled/Mouse/PROCAP1/*Pooled.bed
#do
#    rpm=$(get_rpm.sh "$file")
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.M.bed}" "$G" -"$rpm"
#    bsub -M 32000 ./make_tracks.sh "${file//.bed/.P.bed}" "$G" "$rpm"
#done

for file in Pooled/Mouse/PROCAP2/*Pooled.bed
do
    rpm=$(get_rpm.sh "$file")
    bsub -M 32000 ./make_tracks.sh "${file//.bed/.M.bed}" "$G" -"$rpm"
    bsub -M 32000 ./make_tracks.sh "${file//.bed/.P.bed}" "$G" "$rpm"
done

exit 0
