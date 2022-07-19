#!/opt/software/python/3.6.3/bin/python
# Rewrites a FASTA to exclude the unassembled, alternative haplotype, and random contigs
# Greg Donahue, 12-24-2021

import sys

def main(args):
    if len(args) != 2: sys.exit("USAGE: rewrite_fasta.py FASTA > NEW_FASTA")
    with open(args[1]) as f:
        for line in f:
            if line[0] == ">":
                print_sequence, chromosome = False, ""
                contig = line[1:].rstrip().split()[0]
                try:
                    x = int(contig)
                    print_sequence = True
                    chromosome = "chr"+contig
                except Exception as e:
                    if contig in [ "X", "Y", "MT" ]:
                        print_sequence = True
                        chromosome = "chr"+contig[0]
                if print_sequence: print(">"+chromosome)
            else:
                if print_sequence: print(line, end="")

if __name__ == "__main__": main(sys.argv)
