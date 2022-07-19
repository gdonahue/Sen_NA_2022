#!/opt/software/python/3.6.3/bin/python
# Filters a BED down to only allowed (non-adapter dimer) tags
# Greg Donahue, 11-21-2021

import sys, gzip

def main(args):
    if len(args) != 3: sys.exit("USAGE: filter_allowed_tags.py FASTQ BED")
    tags = loadAllowedTags(args[1])
    with open(args[2]) as f:
        for line in f:
            t = line.rstrip().split("\t")
            try:
                x = tags[t[3]]
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
