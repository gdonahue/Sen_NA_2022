#!/bin/bash
# Pools over NextSeq lanes
# Greg Donahue, 02-01-2022

#rm Pooled/Human/PROSEQ1/*
#rm Pooled/Human/PROCAP1/*
#rm Pooled/Human/PROCAP2/*
#rm Pooled/Mouse/PROCAP1/*
rm Pooled/Mouse/PROCAP2/*

#cp BEDs/Human/PROSEQ1/*.noRNA.bed Pooled/Human/PROSEQ1
#cat BEDs/Human/PROCAP1/IMR90-PD23-*noRNA.bed >> Pooled/Human/PROCAP1/IMR90-PD23.Pooled.bed
#cat BEDs/Human/PROCAP1/IMR90-PD76-*noRNA.bed >> Pooled/Human/PROCAP1/IMR90-PD76.Pooled.bed
#cat BEDs/Human/PROCAP2/proA*noRNA.bed >> Pooled/Human/PROCAP2/proA.Pooled.bed
#cat BEDs/Human/PROCAP2/proB*noRNA.bed >> Pooled/Human/PROCAP2/proB.Pooled.bed
#cat BEDs/Human/PROCAP2/senA*noRNA.bed >> Pooled/Human/PROCAP2/senA.Pooled.bed
#cat BEDs/Human/PROCAP2/senB*noRNA.bed >> Pooled/Human/PROCAP2/senB.Pooled.bed
#for sample in {YM1,YM2,YF5,YF6,OM1,OM2,OF5,OF6}
#do cat BEDs/Mouse/PROCAP1/"$sample"*.noRNA.bed >> Pooled/Mouse/PROCAP1/"$sample".Pooled.bed
#done
while read line
do
    sample_id=$(echo "$line" | awk -F' ' '{print $1}')
    prefix=$(echo "$line" | awk -F' ' '{print $6}')
    cat BEDs/Mouse/PROCAP2/"$sample_id"*.noRNA.bed >> Pooled/Mouse/PROCAP2/"$prefix".Pooled.bed
    cat BEDs/Mouse/PROCAP2/"$sample_id"*.noRNA.bed >> Pooled/Mouse/PROCAP2/"$prefix"."$sample_id".Pooled.bed
done < samplesheet.txt

exit 0
