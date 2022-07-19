#!/bin/bash
# Basic script for track creation
# Greg Donahue, 02-02-2022

if [ -z "$3" ]
then echo "USAGE: ./make_tracks.sh BED_FILE GENOME_FILE RPM"
fi

BED="$1"
GENOME="$2"
RPM="$3"

filename=`basename "$BED"`

mkdir -p "${BED//.bed/.tmp}"
pushd "${BED//.bed/.tmp}"
split.py ../"$filename"
for file in chr*.bed
do
    genomeCoverageBed -bg -i "$file" -g "$GENOME" > tmp.bgr
    normalize.py tmp.bgr "$RPM"
    cat tmp.norm.bgr >> "${filename//.bed/.bgr}"
    rm tmp.bgr tmp.norm.bgr "$file"
done
bedSort "${filename//.bed/.bgr}" "${filename//.bed/.sorted.bgr}"
bedGraphToBigWig "${filename//.bed/.sorted.bgr}" "$GENOME" "${filename//.bed/.bw}"
popd

exit 0
