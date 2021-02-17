#!/bin/bash -ue
mkdir sams
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sample2_nf.fastq > sample2_nf.fastq.sam
