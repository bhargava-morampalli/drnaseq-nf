#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sample1_nf.fastq > sample1_nf.fastq.sam
