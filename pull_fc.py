#!/opt/software/python/3.6.3/bin/python
# Pulls peaks with fold-change > 10 from AUCs using prescribed comparisons
# Altered to use fold-change, not log2(fold-change)
# Greg Donahue, 02-03-2022

import sys, math

pairs = [ ("IMR90-PD23","IMR90-PD76") ]
cutoff = 4

def main(args):
    for P in pairs:
        A, B = P[0], P[1]
        A_A = loadAUCs("AUCs/"+A+"."+A+".Pooled.txt")
        A_B = loadAUCs("AUCs/"+A+"."+B+".Pooled.txt")
        C = divide(A_A, A_B)
        with open(A+".Peaks."+str(cutoff)+"FC.bed", 'w') as f:
            for peak in C:
                if C[peak] > cutoff:
                    f.write(peak[0]+"\t"+peak[1]+"\t"+peak[2]+"\t.\t"+str(C[peak])+"\t+\n")
        B_A = loadAUCs("AUCs/"+B+"."+A+".Pooled.txt")
        B_B = loadAUCs("AUCs/"+B+"."+B+".Pooled.txt")
        C = divide(B_B, B_A)
        with open(B+".Peaks."+str(cutoff)+"FC.bed", 'w') as f:
            for peak in C:
                if C[peak] > cutoff:
                    f.write(peak[0]+"\t"+peak[1]+"\t"+peak[2]+"\t.\t"+str(C[peak])+"\t+\n")

def divide(A, B):
    r_aucs = dict()
    for k in A: r_aucs[k] = (A[k]+0.01)/(B[k]+0.01)
    return r_aucs

def loadAUCs(filename):
    r_aucs = dict()
    with open(filename) as f:
        for line in f:
            t = line.rstrip().split("\t")
            r_aucs[(t[0],t[1],t[2])] = float(t[3])
    return r_aucs

if __name__ == "__main__": main(sys.argv)
