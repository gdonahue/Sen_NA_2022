#!/opt/software/python/3.6.3/bin/python
# Pulls peaks above a normalized tag count cutoff out of a HOMER output file
# Greg Donahue, 12-13-2021

import sys

def main(args):
    if len(args) != 3: sys.exit("USAGE: pull_peaks.py FILE CUTOFF")
    cutoff = float(args[2])
    with open(args[1]) as f:
        for line in f:
            if len(line) > 1 and line[0] == "#": continue
            t = line.rstrip().split("\t")
            if float(t[5]) > cutoff:
                print(t[1]+"\t"+t[2]+"\t"+t[3]+"\t"+t[0]+"\t"+t[5]+"\t"+t[4])

if __name__ == "__main__": main(sys.argv)
