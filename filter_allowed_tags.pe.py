#!/opt/software/python/3.6.3/bin/python
# Filters a BED down to only allowed (non-adapter dimer) tags
# Greg Donahue, 11-21-2021

import sys, gzip

def main(args):
    if len(args) != 4: sys.exit("USAGE: filter_allowed_tags.py R1_FASTQ R2_FASTQ BED")
    r1_tags = loadAllowedTags(args[1])
    r2_tags = loadAllowedTags(args[2])
    with open(args[3]) as f:
        for line in f:
            t = line.rstrip().split("\t")
            tag_id = t[3].split("/")[0]
            mate_id = t[3].split("/")[1]
            try:
                if mate_id == "1": x = r1_tags[tag_id]
                else: x = r2_tags[tag_id]
                print(line.rstrip())
            except Exception as e: pass
    
def loadAllowedTags(filename):
    r_tags = dict()
    with gzip.open(filename, mode='rt') as f:
        line = f.readline()
        while line != "":
            r_tags[line.split()[0][1:]] = True
            line = f.readline(); line = f.readline(); line = f.readline(); line = f.readline()
    return r_tags

if __name__ == "__main__": main(sys.argv)
