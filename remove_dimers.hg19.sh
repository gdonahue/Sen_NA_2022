#!/bin/bash
# Uses DimerRemover to get adapter dimer-free tags from FASTQs, human and mouse
# Greg Donahue, 11-20-2021

module load java/openjdk-1.8.0

pushd PROCAP1
for file in *.fastq.gz
do
    filename=`basename "$file"`
    mkdir -p "${file//.fastq.gz/.tmp}"/A1 "${file//.fastq.gz/.tmp}"/A2
    pushd "${file//.fastq.gz/.tmp}"/A1
    bsub -M 128000 -o "${filename//.fastq.gz/.out}" java -jar ../../../dimerremover.jar -i ../../"$filename" --output-nodimer "${filename//.fastq.gz/.Without.fastq.gz}" --output-dimer "${filename//.fastq.gz/.With.fastq.gz}" --adapter TGGAATTCTCGGGTGCCAAGG --log "${filename//.fastq.gz/.DR.log}"
    popd
    pushd "${file//.fastq.gz/.tmp}"/A2
    bsub -M 128000 -o "${filename//.fastq.gz/.out}" java -jar ../../../dimerremover.jar -i ../../"$filename" --output-nodimer "${filename//.fastq.gz/.Without.fastq.gz}" --output-dimer "${filename//.fastq.gz/.With.fastq.gz}" --adapter GATCGTCGGACTGTAGAACTCTGAAC --log "${filename//.fastq.gz/.DR.log}"
    popd
done
popd

pushd PROCAP2
for file in *.fastq.gz
do
    filename=`basename "$file"`
    mkdir -p "${file//.fastq.gz/.tmp}"/A1 "${file//.fastq.gz/.tmp}"/A2
    pushd "${file//.fastq.gz/.tmp}"/A1
    bsub -M 128000 -o "${filename//.fastq.gz/.out}" java -jar ../../../dimerremover.jar -i ../../"$filename" --output-nodimer "${filename//.fastq.gz/.Without.fastq.gz}" --output-dimer "${filename//.fastq.gz/.With.fastq.gz}" --adapter TGGAATTCTCGGGTGCCAAGG --log "${filename//.fastq.gz/.DR.log}"
    popd
    pushd "${file//.fastq.gz/.tmp}"/A2
    bsub -M 128000 -o "${filename//.fastq.gz/.out}" java -jar ../../../dimerremover.jar -i ../../"$filename" --output-nodimer "${filename//.fastq.gz/.Without.fastq.gz}" --output-dimer "${filename//.fastq.gz/.With.fastq.gz}" --adapter GATCGTCGGACTGTAGAACTCTGAAC --log "${filename//.fastq.gz/.DR.log}"
    popd
done
popd

pushd PROSEQ1
for file in *.fastq.gz
do
    filename=`basename "$file"`
    mkdir -p "${file//.fastq.gz/.tmp}"/A1 "${file//.fastq.gz/.tmp}"/A2
    pushd "${file//.fastq.gz/.tmp}"/A1
    bsub -M 128000 -o "${filename//.fastq.gz/.out}" java -jar ../../../dimerremover.jar -i ../../"$filename" --output-nodimer "${filename//.fastq.gz/.Without.fastq.gz}" --output-dimer "${filename//.fastq.gz/.With.fastq.gz}" --adapter TGGAATTCTCGGGTGCCAAGG --log "${filename//.fastq.gz/.DR.log}"
    popd
    pushd "${file//.fastq.gz/.tmp}"/A2
    bsub -M 128000 -o "${filename//.fastq.gz/.out}" java -jar ../../../dimerremover.jar -i ../../"$filename" --output-nodimer "${filename//.fastq.gz/.Without.fastq.gz}" --output-dimer "${filename//.fastq.gz/.With.fastq.gz}" --adapter GATCGTCGGACTGTAGAACTCTGAAC --log "${filename//.fastq.gz/.DR.log}"
    popd
done
popd

exit 0
