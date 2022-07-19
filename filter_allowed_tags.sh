#!/bin/bash
# Removes adapter-flagged sequences from BED files
# Single-end: A1 is the only adapter you need to worry about
# Paired-end: R1:A1, R2:A2
# Greg Donahue, 02-01-2022

# HUMAN PROSEQ1
for sample in BEDs/Human/PROSEQ1/*.bed
do
    tmpdir="${sample//_QC.sort.RMU.bed/.tmp}"
    tmpdir="${tmpdir//BEDs/Dimers}"
    fastq=$(ls "$tmpdir"/A1/*.Without.fastq.gz)
    bsub -M 32000 -N -o "${sample//.bed/.RMDIM.bed}" ./filter_allowed_tags.se.py "$fastq" "$sample"
done

# HUMAN PROCAP1
for sample in BEDs/Human/PROCAP1/*.bed
do
    tmpdir="${sample//_QC.sort.RMU.bed/.tmp}"
    tmpdir="${tmpdir//BEDs/Dimers}"
    fastq=$(ls "$tmpdir"/A1/*.Without.fastq.gz)
    bsub -M 32000 -N -o "${sample//.bed/.RMDIM.bed}" ./filter_allowed_tags.se.py "$fastq" "$sample"
done

# HUMAN PROCAP2
for sample in BEDs/Human/PROCAP2/*.bed
do
    r1_tmpdir="${sample//_QC_end.sort.RMU.bed/_R1.tmp}"
    r1_tmpdir="${r1_tmpdir//BEDs/Dimers}"
    r1_fastq=$(ls "$r1_tmpdir"/A1/*.Without.fastq.gz)
    r2_tmpdir="${sample//_QC_end.sort.RMU.bed/_R2.tmp}"
    r2_tmpdir="${r2_tmpdir//BEDs/Dimers}"
    r2_fastq=$(ls "$r2_tmpdir"/A2/*.Without.fastq.gz)
    bsub -M 32000 -N -o "${sample//.bed/.RMDIM.bed}" ./filter_allowed_tags.pe.py "$r1_fastq" "$r2_fastq" "$sample"
done

# MOUSE PROCAP1
for sample in BEDs/Mouse/PROCAP1/*.bed
do
    tmpdir="${sample//_QC.sort.RMU.bed/.tmp}"
    tmpdir="${tmpdir//BEDs/Dimers}"
    fastq=$(ls "$tmpdir"/A1/*.Without.fastq.gz)
    bsub -M 32000 -N -o "${sample//.bed/.RMDIM.bed}" ./filter_allowed_tags.se.py "$fastq" "$sample"
done

# MOUSE PROCAP2
for sample in BEDs/Mouse/PROCAP2/*.bed
do
    r1_tmpdir="${sample//_QC_end.sort.RMU.bed/_R1.tmp}"
    r1_tmpdir="${r1_tmpdir//BEDs/Dimers}"
    r1_fastq=$(ls "$r1_tmpdir"/A1/*.Without.fastq.gz)
    r2_tmpdir="${sample//_QC_end.sort.RMU.bed/_R2.tmp}"
    r2_tmpdir="${r2_tmpdir//BEDs/Dimers}"
    r2_fastq=$(ls "$r2_tmpdir"/A2/*.Without.fastq.gz)
    bsub -M 32000 -N -o "${sample//.bed/.RMDIM.bed}" ./filter_allowed_tags.pe.py "$r1_fastq" "$r2_fastq" "$sample"
done

exit 0
