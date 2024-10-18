#!/usr/bin/env python
# coding=utf-8
"""
Construct a median of medians from a set of chromosomes.

In each level the same chromosome is used. There can be at 
least two levels. The final number of outputs is multiplied
numbers of inputs of all chromosomes.
"""

import os, sys, re

class chromosome:
    @classmethod
    def from_file(cls, fn):
        print( fn)
        text = "".join([x for x in open(fn, "r")])
        m = re.match(r"{(\d+),1,\d+,1,2,2,-?\d+}(.*)\((\d+)\)", text)
        if m:
            inputs, data, output = m.groups()
        self = cls(int(inputs))
        self.output = int(output)

        data = re.split(r"[()]+", data)[1:-1]
       
        data = list(map(lambda x: tuple(
                list(map(
                    int, 
                    re.match(r"\[(\d+),(\d+)\](\d+),(\d+),(\d+)",x).groups()
                ))
            ),data))

        self.data = data
        self.ops = len(data)
        return self

    def __init__(self, inputs = 0):
        self.inputs = inputs
        self.ops = 0
        self.data = []

    def run(self, c, ins):
        """Insert data into chromosome c"""
        d = {}
        for i in range(self.inputs):
            d[i] = ins[i]

        for ida, idb, ina, inb, fn in self.data:
            x, y = c.insert(d[ina], d[inb], fn)
            d[ida] = x
            d[idb] = y
        print (d)
        return d[self.output]

    def insert(self, ida, idb, op):
        n_ida = 2 * self.ops + self.inputs
        n_idb = n_ida + 1
        self.ops += 1

        self.data.append((n_ida, n_idb, ida, idb, op))


        return n_ida, n_idb

    def __str__(self):
        r = []
        print (len(self.data))
        r.append("{%d,1,%d,1,2,2,0}" % (self.inputs, self.ops))

        r += ["([%d,%d]%d,%d,%d)" % x for x in self.data] #.append((n_ida, n_idb, ida, idb, op))
       
        r.append("(%d)" % self.output)
        return "".join(r)

def chunks(l, n):
    """Yield successive n-sized chunks from l."""
    for i in range(0, len(l), n):
        yield l[i:i+n]


if __name__ == "__main__":
    chrom = []

    if len(sys.argv) <= 2:
        print ("Usage", sys.argv[0], " inputs chrom_lev_1 chrom_lev_2 ...")
        print (" total number of inputs is number of (first level x second level x ...) inputs")
        exit(1)

    inputs = int(sys.argv[1])

    for f in sys.argv[2:]:
        print ("Parse", f)
        chrom.append(chromosome.from_file(f))



    level = 0

    outc = chromosome(inputs=inputs)

    ins = range(inputs)

    for c in chrom:
        if inputs % c.inputs != 0:
            print ("Inputs: " , inputs ," divide fail")
            exit(1)

        new_ins = []
        for i in chunks(ins, c.inputs):
            new_ins.append(c.run(outc, i))

        ins = new_ins
        print ("NEW INS", new_ins)
        inputs = len(new_ins)

    if len(ins) != 1:
        print( "Inputs: ", inputs, " on the end != 1 (" , len(ins), ")")
        exit(1)

    outc.output = new_ins[0]

    print (outc)
